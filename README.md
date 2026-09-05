# Flutter Playground

Projeto didático usado para comparar widgets `StatelessWidget` e
`StatefulWidget`, além de praticar organização de arquivos e navegação entre
telas no Flutter.

No estado atual, o aplicativo possui:

- uma tela inicial com as opções **Statelles Counter** e **Statefull Counter**;
- navegação para a tela **Stateless Counter** pelo primeiro botão;
- um contador sem estado, que exibe sempre `0`;
- um `FloatingActionButton` ainda sem comportamento.

> Os textos dos botões e o comportamento vazio foram mantidos como estão no
> código atual. A implementação do contador com estado fica para uma próxima
> etapa.

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
        ├── counter_stateless_page.dart
        └── home_page.dart
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

Crie `lib/src/app.dart`. O `MaterialApp` define o título da aplicação e usa a
`HomePage` como tela inicial:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      home: const HomePage(),
    );
  }
}
```

## 3. Criando a tela inicial

Crie `lib/src/pages/home_page.dart` com dois botões centralizados. O primeiro
usa `Navigator.push` e `MaterialPageRoute` para empilhar a tela do contador. O
segundo ainda não executa nenhuma ação.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/counter_stateless_page.dart';

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
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterStatelessPage(),
                  ),
                );
              },
              child: Text('Statelles Counter'),
            ),
            FilledButton(onPressed: () {}, child: Text('Statefull Counter')),
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
import 'package:flutter/material.dart';

class CounterStatelessPage extends StatelessWidget {
  const CounterStatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless Counter')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text('0', style: Theme.of(context).textTheme.displayLarge),
        ],
      ),
      // O FAB fica fora da Column e dentro do Scaffold para aparecer no canto
      // inferior direito da tela.
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
```

Essa tela herda de `StatelessWidget`. Por isso, não mantém um valor mutável e o
número permanece em `0`, mesmo quando o botão `+` é pressionado. O objetivo
desta etapa é evidenciar essa limitação antes da implementação com
`StatefulWidget`.

## 5. Instalando as dependências e executando

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

Ao iniciar, a aplicação mostra a barra **Flutter Playground** e os dois botões.
Ao selecionar **Statelles Counter**, uma nova tela é aberta com o número `0` no
centro e um botão `+` no canto inferior direito. Pressionar esse botão ainda não
altera o valor.

## Verificações

Analise o código com:

```bash
flutter analyze
```

O arquivo `test/widget_test.dart` ainda é o teste de contador criado pelo
template padrão do Flutter e referencia `MyApp`, que já não existe após a
organização feita acima. Portanto, `flutter test` somente voltará a passar
depois que esse teste for adaptado ao widget `App` e ao fluxo atual.
