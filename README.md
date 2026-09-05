# Flutter Playground

Projeto didático usado para comparar widgets `StatelessWidget` e
`StatefulWidget`, além de praticar organização de arquivos, navegação por rotas
nomeadas e consumo de uma API no Flutter.

No estado atual, o aplicativo possui:

- uma tela inicial com as opções **Statelles Counter**, **Statefull Counter** e
  **Products Page**;
- navegação por rotas nomeadas, declaradas no `MaterialApp` com
  `initialRoute` + `routes` e acionadas por `Navigator.pushNamed`;
- um contador sem estado, que incrementa internamente uma variável, mas não
  atualiza a tela;
- um contador com estado, que atualiza a tela por meio de `setState`;
- uma página que consome a API `https://dummyjson.com/products` e exibe a
  resposta em texto.

> Os textos dos botões, os comentários e a nomenclatura dos arquivos foram
> mantidos como estão no código atual (inclusive o nome `Statefull` no arquivo
> do contador com estado).

## Pré-requisitos

- Flutter instalado e disponível no terminal;
- um dispositivo físico, emulador ou navegador configurado;
- editor com suporte a Dart e Flutter (opcional).

Confirme a instalação:

```bash
flutter doctor
```

## Criando o projeto

Crie o projeto somente com suporte às plataformas Android e iOS e entre na
pasta gerada:

```bash
flutter create --platforms=android,ios flutter_playground
cd flutter_playground
```

A opção `--platforms=android,ios` evita a geração das estruturas para Web,
Windows, macOS e Linux, mantendo no projeto apenas as plataformas utilizadas
neste exemplo.

A partir daqui, todos os caminhos são relativos à raiz do projeto.

## 1. Organizando a aplicação

Dentro de `lib`, crie a pasta das páginas:

```text
lib/
├── main.dart
└── src/
    ├── app.dart
    └── pages/
        ├── counter_statefull_page.dart
        ├── counter_stateless_page.dart
        ├── home_page.dart
        └── products_page.dart
```

Substitua o conteúdo de `lib/main.dart` para deixar o ponto de entrada apenas
com a responsabilidade de iniciar a aplicação:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_playground/src/app.dart';

void main() {
  runApp(const App());
}
```

## 2. Criando o widget raiz

Crie `lib/src/app.dart`. O `MaterialApp` define o título da aplicação, a rota
inicial (`/`) e o mapa de rotas nomeadas usado na navegação:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/counter_statefull_page.dart';
import 'package:flutter_playground/src/pages/counter_stateless_page.dart';
import 'package:flutter_playground/src/pages/home_page.dart';
import 'package:flutter_playground/src/pages/products_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/counter_stateless': (context) => CounterStatelessPage(),
        '/counter_statefull': (context) => const CounterStatefullPage(),
        '/products': (context) => const ProductsPage(),
      }
    );
  }
}
```

Em vez de montar cada tela na hora com `Navigator.push` e
`MaterialPageRoute`, as rotas são registradas uma única vez no `routes`. Para
navegar, bastar usar `Navigator.pushNamed(context, '/rota')`.

## 3. Criando a tela inicial

Crie `lib/src/pages/home_page.dart` com três botões centralizados. Cada um usa
`Navigator.pushNamed` para empilhar a respectiva tela:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/counter_statefull_page.dart';
import 'package:flutter_playground/src/pages/counter_stateless_page.dart';
import 'package:flutter_playground/src/pages/products_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Playground')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: .max,
          mainAxisAlignment: .center,
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(width: double.infinity),
            FilledButton(onPressed: () {
              Navigator.pushNamed(context, '/counter_stateless');
            }, child: Text('Statelles Counter')),
            FilledButton(onPressed: () {
              Navigator.pushNamed(context, '/counter_statefull');
            }, child: Text('Statefull Counter')),
            FilledButton(onPressed: () {
              Navigator.pushNamed(context, '/products');
            }, child: Text('Products Page')),
          ],
        ),
      ),
    );
  }
}
```

## 4. Criando o contador sem estado

Crie `lib/src/pages/counter_stateless_page.dart`:

```dart
import 'dart:developer';

import 'package:flutter/material.dart';

class CounterStatelessPage extends StatelessWidget {
  CounterStatelessPage({super.key});

