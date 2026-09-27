# Flutter Playground

Projeto didático de Flutter para estudar widgets, estado local, navegação,
requisições HTTP e compartilhamento de estado entre telas. A etapa atual usa o
pacote **Provider** para alterar a cor do tema e o modo claro/escuro em toda a
aplicação.

## As duas versões do exemplo

| Branch | Implementação | O que demonstra |
| --- | --- | --- |
| [`main`](https://github.com/F290-PDM2/flutter_playground/tree/main) | `ChangeNotifier` + pacote `provider` | Cor do tema e brightness compartilhados |
| [`inheritedwidget`](https://github.com/F290-PDM2/flutter_playground/tree/inheritedwidget) | `StatefulWidget` + `InheritedWidget` | Brightness compartilhado sem o pacote Provider |

O nome da branch é `inheritedwidget`, no singular. Os commits de referência são
`7c21fc9` (**Pacote Provider**) e `c157767` (**Exemplo InheritedWidget**).
Este tutorial explica primeiro a versão da `main` e depois a implementação
preservada na outra branch.

## 1. Preparando e executando o projeto

É necessário ter Git, Flutter e um dispositivo ou navegador configurado.
O `pubspec.yaml` exige Dart `^3.13.0`; use uma versão do Flutter que inclua um
SDK compatível. Android, iOS e Web já possuem estrutura neste repositório.
Para executar no iOS, é necessário macOS com Xcode configurado.

```bash
git clone https://github.com/F290-PDM2/flutter_playground.git
cd flutter_playground
flutter doctor
flutter pub get
flutter devices
flutter run
```

Se você já clonou o projeto, execute os comandos Flutter na pasta existente.
Para usar o navegador Chrome:

```bash
flutter run -d chrome
```

Não é necessário executar `flutter create` para acompanhar este repositório.

## 2. Conhecendo os exemplos e a organização

A tela inicial oferece contadores, produtos, citações e exemplos de Material
Design. O menu lateral contém **Configurações**, que abre a rota `/settings`.
As rotas nomeadas estão registradas em [app.dart](lib/src/app.dart).

| Exemplo | Conceito trabalhado |
| --- | --- |
| Stateless Counter | Alterar uma variável não solicita uma reconstrução da interface |
| Statefull Counter | Estado local em um objeto `State`, atualizado com `setState` |
| Products | Requisições HTTP, dados de produtos e navegação |
| Quote | Requisição de uma citação e conversão de JSON |
| Material Design | Componentes e estilos visuais |
| Configurações | Estado do tema compartilhado por Provider |

No contador sem estado, o botão incrementa `_counter` e imprime o valor no
console, mas essa alteração sozinha não agenda um novo `build`. A tela não
acompanha os cliques como no contador com `setState`. Manter um campo mutável
em um `StatelessWidget` é parte dessa demonstração, não um padrão recomendado.
Um `StatelessWidget` também pode reconstruir quando suas dependências mudam —
como acontece com `App` e `SettingsPage` ao observar o tema.

Os arquivos centrais desta etapa são:

```text
lib/
├── main.dart                          # Registra o provider acima de App
└── src/
    ├── app.dart                       # Constrói o tema e registra as rotas
    ├── providers/
    │   └── theme_rovider.dart          # Estado e operações do tema
    └── pages/
        ├── home_page.dart             # Menu de acesso às configurações
        └── settings_page.dart         # Controles de brightness e cor
```

**Atenção aos nomes existentes:** o arquivo na `main` se chama
`theme_rovider.dart` (sem o primeiro `p` de `provider`) e o método se chama
`toogleBrightness`. Os exemplos abaixo preservam esses nomes para corresponder
aos imports e chamadas do projeto.

## 3. A dependência Provider

O [pubspec.yaml](pubspec.yaml) já declara:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.5+1
```

O trecho mostra apenas as dependências relevantes ao tema; mantenha as demais.
Para este repositório, basta `flutter pub get`. Ao reproduzir a aula em outro
projeto, adicione a mesma restrição com:

```bash
flutter pub add 'provider:^6.1.5+1'
```

## 4. Centralizando o estado em ThemeProvider

Em [theme_rovider.dart](lib/src/providers/theme_rovider.dart), `ThemeProvider`
estende `ChangeNotifier`. O núcleo da classe é este recorte:

```dart
class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = false;
  Color colorTheme = Colors.blue;

  void changeColor(Color color) {
    colorTheme = color;
    notifyListeners();
  }

  void toogleBrightness(bool value) {
    isDarkTheme = value;
    notifyListeners();
  }
}
```

Há **um único provider com duas propriedades**, não dois providers separados.
`isDarkTheme` começa em `false`, e `colorTheme` começa em `Colors.blue`.
Os métodos alteram o estado e chamam `notifyListeners()` para comunicar a mudança.
A classe completa também possui `getColorName`, que associa cores Material aos
nomes exibidos no seletor.

Não altere diretamente os campos pela tela: uma atribuição como
`provider.colorTheme = Colors.red` não chama `notifyListeners()`. Use
`changeColor` e `toogleBrightness` para manter a interface sincronizada.

## 5. Disponibilizando o provider acima da aplicação

O [main.dart](lib/main.dart) envolve `App` com `ChangeNotifierProvider`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_playground/src/app.dart';
import 'package:flutter_playground/src/providers/theme_rovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: App(),
    ),
  );
}
```

Assim, `App` e as páginas criadas pelo `MaterialApp` acessam a mesma instância.
Se o provider estivesse apenas dentro da tela de configurações, `App`, que está
acima dela, não conseguiria consultá-lo para construir o tema.

`create` fornece a nova instância, e `ChangeNotifierProvider` gerencia seu
descarte ao sair da árvore. Essa é a forma usada aqui para criar o objeto;
`.value` é destinado a expor uma instância já existente.
Veja a [documentação do pacote Provider](https://pub.dev/packages/provider).

## 6. Construindo o tema a partir do estado

Dentro de `App.build`, o código consulta o provider e cria um `ThemeData`:

```dart
final darkBrightnesProvider = context.watch<ThemeProvider>();
final color = context.watch<ThemeProvider>().colorTheme;
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: darkBrightnesProvider.isDarkTheme
        ? Brightness.dark
        : Brightness.light,
    seedColor: color,
  ),
);
```

Esse `theme` é passado para `MaterialApp(theme: theme, ...)`, mantendo as rotas
já registradas. As duas chamadas a `watch` obtêm a mesma instância de
`ThemeProvider`; o nome da variável não cria outro provider.

`isDarkTheme` determina `Brightness.dark` ou `Brightness.light`. A cor escolhida
é a semente de `ColorScheme.fromSeed`, que gera o esquema de cores; ela não é
uma atribuição direta a todas as cores dos componentes. O tema ativo vem dessa
variável local `theme`, não do campo antigo `lightTheme` ainda presente no arquivo.

## 7. Alterando brightness e cor nas configurações

Em [settings_page.dart](lib/src/pages/settings_page.dart), a leitura acontece
no início do `build`:

```dart
final provider = context.watch<ThemeProvider>();
```

O interruptor reflete o valor compartilhado e chama o método de atualização:

```dart
SwitchListTile(
  title: Text('Tema escuro'),
  subtitle: Text('Modifica o brightness do aplicativo'),
  value: provider.isDarkTheme,
  onChanged: (value) => provider.toogleBrightness(value),
),
```

O seletor usa `Colors.primaries` para montar as opções:

```dart
DropdownMenu<Color>(
  expandedInsets: EdgeInsets.symmetric(horizontal: 16),
  leadingIcon: Icon(Icons.palette, color: provider.colorTheme),
  onSelected: (value) => provider.changeColor(value!),
  dropdownMenuEntries: [
    for (var color in Colors.primaries)
      DropdownMenuEntry(
        value: color,
        label: provider.getColorName(color) ?? 'Cor',
        leadingIcon: Icon(Icons.palette, color: color),
      ),
  ],
  hintText: 'Escolha uma cor',
  label: Text('Cor primária'),
),
```

Este é o comportamento implementado. O `value!` pressupõe uma seleção não nula.
O seletor não define `initialSelection`: ao reabrir a página, o texto do campo
pode não representar a cor já guardada, embora o tema e o ícone continuem usando
`colorTheme`.

O fluxo de atualização é:

```text
Interação em SettingsPage
  → changeColor(...) ou toogleBrightness(...)
  → alteração do estado + notifyListeners()
  → consumidores com watch são notificados
  → App reconstrói ThemeData e SettingsPage atualiza seus controles
```

Não é necessário transformar `SettingsPage` em `StatefulWidget`: o estado do
tema pertence ao `ThemeProvider`.

### watch, read e select

| API | Uso |
| --- | --- |
| `context.watch<ThemeProvider>()` | Lê e observa mudanças; usado no `build` de `App` e `SettingsPage` |
| `context.read<ThemeProvider>()` | Obtém o objeto sem observar mudanças; útil em callbacks |
| `context.select<ThemeProvider, bool>((p) => p.isDarkTheme)` | Observa apenas o valor selecionado |

Na implementação atual, os callbacks usam a referência obtida com `watch`.
Como alternativa didática, um callback pode fazer a leitura no momento da ação:

```dart
onChanged: (value) {
  context.read<ThemeProvider>().toogleBrightness(value);
},
```

Isso não substitui o `watch` usado para renderizar o valor do interruptor.
`read` sozinho não faz a tela acompanhar mudanças. `select` é uma possibilidade
para consumidores menores; não é usado nesta versão.
Essas APIs estão descritas na [seção de leitura do Provider](https://pub.dev/packages/provider#reading-a-value).

## 8. Estudando a versão com InheritedWidget

A implementação anterior está na branch
[`inheritedwidget`](https://github.com/F290-PDM2/flutter_playground/tree/inheritedwidget).
Para executá-la, encerre o aplicativo e deixe suas alterações locais salvas em
commit ou stash antes de trocar de branch:

```bash
git switch inheritedwidget
flutter pub get
flutter run
```

Se a branch ainda não existir localmente:

```bash
git fetch origin
git switch --track origin/inheritedwidget
```

Nessa versão, os arquivos principais são
[`theme_provider.dart`](https://github.com/F290-PDM2/flutter_playground/blob/inheritedwidget/lib/src/providers/theme_provider.dart)
e [`theme_scope.dart`](https://github.com/F290-PDM2/flutter_playground/blob/inheritedwidget/lib/src/providers/theme_scope.dart).
Apesar do nome `ThemeProvider`, a classe é um `StatefulWidget` próprio do projeto,
não uma classe do pacote `provider`.

### Quem mantém o estado

`_ThemeProviderState` guarda `_isDark` e o atualiza com `setState`. Seu `build`
entrega o valor e a função de alteração ao `ThemeScope`:

```dart
bool _isDark = false;

void _toogle(bool value) => setState(() => _isDark = value);

@override
Widget build(BuildContext context) {
  return ThemeScope(
    isDarkTheme: _isDark,
    toogleBrightness: _toogle,
    child: widget.child,
  );
}
```

O ponto de entrada usa `runApp(ThemeProvider(child: App()))`.
O estado mutável fica no `State`; `ThemeScope` compartilha os valores com os
descendentes.

### Quem distribui o estado

`ThemeScope` estende `InheritedWidget` e expõe `isDarkTheme` e
`toogleBrightness`. Seu método `of` registra a dependência do consumidor.
Abaixo, o tipo genérico está explícito para facilitar a leitura; na branch ele
é inferido pelo tipo de retorno:

```dart
static ThemeScope of(BuildContext context) {
  return context.dependOnInheritedWidgetOfExactType<ThemeScope>()!;
}

@override
bool updateShouldNotify(ThemeScope oldWidget) {
  return oldWidget.isDarkTheme != isDarkTheme;
}
```

Quando o `State` reconstrói o escopo, `updateShouldNotify` compara o brightness
anterior com o novo. Se mudou, os consumidores que dependem do escopo são
notificados. O `!` em `of` pressupõe que existe um `ThemeScope` ancestral.
Veja [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
e [updateShouldNotify](https://api.flutter.dev/flutter/widgets/InheritedWidget/updateShouldNotify.html).

### Quem consome o estado

`App` e `SettingsPage` consultam `ThemeScope.of(context)`. Em `App`, o tema é:

```dart
final provider = ThemeScope.of(context);
// Dentro de MaterialApp:
theme: provider.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
```

O interruptor chama `provider.toogleBrightness(value)`, que chega ao `setState`
do widget responsável pelo estado. Essa branch demonstra apenas a alternância
de brightness; ela não contém o seletor de cores da versão Provider.

Para voltar ao exemplo atual, encerre a execução e use:

```bash
git switch main
flutter pub get
flutter run
```

### Comparando as responsabilidades

| Responsabilidade | Branch `inheritedwidget` | Branch `main` |
| --- | --- | --- |
| Guardar estado | `_ThemeProviderState` | `ThemeProvider extends ChangeNotifier` |
| Disponibilizar estado | `ThemeScope` | `ChangeNotifierProvider` |
| Consultar e observar | `ThemeScope.of(context)` | `context.watch<ThemeProvider>()` |
| Comunicar alterações | `setState` + `updateShouldNotify` | `notifyListeners()` |
| Personalização | Claro/escuro | Claro/escuro e cor semente |

O pacote Provider se apoia no mecanismo de `InheritedWidget` e simplifica o
compartilhamento e o ciclo de vida dos objetos. Estudar a branch anterior ajuda
a compreender o mecanismo que a biblioteca encapsula.

## 9. Conferindo o resultado

Na `main`, siga este roteiro:

1. Inicie o aplicativo: o tema começa claro, com semente azul.
2. Abra o menu lateral e selecione **Configurações**.
3. Ative **Tema escuro**: os componentes que usam o tema devem adotar o modo escuro.
4. Escolha outra **Cor primária**: o esquema visual deve acompanhar a nova semente.
5. Volte à tela inicial e abra **Material Design** para observar o tema compartilhado.
6. Retorne às configurações: o brightness e a cor permanecem no provider durante a execução.
7. Faça um hot restart ou encerre e abra o app: o estado retorna a claro e azul.

As preferências ficam somente em memória; não há persistência em disco nem
seleção automática baseada no tema do sistema. Hot reload pode preservar o
estado e não equivale a reiniciar a aplicação.

Na branch `inheritedwidget`, repita a verificação do interruptor. Não espere
encontrar o menu de cores nessa versão.

### Análise e testes existentes

```bash
flutter analyze
flutter test
```

Esses comandos servem para verificar o projeto, mas a suíte atual ainda precisa
de adaptação. [widget_test.dart](test/widget_test.dart) monta `App()` sem
`ChangeNotifierProvider`, embora `App` use `context.watch<ThemeProvider>()`.
Além disso, procura um contador diretamente na tela inicial, que agora é um menu.

Para adaptar esse teste, será necessário envolver `App` no mesmo provider de
`main.dart`, navegar até o contador com estado e só então verificar o incremento.
Um teste de tema deve abrir as configurações e verificar a mudança de brightness
e cor. Esses são próximos passos de teste, não funcionalidades já implementadas
por esta atualização do tutorial.

## Leitura complementar

- [Provider: uso e gerenciamento de instâncias](https://pub.dev/packages/provider)
- [InheritedWidget: compartilhamento pela árvore de widgets](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
- [ChangeNotifier: notificações de mudança](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