  int _counter = 0;

  void _increment() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    log('CounterStatelessPage build called');
    return Scaffold(
      appBar: AppBar(title: Text('Stateless Counter')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text(_counter.toString(), style: Theme.of(context).textTheme.displayLarge),
        ],
      ),
      // Atenção: O FAB Button estara fora da coluna, mas dentro do Scaffold, para que ele fique no canto inferior direito da tela
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increment();
          log('Counter: $_counter');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

Essa tela herda de `StatelessWidget`. A variável `_counter` é incrementada no
tap, mas, como não há `setState`, o `build` de StatelessWidget não é re-executado
na reconstrução e o número exibido permanece em `0`. É possível observar pelo
log emitido com `dart:developer` que o `build` só roda uma vez, enquanto o valor
interno incrementa silenciosamente. O objetivo desta etapa é evidenciar essa
limitação antes da implementação com `StatefulWidget`.

## 5. Criando o contador com estado

Crie `lib/src/pages/counter_statefull_page.dart`:

```dart
import 'dart:developer';
import 'package:flutter/material.dart';

class CounterStatefullPage extends StatefulWidget {
  const CounterStatefullPage({super.key});

  @override
  State<CounterStatefullPage> createState() => _CounterStatefullPageState();
}

class _CounterStatefullPageState extends State<CounterStatefullPage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    log('CounterStatefullPage build called');
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Counter')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text(
            _counter.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
      // Atenção: O FAB Button estara fora da coluna, mas dentro do Scaffold, para que ele fique no canto inferior direito da tela
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increment();
          log('Counter: $_counter');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

Diferente do exemplo anterior, o `StatefulWidget` mantém o estado em
`_CounterStatefullPageState`. Ao chamar `setState`, o Flutter marca o widget
como "sujo" e só então reexecuta o `build`, atualizando o número na tela. No log,
cada tap dispara um novo `build called`.

## 6. Criando a página de produtos

Essa página consome a API pública `https://dummyjson.com/products`. Para fazer a
requisição HTTP, adicione o pacote `http`:

```bash
flutter pub add http
```

O pacote já estará listado nas `dependencies` do `pubspec.yaml`.

Crie `lib/src/pages/products_page.dart`:

```dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String? data;

  Future<String> _fetchData() async {
    await Future.delayed(Duration(seconds: 5)); // Simulate network delay
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );
    if (response.statusCode != 200) throw Exception('Failed to load data');
    log('Data fetched: ${response.body}');
    return response.body;
  }

  @override
  void initState() {
    _fetchData().then((value) => setState(() => data = value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products Page')),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  data ?? 'No data',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
    );
  }
}
```

A busca dos dados começa em `initState`, guardando o resultado em `data`. Enquanto
`data` é `null`, a tela mostra um `CircularProgressIndicator`; depois, exibe o
conteúdo bruto da resposta em texto.

## 7. Instalando as dependências e executando

Baixe as dependências declaradas em `pubspec.yaml`:

```bash
flutter pub get
```

Confira os dispositivos disponíveis e execute o aplicativo:

```bash
flutter devices
flutter run
```

Para executar diretamente no Chrome:

```bash
flutter run -d chrome
```

## Resultado esperado

Ao iniciar, a aplicação mostra a barra **Flutter Playground** e os três botões.

- Ao selecionar **Statelles Counter**, uma nova tela é aberta com o número `0` e
  um botão `+` no canto inferior direito. Pressionar esse botão não altera o
  valor exibido, mas incrementa o contador interno (visível nos logs).
- Ao selecionar **Statefull Counter**, o `+` incrementa o número na tela
  normalmente, reexecutando o `build` a cada tap.
- Ao selecionar **Products Page**, um `CircularProgressIndicator` fica visível
  por alguns segundos e, em seguida, o corpo da resposta da API é exibido em
  texto.

## Verificações

Analise o código com:

```bash
flutter analyze
```

O arquivo `test/widget_test.dart` ainda é o teste de contador criado pelo
template padrão do Flutter e referencia `MyApp`, que já não existe após a
organização feita acima. Portanto, `flutter test` somente voltará a passar
depois que esse teste for adaptado ao widget `App` e ao fluxo atual.