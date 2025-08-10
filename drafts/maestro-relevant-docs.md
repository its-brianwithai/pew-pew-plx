# Maestro Relevant Docs

```
<github actions for flutter>
# Maestro GitHub Action for Flutter

{% hint style="info" %}
🚀 **Cloud Plan** required - get started for free at [**maestro.dev**](https://www.maestro.dev/)
{% endhint %}

## Android

```yaml
name: Build and run Maestro tests (Flutter Android)

on:
  workflow_dispatch:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  upload:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          channel: "stable"
      - run: flutter build apk --debug
      - uses: mobile-dev-inc/action-maestro-cloud@v1
        with:
          api-key: ${{ secrets.MAESTRO_CLOUD_API_KEY }}
          # note that you can supply the project id any way you like, it is not secret
          project-id: ${{ secrets.MAESTRO_PROJECT_ID }}
          app-file: build/app/outputs/flutter-apk/app-debug.apk
```

## iOS

```yaml
name: Build and run Maestro tests (Flutter iOS)

on:
  workflow_dispatch:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  ios:
    runs-on: macos-13
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          channel: "stable"
      - run: flutter build ios --debug --simulator
      - uses: mobile-dev-inc/action-maestro-cloud@v1
        with:
          api-key: ${{ secrets.MAESTRO_CLOUD_API_KEY }}
          # note that you can supply the project id any way you like, it is not secret
          project-id: ${{ secrets.MAESTRO_PROJECT_ID }}
          app-file: build/ios/iphonesimulator/Runner.app # replace `Runner` with your app name
```

</github actions for flutter>
```

```
<flutter instructions>
# Flutter

<figure><img src="https://2384395183-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2Fn5KVIOjVkVjYRyVWZ0yT%2Fuploads%2FbaQ0SG0bNxQ9iHZ8H1ag%2Fflutter.png?alt=media&#x26;token=b6dad5cf-349c-4712-a78b-673029ea752b" alt=""><figcaption></figcaption></figure>

Flutter is a first class citizen for Maestro. It can test both pure and hybrid (i.e [add-to-app](https://docs.flutter.dev/add-to-app)) Flutter mobile apps.

## Interacting with widgets by semantics label

Maestro can interact with widgets that have semantics information attached. By default, this includes all widgets that display text (`data` in the Text widget, `hintText` in the TextField, and so on). You can also attach semantics information to any widget using Flutter's [Semantics widget](https://api.flutter.dev/flutter/widgets/Semantics-class.html).

### Example: Tap on a widget

Given an `InkWell` widget with a `Text` widget child:

{% code fullWidth="false" %}
```dart
InkWell(
  child: Text('Open Browser'),
  onTap: () => launch('https://mobile.dev'),
)
```
{% endcode %}

The following command will tap on it:

```yaml
- tapOn: Open Browser
```

***

Some widget, such as `Icon`, don't have implicit semantics. In such cases you can often pass a `semanticLabel`:

```dart
FloatingActionButton(
  onPressed: _incrementCounter,
  child: Icon(Icons.add, semanticLabel: 'fabAddIcon'),
)
```

Then the `FloatingActionButton` can be interacted with using the following command:

```yaml
- tapOn: fabAddIcon
```

{% hint style="info" %}
The `Icon` widget simply creates a `Semantics` widget itself – [see the source](https://github.com/flutter/flutter/blob/3.16.0/packages/flutter/lib/src/widgets/icon.dart#L303-L314).
{% endhint %}

***

Finally, you can wrap any widget with [Semantics](https://api.flutter.dev/flutter/widgets/Semantics-class.html):

```dart
Semantics(
  label: 'funky yellow box',
  child: Container(
    color: Colors.yellow,
    width: 100,
    height: 100,
  ),
)
```

```yaml
- tapOn: funky yellow box
```

### Example: Enter text in a widget

To enter text in the following text field widget:

```dart
TextField(
  decoration: InputDecoration(
    border: UnderlineInputBorder(), 
    labelText: 'Enter your username',
  ),
)
```

Use this command:

```yaml
- tapOn: Enter your username
- inputText: charlie_root
```

### Example: Assert a widget is visible

```dart
Text(
  'Welcome back, dear $fullName! 👋🎉',
  semanticsLabel: 'Welcome back, dear $fullName!',
),
```

```yaml
- assertVisible: Welcome back, dear Test User!
```

{% hint style="info" %}
In cases where both `semanticLabel` and text label are provided (like above), the `semanticLabel` takes precedence. It's recommended to use `maestro studio` in such cases to easily identify what label to use.
{% endhint %}

## Interacting with widgets by semantic identifier

When your app grows, testing often becomes harder.

Maybe the app gets multi-language support, and now you have to decide on the language in which you test it. Maybe some of the strings displayed are non-static (e.g. becase of A/B tests). And the sheer number of screens makes tests harder to maintain.

When you start facing these problems, you should consider using the **accessibility identifier** instead of semantics labels.

{% hint style="info" %}
This is a new feature that [we contributed to Flutter](https://github.com/flutter/engine/pull/47961) to make it easier to test apps made with it. It's available on the stable channel since Flutter 3.19 (released on February 15th, 2024). To use it, upgrade to the latest stable Flutter release:

```
flutter channel stable
flutter upgrade
```
{% endhint %}

### Example: Tap on a widget by semantics identifier

```dart
Semantics(
  identifier: 'signin_button',
  child: ElevatedButton(
    onPressed: _signIn,
    child: Text('Sign in'),
  ),
)
```

```yaml
- tapOn:
    id: signin_button
```

### Example: Enter text in a widget by semantics identifier

```dart
Semantics(
  identifier: 'username_textfield',
  child: TextField(
    decoration: InputDecoration(
      border: UnderlineInputBorder(), 
      labelText: 'Enter your username',
    ),
  ),
)
```

```yaml
- tapOn:
    id: username_textfield
- inputText: charlie_root
```

## Good practices

Let's say you have a `FancyButton` widget in your app. These buttons are important for you, and you want to ensure they always have an accessibility identifier assigned so they can be reliably interacted with using Maestro. The code sample below requires all callers of `FancyButton` to pass an accessibility identifier:

```dart
class FancyButton extends StatelessWidget {
 FancyButton({
    super.key,
    required this.identifier,
    required this.onPressed,
  });

  final String identifier;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: identifier,
      child: RawMaterialButton(
        onPressed: onPressed,
        // ...
      ),
    );
  }
}
```

This also has the benefit of reducing widget nesting at the call site:

```dart
FancyButton(
  identifier: 'buy_premium',
  onPressed: _buyPremium,  
)

// instead of:

Semantics(
  identifier: 'buy_premium',
  FancyButton(
    onPressed: _buyPremium,
  ),
)
```

Of course, there's always danger of a developer accidentally not using the `FancyButton` widget and defering to the built-in `ElevatedButton`. To combat that, we recommend setting up lint rules that forbid using `ElevatedButton` and enforce replacing it with a `FancyButton` instead. For example you can use [the leancode\_lint package](https://pub.dev/packages/leancode_lint) with the following configuration in `analysis_options.yaml`:

```yaml
include: package:leancode_lint/analysis_options.yaml

custom_lint:
  rules:
    - use_design_system_item:
      FancyButton:
        - instead_of: ElevatedButton
          from_package: flutter
          
analyzer:
  plugins:
    - custom_lint
```

## Why not Flutter keys?

Flutter widget keys cannot be used in Maestro because there's no linkage between widget keys and Flutter's accessibility bridge system. This makes using Keys impossible since Maestro is accessibility-tree based.

Also, Flutter API docs for the [Key class](https://api.flutter.dev/flutter/foundation/Key-class.html) and [Widget.key field](https://api.flutter.dev/flutter/widgets/Widget/key.html) say it's for "controlling how one widget replaces another (e.g. in a list)". Keys are just not a mechanism for assigning unique IDs to widgets for testing purposes.

We strongly recommend making your app accessible (not just for UI tests, but for all of your users with different needs). When testing at scale, you should also consider using an accessibility identifier.

Here's also a little trick that you may find useful if you really want to use keys in Maestro (using the `FancyButton` example from above):

```dart
class FancyButton extends StatelessWidget {
  FancyButton({
    required String key,
    required this.onPressed,
  })  : _key = key,
        super(key: ValueKey(key));

  final String _key;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: _key,
      child: RawMaterialButton(
        onPressed: onPressed,
        // ...
      ),
    );
  }
}
```

Callers are required to pass a string key:

```dart
FancyButton(
  key: 'unlock_reward',
  onPressed: _unlockReward,
)
```

And you can easily interact with the widget using Maestro:

```yaml
- tapOn:
    id: unlock_reward
```

## Known Limitations

Maestro cannot be used to test Flutter Desktop apps yet.&#x20;

But if you've got a Flutter Web app, it'll work exactly the same as [Web](web-desktop-browser). Annotate with Semantics where you need to, and test as you would any other webpage.

</flutter instructions>
```

```
<web-desktop-browser instructions>
# Web (Desktop Browser)

<figure><img src="https://2384395183-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2Fn5KVIOjVkVjYRyVWZ0yT%2Fuploads%2FPy32V4dEmA5L50UuX5uL%2FChromium%20Banner%20(1).png?alt=media&#x26;token=d0e30341-07df-46e4-bd01-e57972656ffc" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Desktop support is currently in Beta. We would appreciate your feedback!
{% endhint %}

Maestro can test Web apps / web pages running on a desktop browser.

### Example Usage

The syntax is exactly the same as for any other Maestro test. For readability, you should specify `url` instead of an `appId` in your test file (but they're synonyms behind the scenes).

```yaml
# example.yaml

url: https://maestro.mobile.dev
---
- launchApp
- tapOn: Installing Maestro
- assertVisible: Installing the CLI
```

Then run it with:

```
maestro test example.yaml
```

{% hint style="info" %}
Maestro will spend some time downloading Chromium on the first launch. Each following test will run much faster.
{% endhint %}

### Maestro Studio

To launch Maestro Studio for Web, use the `-p web` option:

```
maestro -p web studio
```

### Other Resources

{% content-ref url="../getting-started" %}
[getting-started](../getting-started)
{% endcontent-ref %}

{% content-ref url="../api-reference/commands" %}
[commands](../api-reference/commands)
{% endcontent-ref %}

### Known Limitations

These features are not supported yet but should be feasible to implement if there is a common demand:

* Different browsers support (current default is Chromium)
* Different locales support (current default is en-US)
* Screen size configuration
* Flutter Web is different, in the same way Flutter Mobile is different. See the [Flutter](flutter) docs for how to use Semantics to make elements addressable.

</web-desktop-browser instructions>
```

```
<test suites and reports>
# Test Suites & Reports

### Running multiple tests

#### Using a folder

Maestro can run a suite of tests that live in a folder and generate a test report at the end.

To run a suite, point `maestro test` to a folder that contains the Flows

```
maestro test myFolderWithTests/
```

Maestro will run every flow from the directory _excluding subfolders_. The command will complete successfully if and only if all the Flows have been completed successfully.

#### Using a list of flows

Maestro can run a list of tests and generate a test report at the end.

To run a list of tests, pass to `maestro test` the Flows paths to the Flows you want to run separated by spaces:

```
maestro test myFolderWithTests/test1.yaml myFolderWithTests/test2.yaml
```

Maestro will run the flow for each file provided. The command will complete successfully if and only if all the Flows have been completed successfully.

### Generating reports

To generate a report, add a `--format` parameter to a `test` command:

```
maestro test --format junit myFolderWithTests/
```

Or, if you are [running in the cloud](../cloud/run-maestro-tests-in-the-cloud):

```
maestro cloud --format junit myFolderWithTests/
```

Once execution completes, the report will be stored in a `report.xml` file in a JUnit-compatible format that is supported by most platforms.

#### Supported formats

* `junit` - JUnit XML format

![xml](https://github.com/depapp/maestro-docs/assets/6134774/abcd3d3d-9154-4b49-85b5-274c31997771)

* `html` - HTML format

![html](https://github.com/depapp/maestro-docs/assets/6134774/8fedda56-de5e-411d-8501-63bf3c581e90)

#### Additional options

* `--output {file}` allows to override the report filename

### Controlling what tests to include

There are multiple mechanisms to control what Flows to run when running a test suite.

#### Tags

Flow tags are covered extensively in the following section:

{% content-ref url="tags" %}
[tags](tags)
{% endcontent-ref %}

#### Inclusion Patterns

By default, when running a test suite, only Flows from the top level of a given directory will be executed. Consider the following folder structure:

```
workspace/
  flowA.yaml
  subFolder/
    flowB.yaml
    subSubFolder/
      flowC.yaml
```

When running a `test` or `cloud` command on a `workspace` folder, only `flowA.yaml` will be executed by default (though it is still able to refer to `subFolder/flowB.yaml` and `subFolder/subSubFolder/flowC.yaml` using [`runFlow`](../advanced/nested-flows) command).

This behaviour can be customised by using **inclusion** **patterns.** To do that, update your `config.yaml` (create the file if missing) as follows:

```yaml
flows:
  - "*"             # the default behaviour
  - "subFolder/*"
```

In such case, **both** flowA and flowB will be included in the test suite **but not flowC**.

Tests can also be included recursively:

```yaml
flows:
  - "**"
```

In this example, all Flows A, B, and C will be included in the test suite.

### Sequential execution

To run your Flows in a given order, you can add the following configuration to your `config.yaml` file:

```yaml
# config.yaml
executionOrder:
  continueOnFailure: false # default is true
  flowsOrder:
    - flowA
    - flowB
```

This configuration describes to Maestro the order of the Flows you want to run. The list accepts either the Flow file names (without the `.yaml` extension) or the [Flow name](https://maestro.mobile.dev/api-reference/configuration/flow-configuration).

The `continueOnFailure` flag determines whether Maestro should proceed with the execution of subsequent Flows defined in the sequence if a previous one fails. As an example: if `flowA` fails and `continueOnFailure` is `true`, `flowB` will be executed. If the flag is `false`, `flowB` won't be executed. Note that Flows that are not defined in `executionOrder` will not be impacted and will always be run after the sequential Flows, irrespective of this Flow.

{% hint style="warning" %}
Note that your Flows should **not** depend on device state and should be treated as isolated, even though they run in sequence. A good rule of thumb is to ensure that each Flow can be run on a completely reset device.
{% endhint %}

#### Configuring part of the Flows to run sequentially

For instance, if you have three Flows, `flowA`, `flowB`, and `flowC`, but you want to run only `flowA` and `flowB` sequentially, don't add `flowC` and `flowD` to the list. Maestro will run these Flows in non-deterministic ordering **after** the Flow sequence has finished executing.

#### Analyze

{% hint style="warning" %}
This is an **experimental** feature powered by LLM technology. All feedback is welcome.
{% endhint %}

Maestro introduces a new feature that leverages AI to analyze your end-to-end (E2E) mobile tests and provide actionable insights based on your test logs, commands, and screenshots captured during your test runs. The AI-powered analysis identifies potential issues in your app's functionality, UI, and internationalization, helping you improve app quality efficiently.

**Login Requirement:** Before you use the AI analysis feature, ensure you are logged into Maestro. Run the following command:

```bash
maestro login
```

**Analyzing your tests**: To analyze your test flows with AI, use the --analyze flag with the maestro test command:

```bash
maestro test flow-file.yaml --analyze
```

{% hint style="info" %}
While we aim for precision, please note that this is a beta release, and the results should be validated before making critical decision
{% endhint %}

This will enable AI analysis and provide a detailed report based on your test artifacts:

**Examples**

Successful Analysis

Command:

```bash
maestro test flow-file.yaml --analyze
```

Output:

```bash
🔎 Analyzing Flow(s)...

To view the report, open the following link in your browser:
file:///path/to/your/insights-report.html

Analyze support is in Beta. We would appreciate your feedback in our Slack channel: #community-chat

```

<figure><img src="https://2384395183-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2Fn5KVIOjVkVjYRyVWZ0yT%2Fuploads%2Fgit-blob-fa3e6f28d0700061fa72ef3d6ccce80142fcb3c1%2Fanalyze-report.png?alt=media" alt=""><figcaption></figcaption></figure>

No Issues Found

If no issues are detected, you will see a message like this:

```bash
Hey, we analyzed your flow for spelling, grammar, and internationalization issues, and good news 🙌 we didn't find any issues!
```

**Disabling Notifications**

To disable the AI analysis notification, set the `MAESTRO_CLI_ANALYSIS_NOTIFICATION_DISABLED` environment variable to true before running Maestro:

```bash
export MAESTRO_CLI_ANALYSIS_NOTIFICATION_DISABLED=true
```

**Feedback**

The Analyze feature is currently in Beta. Share your feedback and suggestions in our Slack channel: [#community-chat](https://mobile-dev-inc.slack.com/archives/C083YB8N42G)

</test suites and reports>
```

```
<tags>
# Tags

You can add tags to your Flows files to later filter them in `maestro cloud` and `maestro test` commands. There is a couple of different use cases for this, but this is especially useful when you want to run some Flows at Pull Request time, and other Flows before a version release, for example.

### Adding Tags

You can provide a list of tags in the `tags` field at the root of your Flow file. Like this:

```
appId: com.example.App
tags:
  - nightly-build
  - pull-request
---
- launchApp
```

### Filtering

In `maestro cloud` and `maestro test` commands, you can specify either `--include-tags` or `--exclude-tags` parameters to filter them.

The `--include-tags` will look for all flows containing the provided tag; it doesn't matter if those Flows also have other tags. On the other hand, the `--exclude-tags` parameter will remove from the list of Flows run any Flow that contains the provided tags. These options can be used together and they perform an `AND` operation.

**Example**

Let's say a user has two flows:

```
# flowA.yaml
appId: com.example.app
tags: 
  - dev
  - pull-request
```

```
# flowB.yaml
appId: com.example.app
tags: 
  - dev
```

In the scenario above:

* If they use `--include-tags=dev` , flowA and flowB will run.
* If they use `--include-tags=dev,pull-request` , both flows will run.
* If they use `--exclude-tags=pull-request` , only flowB will run.
* If they use `--exclude-tags=dev` none Flow will run.
* If they use `--include-tags=dev --exclude-tags=pull-request` , only flowB will run.

### Global tags

Instead of passing tags with each `test` or `cloud` command, you can also define default tags to be applied to each run. To do so, add the following to your `config.yaml` file (or create it if it is missing):

```yaml
includeTags:
  - tagNameToInclude
excludeTags:
  - tagNameToExclude
```

Now, whenever you run a test folder the following will happen:

* Only flows with a `tagNameToInclude` are going to run
* Flows with a `tagNameToExclude` are not going to run (even if they have `tagNameToInclude` assigned to them)

When used in combination with `--include-tags` and `--exclude-tags`, global tags behaving as a _union_ and will not be overwritten. Consider the following example:

```
maestro test --include-tags=tagA --exclude-tags=tagB workspaceFolder/
```

The following behaviour should be expected:

* Only flows that have _both_ `tagA` **and** `tagNameToInclude` are going to run
* Flows that have _either_ `tagB` _**or**_ `tagNameToExclude` are not going to run (regardless of whether they have both `tagA` and `tagNameToInclude`)

</tags>
```

```
<continuous mode>
# Continuous Mode

This command starts a test in a continuous mode. That is, test will be automatically restarted whenever you make a change to the test file. This is particularly convenient when writing a new test from ground up:

```
maestro test -c flow.yaml
```

Check out the Reference section of the docs to learn about all the commands you can execute.

</continuous mode>
```

```
<view hierierchy>
# View Hierarchy

You can use the Maestro CLI to directly inspect your app view hierarchy.

### hierarchy

`maestro hierarchy` prints out the whole view hierarchy that is currently being shown

```
maestro hierarchy
```

### query

`maestro query` finds an element that matches a condition:

```
maestro query [text=regex] [id=regex]
```

</view hierierchy>
```

```
<start device>
---
description: Maestro offers a few convenience methods to start or create a device
---

# Start Device

You can use Maestro to create an Android emulator or an iOS simulator.&#x20;

The device configurations are similar to the ones hosted on [Maestro's cloud platform](../cloud/run-maestro-tests-in-the-cloud). Using such devices will help you create compatible flows.



### Start an Android emulator using Maestro

You can start by running

```sh
maestro start-device --platform android
```

This will create a default Android emulator (Pixel 6, Google API 30). If the device already exists, it will simply launch it.

For full options run `maestro start-device`

_Note: Device configurations are limited to a few recommended OS versions and devices. Such configurations work well when_ [_running flows in the cloud_](../cloud/run-maestro-tests-in-the-cloud)_._

### Start an iOS simulator using Maestro

You can start by running

```
maestro start-device --platform ios
```

This will create a default iOS simulator (iPhone11, iOS 15.5). If the device already exists, it will simply launch it.

For full options run `maestro start-device`

_Note: Device configurations are limited to a few recommended os versions and devices. Such configurations work well when_ [_running flows in the cloud_](../cloud/run-maestro-tests-in-the-cloud)_._


</start device>
```

```
<all commands>
# Commands

- [addMedia](/api-reference/commands/addmedia.md): Add PNG, JPEG, GIF, or MP4 media to device gallery in Maestro tests.
- [assertVisible](/api-reference/commands/assertvisible.md): Confirm element visibility with assertVisible, waiting for appearance and state checks.
- [assertNotVisible](/api-reference/commands/assertnotvisible.md): Verify element disappearance with assertNotVisible using text, ID, or properties.
- [assertTrue](/api-reference/commands/asserttrue.md): Assert JavaScript expressions are true in Maestro flows.
- [assertWithAI](/api-reference/commands/assertwithai.md): Verify complex UI with AI descriptions in Maestro and generate reports.
- [assertNoDefectsWithAi](/api-reference/commands/assertnodefectswithai.md): Detect UI defects like clipped text or overlaps using experimental AI in Maestro and generate reports.
- [back](/api-reference/commands/back.md): Navigate back on Android with back command in Maestro UI tests.
- [clearKeychain](/api-reference/commands/clearkeychain.md): Clear iOS keychain passwords in Maestro for clean test states.
- [clearState](/api-reference/commands/clearstate.md): Remove all app data with clearState in Maestro for fresh test starts.
- [copyTextFrom](/api-reference/commands/copytextfrom.md): Copy text from elements and store in maestro.copiedText for reuse in tests or scripts.
- [evalScript](/api-reference/commands/evalscript.md): Run inline JavaScript snippets in Maestro YAML for quick tasks.
- [eraseText](/api-reference/commands/erasetext.md): Remove characters from text fields with eraseText in Maestro by specifying count.
- [extendedWaitUntil](/api-reference/commands/extendedwaituntil.md): Wait for elements to appear or disappear with timeout in Maestro.
- [extractTextWithAI](/api-reference/commands/extracttextwithai.md): Extract text from images or elements without ID using AI in Maestro and store in variables.
- [hideKeyboard](/api-reference/commands/hidekeyboard.md): Hide virtual keyboard in Maestro tests; note potential instability on iOS.
- [inputText](/api-reference/commands/inputtext.md): Enter text into fields in Maestro, including random emails, names, or numbers with length.
- [killApp](/api-reference/commands/killapp.md): Terminate app on Android with killApp (stopApp on iOS and Web) to test restarts.
- [launchApp](/api-reference/commands/launchapp.md): Launch app in Maestro with appId, clear state/keychain, and launch arguments.
- [openLink](/api-reference/commands/openlink.md): Open links or deep links in apps or browser with Maestro, bypassing iOS security.
- [pressKey](/api-reference/commands/presskey.md)
- [pasteText](/api-reference/commands/pastetext.md): Paste copied text into focused fields in Maestro from copyTextFrom.
- [repeat](/api-reference/commands/repeat.md)
- [retry](/api-reference/commands/retry.md)
- [runFlow](/api-reference/commands/runflow.md)
- [runScript](/api-reference/commands/runscript.md)
- [scroll](/api-reference/commands/scroll.md)
- [scrollUntilVisible](/api-reference/commands/scrolluntilvisible.md)
- [setAirplaneMode](/api-reference/commands/setairplanemode.md)
- [setLocation](/api-reference/commands/setlocation.md)
- [startRecording](/api-reference/commands/startrecording.md)
- [stopApp](/api-reference/commands/stopapp.md)
- [stopRecording](/api-reference/commands/stoprecording.md)
- [swipe](/api-reference/commands/swipe.md)
- [takeScreenshot](/api-reference/commands/takescreenshot.md)
- [toggleAirplaneMode](/api-reference/commands/toggleairplanemode.md)
- [tapOn](/api-reference/commands/tapon.md)
- [doubleTapOn](/api-reference/commands/doubletapon.md): Double tap elements or points in Maestro with configurable delay and selectors. Part of Maestro testing tutorial.
- [longPressOn](/api-reference/commands/longpresson.md): Long press elements or points in Maestro to trigger actions using tapOn selectors. Follows test automation best practices.
- [travel](/api-reference/commands/travel.md)
- [waitForAnimationToEnd](/api-reference/commands/waitforanimationtoend.md)

</all commands>
```

```
<all commands url (up to date)>
https://docs.maestro.dev/api-reference/commands
</all commands url (up to date)>
```

```
<common command arguments>
# Common command arguments

Some arguments are common to all commands.

## Labels

Each Maestro command accepts an optional `label` attribute that lets you customize the command's name:

```yaml
- tapOn:
    id: buy-now
    label: Tap on Buy Now button
    
- inputText:
    label: Input the company email
    text: maestro@mobile.dev

- swipe:
    direction: LEFT
    label: Swipe for onboarding
```

```
✅ Tap on Buy Now button
✅ Input the company email
✅ Swipe for onboarding
```

Setting a label can have an additional advantage of being able to remove sensitive content from console output, for example this:

```
✅ Tap on "Password"
✅ Input text "mySecr3tPassw0rd!"
```

becomes:

```
✅ Tap on "Password"
✅ Enter the test user's password
```

{% hint style="warning" %}
The values will still appear in the logs of the run.
{% endhint %}

Labels are also a useful alternative to comments for contributors trying to understand the intent of a particular step.

```yaml
- extendedWaitUntil:
    visible: Recommended Products
    timeout: 5000
    label: Wait for all personalized content to load
```

## Optional

Each Maestro command accepts an optional `optional` attribute that lets control what should happen if the command fails.

```yaml
- launchApp: com.example.example
- assertVisible:
    text: Summer sale is here!
    optional: true
- tapOn: Sign up now!
```

If `optional` is set to `true`, the flow will continue executing even if the command fails. The warning will be displayed:

```
✅ Launch app "com.example.example"
⚠️ Assert that "Summer sale is here!" is visible (warned)
✅ Tap on "Sign up now!"
```

The default value of `optional` for almost all commands is `false`, which means that the flow will stop executing if any command fails. The only exception (at least for now) are AI-powered commands, which have `optional` set to `true` by default.

{% hint style="info" %}
Setting the `optional` attribute doesn't make sense on some commands, e.g. `back` or `startRecording`. Nevertheless, it's still possible to set it, but it won't have any effect.
{% endhint %}

</common command arguments>
```

```
<selectors>
# Selectors

Commands that interact with a view (e.g `tapOn`, `assertVisible`, `copyTextFrom`) require the view to be specified using using a _selector_.

There are many different selectors available:

```yaml
- tapOn: # or any other command that works with selectors
    text: 'Text'     # (optional) Finds element with text or accessibility text that matches the regular expression
    id: 'the_id'     # (optional) Finds element with accessibility identifier that matches the regular expression
    index: 0         # (optional) 0-based index of the view to select among those that match all other criteria
    point: 50%, 50%  # (optional) Relative position on screen. "50%, 50%" is the middle of screen
    point: 50, 75    # (optional) Exact coordinates on screen. x:50 y:50, in pixels
    width: 100       # (optional) Finds element of a given width
    height: 100      # (optional) Finds element of a given height
    tolerance: 10    # (optional) Tolerance to apply when comparing width and height
    enabled: true    # (optional) Searches for view with a given "enabled" state
    checked: true    # (optional) Searches for view with a given "checked" state
    focused: true    # (optional) Searches for view with a given "focused" state
    selected: true   # (optional) Searches for view with a given "selected" state
```

### Shorthand selector for text

If you want to use the `text` selector, you can use the following shorthand:

```yaml
- tapOn: 'Text' # or any other command that works with selectors
```

### Relative position selectors

Apart from the selectors mentioned above, Maestro is also able to select views using their relative position (i.e. "below another view", or "contains child"):

```yaml
- tapOn: # or any other command that works with selectors
    below: View above that has this text       # matches a view *above* that has the given text
    above:
        id: view_below_id                      # matches a view *below* that has the given id
    leftOf: View to the right has this text
    rightOf: View to the left has this text
    containsChild: Text in a child view        # matches a view that has a *direct* child view with the given text
    childOf:                                   # matches a view that is a child of a view with id "buy-now"
        id: buy-now
    containsDescendants:                       # matches a view that has all the descendant views given below
        - id: title_id
          text: A descendant view has id "title_id" and this text
        - Another descendant view has this text
```

### Selecting one view among many similar

If you have multiple views matching the same selector (i.e. many views with text `Hello`), use `index` parameter to specify which one to select exactly. For example, the following command will pick the **3rd view** that has text `Hello`:

```yaml
- tapOn:
    text: Hello
    index: 2
```

### Using Regular Expressions

All text fields in Maestro element selectors are regular expressions. Whilst this document isn't intending to replace documentation on regular expressions (use your favourite search engine), here are a few examples of how it operates. In these examples, we've used `assertVisible`, but it's applicable to any text or id field.

#### Partial Matches

If you're on a screen with the sentence 'the quick brown fox jumps over the lazy log', and want to assert on two words in the sentence this won't work:

```yaml
- assertVisible: 'brown fox'
```

Because it's a regular expression, it needs to match the text of the entire element. This would work:

```yaml
- assertVisible: '.*brown fox.*'
```

#### Patterns

Regular Expressions are powerful. Imagine a screen that generates a random 6-digit number (like an OTP). Assuming you don't want to imbue your test with all of the code to generate an identical random number, you could assert that you're getting a number of the correct format like this:

```yaml
- assertVisible: '[0-9]{6}'
```

#### Escaping

One downside of regular expressions is that like any expression, there are control characters. If you're attempting to assert on the text 'Movies \[NEW]', this won't work:

```yaml
- assertVisible: 'Movies [NEW]'
```

That's because square brackets have meaning in regular expressions. Instead, you'll need this:

```yaml
- assertVisible: 'Movies \[NEW\]'
```



### Should I use text or IDs?

Text selectors are good when text is static. They improve the readability and intent of your tests. Anyone can come along and read what you're tapping / inputting / asserting without referring to other files. This is a massive benefit when it comes to maintenance, or to new people joining your project.

ID selectors are great when you just want to target something consistently, regardless of content. They're stable, great for more dynamic content, good for icons without text (like back buttons), and applications with internationalization.

</selectors>
```

# Workspace configuration

The directory where all your Maestro-related configuration lives is a *Maestro workspace* (or just *workspace* for short).

## Maestro configuration

The following properties can be configured on the workspace as a whole as part of the workspace configuration. All settings are optional.
- `flows`: inclusion patterns regarding what Flows to include ([docs](../../../cli/test-suites-and-reports#controlling-what-tests-to-include)).
- `includeTags`: list of tags to include on each run ([docs](../../../cli/tags#global-tags)).
- `excludeTags`: list of tags to exclude on each run ([docs](../../../cli/tags#global-tags)).
- `executionOrder`: the order to run sequential tests before running remaining tests ([docs](../../../cli/test-suites-and-reports#sequential-execution)).
- `baselineBranch`: Which branch is your baseline. Useful when integrating with Pull Requests ([docs](https://docs.maestro.dev/cloud/pull-request-integration)). Cloud only.
- `notifications`: Who to notify after an Upload finishes processing ([docs](../../cloud/reference/email-notifications)). Cloud only. You might prefer the [Slack integration](../../cloud/reference/slack-notifications).

## Platform Configuration

### iOS

Following properties can be configured as platform configuration for iOS:
- `disableAnimations`: Disables system animations on iOS simulator by enabling [**Reduce Motion**](https://support.apple.com/en-gb/111781)**.** Use this to avoid flakiness due to animations.

⚠️ *Note: This only affects system-level animations. Custom animations like those powered by Lottie won't be disabled.*
- `snapshotKeyHonorModalViews` : By default, Maestro shows elements visible **within** the current modal view context. However, in some apps, especially those using custom presentation styles or certain UI frameworks, elements may appear on modal but still hidden in hierarchy.

  Try setting this flag to `false` . It allows Maestro to include those background elements as well, depending on how they’re rendered by the app.

### Android

Following properties can be configured as platform configuration for Android:
- `disableAnimations`: Disables system animations on android emulator by disabling animations from animators, window animations and transitions**.** Use this to avoid flakiness due to animations.

⚠️ *Note: This won't disable custom animations like those from Lottie or other animation libraries.*

### Example

Below is an example Maestro workspace configuration file. Typically it's named `config.yaml` and placed in the `.maestro` directory in your project's root:

```yaml
flows:
  - "subFolder/*"
includeTags:
  - tagNameToInclude
excludeTags:
  - tagNameToExclude
executionOrder:
    continueOnFailure: false # default is true
    flowsOrder:
        - flowA
        - flowB
  
# Cloud only config options
baselineBranch: main
notifications:
  email:
    enabled: true
    recipients:
      - john@example.com
      
# Platform Configuration
platform:
  ios:
    snapshotKeyHonorModalViews: false
    disableAnimations: true
  android:
    disableAnimations: true
```

### Multiple Configs

It's possible to have multiple config files in a repository and specify them at execution time. For example, the default `config.yaml` could cover the tests typically run on the main branch, but an additional `pr-config.yaml` might cover the flows and tags used when running tests on each Pull Request.

```bash
maestro cloud --config ./pr-config.yaml ./flows
```

## Environment variables

<table data-view="cards"><thead><tr><th>Variable name</th><th>Description</th><th>Type</th><th>Default</th><th>Further reading</th></tr></thead><tbody><tr><td>MAESTRO_API_URL</td><td>The URL of the Maestro API to use. Probably only useful to Mobile Inc developers.</td><td>String</td><td>[https://api.copilot.mobile.dev](https://api.copilot.mobile.dev)</td><td>-</td></tr><tr><td>MAESTRO_CLI_AI_KEY</td><td>Key for external AI service used in AI operations</td><td>String</td><td>-</td><td><a href="ai-configuration">Docs</a></td></tr><tr><td>MAESTRO_CLI_AI_MODEL</td><td>Model for external AI service used in AI operations. The prefix of the model decides which service to use. If none is specified, OpenAI will be used.</td><td>String</td><td><code>gpt-4o</code> for OpenAI, <code>claude-3-5-sonnet-20240620</code> for Claude</td><td>-</td></tr><tr><td>MAESTRO_CLI_ANALYSIS_NOTIFICATION_DISABLED</td><td>Disables the notification displayed on each run about AI analysis</td><td>Boolean</td><td>false</td><td>-</td></tr><tr><td>MAESTRO_CLI_LOG_PATTERN_CONSOLE</td><td>Sets the <a href="[https://logback.qos.ch/manual/layouts.html](https://logback.qos.ch/manual/layouts.html)">logback layout</a> for logging in the console</td><td>String</td><td><code>%highlight([%5level]) %msg%n</code></td><td>-</td></tr><tr><td>MAESTRO_CLI_LOG_PATTERN_FILE</td><td>Sets the <a href="[https://logback.qos.ch/manual/layouts.html](https://logback.qos.ch/manual/layouts.html)">logback layout</a> for logging in the log file</td><td>String</td><td><code>%d{HH:mm:ss.SSS} [%5level] %logger.%method: %msg%n</code></td><td><a href="[https://docs.maestro.dev/troubleshooting/debug-output#maestro-logs](https://docs.maestro.dev/troubleshooting/debug-output#maestro-logs)">Docs</a></td></tr><tr><td>MAESTRO_CLI_NO_ANALYTICS</td><td>Disables Maestro analytics collection</td><td>Boolean</td><td>false</td><td>-</td></tr><tr><td>MAESTRO_CLOUD_API_KEY</td><td>The API key to use when communicating with the Maestro cloud platform</td><td>String</td><td>-</td><td><a href="../../cloud/run-maestro-tests-in-the-cloud">Docs</a></td></tr><tr><td>MAESTRO_CLOUD_API_URL</td><td>Like <code>MAESTRO_API_URL</code>but used for AI API requests</td><td>String</td><td>[https://api.copilot.mobile.dev](https://api.copilot.mobile.dev)</td><td>-</td></tr><tr><td>MAESTRO_DISABLE_UPDATE_CHECK</td><td>Disable the check for newer Maestro versions when running the CLI</td><td>Boolean</td><td>false</td><td>-</td></tr><tr><td>MAESTRO_DRIVER_STARTUP_TIMEOUT</td><td>The maximum time to wait for a driver to start</td><td>Number</td><td>15000</td><td><a href="../../advanced/configuring-maestro-driver-timeout">Docs</a></td></tr><tr><td>MAESTRO_USE_GRAALJS</td><td>Use GraalJS instead of RhinoJS for JavaScript execution</td><td>Boolean</td><td>false</td><td><a href="../../advanced/javascript/graaljs-support">Docs</a></td></tr></tbody></table>

Any other environment variables prefixed with `MAESTRO_` will be available in your Flows as JavaScript variables. See [Accessing variables from the shell](../../../advanced/parameters-and-constants#accessing-variables-from-the-shell) for more information.

---

# Workspace configuration

The directory where all your Maestro-related configuration lives is a *Maestro workspace* (or just *workspace* for short).

## Maestro configuration

The following properties can be configured on the workspace as a whole as part of the workspace configuration. All settings are optional.
- `flows`: inclusion patterns regarding what Flows to include ([docs](../../../cli/test-suites-and-reports#controlling-what-tests-to-include)).
- `includeTags`: list of tags to include on each run ([docs](../../../cli/tags#global-tags)).
- `excludeTags`: list of tags to exclude on each run ([docs](../../../cli/tags#global-tags)).
- `executionOrder`: the order to run sequential tests before running remaining tests ([docs](../../../cli/test-suites-and-reports#sequential-execution)).
- `baselineBranch`: Which branch is your baseline. Useful when integrating with Pull Requests ([docs](https://docs.maestro.dev/cloud/pull-request-integration)). Cloud only.
- `notifications`: Who to notify after an Upload finishes processing ([docs](../../cloud/reference/email-notifications)). Cloud only. You might prefer the [Slack integration](../../cloud/reference/slack-notifications).

## Platform Configuration

### iOS

Following properties can be configured as platform configuration for iOS:
- `disableAnimations`: Disables system animations on iOS simulator by enabling [**Reduce Motion**](https://support.apple.com/en-gb/111781)**.** Use this to avoid flakiness due to animations.

⚠️ *Note: This only affects system-level animations. Custom animations like those powered by Lottie won't be disabled.*
- `snapshotKeyHonorModalViews` : By default, Maestro shows elements visible **within** the current modal view context. However, in some apps, especially those using custom presentation styles or certain UI frameworks, elements may appear on modal but still hidden in hierarchy.

  Try setting this flag to `false` . It allows Maestro to include those background elements as well, depending on how they’re rendered by the app.

### Android

Following properties can be configured as platform configuration for Android:
- `disableAnimations`: Disables system animations on android emulator by disabling animations from animators, window animations and transitions**.** Use this to avoid flakiness due to animations.

⚠️ *Note: This won't disable custom animations like those from Lottie or other animation libraries.*

### Example

Below is an example Maestro workspace configuration file. Typically it's named `config.yaml` and placed in the `.maestro` directory in your project's root:

```yaml
flows:
  - "subFolder/*"
includeTags:
  - tagNameToInclude
excludeTags:
  - tagNameToExclude
executionOrder:
    continueOnFailure: false # default is true
    flowsOrder:
        - flowA
        - flowB
  
# Cloud only config options
baselineBranch: main
notifications:
  email:
    enabled: true
    recipients:
      - john@example.com
      
# Platform Configuration
platform:
  ios:
    snapshotKeyHonorModalViews: false
    disableAnimations: true
  android:
    disableAnimations: true
```

### Multiple Configs

It's possible to have multiple config files in a repository and specify them at execution time. For example, the default `config.yaml` could cover the tests typically run on the main branch, but an additional `pr-config.yaml` might cover the flows and tags used when running tests on each Pull Request.

```bash
maestro cloud --config ./pr-config.yaml ./flows
```

## Environment variables

<table data-view="cards"><thead><tr><th>Variable name</th><th>Description</th><th>Type</th><th>Default</th><th>Further reading</th></tr></thead><tbody><tr><td>MAESTRO_API_URL</td><td>The URL of the Maestro API to use. Probably only useful to Mobile Inc developers.</td><td>String</td><td>[https://api.copilot.mobile.dev](https://api.copilot.mobile.dev)</td><td>-</td></tr><tr><td>MAESTRO_CLI_AI_KEY</td><td>Key for external AI service used in AI operations</td><td>String</td><td>-</td><td><a href="ai-configuration">Docs</a></td></tr><tr><td>MAESTRO_CLI_AI_MODEL</td><td>Model for external AI service used in AI operations. The prefix of the model decides which service to use. If none is specified, OpenAI will be used.</td><td>String</td><td><code>gpt-4o</code> for OpenAI, <code>claude-3-5-sonnet-20240620</code> for Claude</td><td>-</td></tr><tr><td>MAESTRO_CLI_ANALYSIS_NOTIFICATION_DISABLED</td><td>Disables the notification displayed on each run about AI analysis</td><td>Boolean</td><td>false</td><td>-</td></tr><tr><td>MAESTRO_CLI_LOG_PATTERN_CONSOLE</td><td>Sets the <a href="[https://logback.qos.ch/manual/layouts.html](https://logback.qos.ch/manual/layouts.html)">logback layout</a> for logging in the console</td><td>String</td><td><code>%highlight([%5level]) %msg%n</code></td><td>-</td></tr><tr><td>MAESTRO_CLI_LOG_PATTERN_FILE</td><td>Sets the <a href="[https://logback.qos.ch/manual/layouts.html](https://logback.qos.ch/manual/layouts.html)">logback layout</a> for logging in the log file</td><td>String</td><td><code>%d{HH:mm:ss.SSS} [%5level] %logger.%method: %msg%n</code></td><td><a href="[https://docs.maestro.dev/troubleshooting/debug-output#maestro-logs](https://docs.maestro.dev/troubleshooting/debug-output#maestro-logs)">Docs</a></td></tr><tr><td>MAESTRO_CLI_NO_ANALYTICS</td><td>Disables Maestro analytics collection</td><td>Boolean</td><td>false</td><td>-</td></tr><tr><td>MAESTRO_CLOUD_API_KEY</td><td>The API key to use when communicating with the Maestro cloud platform</td><td>String</td><td>-</td><td><a href="../../cloud/run-maestro-tests-in-the-cloud">Docs</a></td></tr><tr><td>MAESTRO_CLOUD_API_URL</td><td>Like <code>MAESTRO_API_URL</code>but used for AI API requests</td><td>String</td><td>[https://api.copilot.mobile.dev](https://api.copilot.mobile.dev)</td><td>-</td></tr><tr><td>MAESTRO_DISABLE_UPDATE_CHECK</td><td>Disable the check for newer Maestro versions when running the CLI</td><td>Boolean</td><td>false</td><td>-</td></tr><tr><td>MAESTRO_DRIVER_STARTUP_TIMEOUT</td><td>The maximum time to wait for a driver to start</td><td>Number</td><td>15000</td><td><a href="../../advanced/configuring-maestro-driver-timeout">Docs</a></td></tr><tr><td>MAESTRO_USE_GRAALJS</td><td>Use GraalJS instead of RhinoJS for JavaScript execution</td><td>Boolean</td><td>false</td><td><a href="../../advanced/javascript/graaljs-support">Docs</a></td></tr></tbody></table>

Any other environment variables prefixed with `MAESTRO_` will be available in your Flows as JavaScript variables. See [Accessing variables from the shell](../../../advanced/parameters-and-constants#accessing-variables-from-the-shell) for more information.

---

---

## description: >-
Call reusable subflows in Maestro with runFlow, including parameters and
conditions to reduce duplication.

# Nested Flows

If you want to avoid code duplication and make use of Nested Flows, please refer to the documentation for the [runFlow](../api-reference/commands/runflow) command.

Run flows conditionally

Sometimes you'd want to run flows only under certain conditions. Check out more in the page below

{% content-ref url="conditions" %}
[conditions](conditions)
{% endcontent-ref %}

---

---

## description: >-
Call reusable subflows in Maestro with runFlow, including parameters and
conditions to reduce duplication.

# Nested Flows

If you want to avoid code duplication and make use of Nested Flows, please refer to the documentation for the [runFlow](../api-reference/commands/runflow) command.

Run flows conditionally

Sometimes you'd want to run flows only under certain conditions. Check out more in the page below

{% content-ref url="conditions" %}
[conditions](conditions)
{% endcontent-ref %}

---

---

## description: >-
Call reusable subflows in Maestro with runFlow, including parameters and
conditions to reduce duplication.

# Nested Flows

If you want to avoid code duplication and make use of Nested Flows, please refer to the documentation for the [runFlow](../api-reference/commands/runflow) command.

Run flows conditionally

Sometimes you'd want to run flows only under certain conditions. Check out more in the page below

{% content-ref url="conditions" %}
[conditions](conditions)
{% endcontent-ref %}

---

---

## description: >-
Call reusable subflows in Maestro with runFlow, including parameters and
conditions to reduce duplication.

# Nested Flows

If you want to avoid code duplication and make use of Nested Flows, please refer to the documentation for the [runFlow](../api-reference/commands/runflow) command.

Run flows conditionally

Sometimes you'd want to run flows only under certain conditions. Check out more in the page below

{% content-ref url="conditions" %}
[conditions](conditions)
{% endcontent-ref %}

---

---

## description: >-
Call reusable subflows in Maestro with runFlow, including parameters and
conditions to reduce duplication.

# Nested Flows

If you want to avoid code duplication and make use of Nested Flows, please refer to the documentation for the [runFlow](../api-reference/commands/runflow) command.

Run flows conditionally

Sometimes you'd want to run flows only under certain conditions. Check out more in the page below

{% content-ref url="conditions" %}
[conditions](conditions)
{% endcontent-ref %}

---

---

## description: >-
Choose devices for testing with --device, list simulators/emulators, and use
sharding for parallel runs.

# Specify a Device

If you have multiple devices open, you can specify which device to run Maestro on. To do this, you must first obtain the device identifier and then pass it to Maestro.

### Obtain the device identifier

{% tabs %}
{% tab title="Android" %}
To list available Android devices, run the following command in your terminal:

```bash
adb devices
```

From the output, locate the device identifier for the device you want to use with Maestro.
{% endtab %}

{% tab title="iOS" %}
To list available iOS simulators, run the following command in your terminal:

```bash
xcrun simctl list devices booted
```

From the output, locate the device identifier for the device you want to use with Maestro.
{% endtab %}
{% endtabs %}

## Pass the device identifier to Maestro

When running any Maestro command that requires a device (e.g. `test` or `studio`), you must first pass the device identifier with the `--device` parameter before running the command.

For example, to run Maestro Studio on an Android device with identifier `emulator-5554` use the following command:

```css
maestro --device emulator-5554 studio
```

Similarly, to run `flow.yaml` on an iOS simulator with identifier `5B6D77EF-2AE9-47D0-9A62-70A1ABBC5FA2` use the following command:

```
maestro --device 5B6D77EF-2AE9-47D0-9A62-70A1ABBC5FA2 test flow.yaml
```

## Run flows in parallel

Maestro can run tests in parallel, also known as "sharding".

{% embed url="[https://youtu.be/VS1TqvZz398](https://youtu.be/VS1TqvZz398)" %}

There are two sharding strategies available.

### --shard-all

To run tests in parallel, you can use the `--shard-all` parameter. This parameter will run the same tests in parallel on available devices:

```
maestro test --shard-all 3 .maestro
```

### --shard-split

Let’s say you have 3 running devices and 9 tests, but now you want to split this test suite into 3 chunks of tests and run them in parallel on connected devices:

```
maestro test --shard-split 3 .maestro
```

{% hint style="warning" %}
To run with `--shard-all 3` or `--shard-split`, you need to have 3 available devices. If there are less, Maestro will print an error and request you to run more devices.
{% endhint %}

---

---

## description: >-
Configure iOS and Android app permissions in Maestro tests, including camera,
location, and other services.

# Permissions Setup for iOS and Android Apps

By default, all permissions are set to `allow` by the launchApp command. It is possible to launch an app with custom permissions behaviour by passing the `permissions` argument to `launchApp`:

```yaml
- launchApp:
    permissions:
      all: deny
      camera: allow
      location: allow
```

## Available permissions

Maestro has standardized names for most permissions.

For example, on Android: `bluetooth` targets both `android.permission.BLUETOOTH_CONNECT` and `android.permission.BLUETOOTH_SCAN`.

PermissioniOS supportAndroid supportcalendar✅✅camera✅✅contacts✅✅health❌❌homekit✅❌location✅✅medialibrary✅✅microphone✅✅motion✅❌notifications✅✅photos✅❌reminders✅❌siri✅❌speech✅❌usertracking✅❌bluetooth❌✅phone❌✅storage❌✅sms❌✅my.custom.permission❌✅

{% hint style="info" %}
Use `all` as a permission name to represent all the permissions that the app can ask for.
{% endhint %}

### Supporting permission IDs for Android

There are permissions on Android that are not listed in the table above. Use the permission IDs in place of the permission name to set these permissions.

For example, to allow the "add voicemail" permission, use:

```yaml
- launchApp:
    permissions:
        com.android.voicemail.permission.ADD_VOICEMAIL: allow
```

## Available permission names

Every permission can be set to: `allow`, `deny` or `unset`

Permission ValueiOSAndroidallowPermission grantedPermission granteddenyPermission deniedPermission will be asked during flow rununsetPermission will be asked during flow runPermission will be asked during flow run

Some iOS permissions can have other values:

PermissionValueDescriptionlocationalwaysSame as allowinuseOnly allow location whilst using the appneverSame as denyphotoslimitedAllow limited access to photos

## Examples

Permissions are set by passing them to the `launchApp` command as follows:

### Deny all permissions

```yaml
- launchApp:
    permissions: { all: deny } 
```

### Deny all permissions but allow the `medialibrary` permission

```yaml
- launchApp:
    permissions:
        all: deny
        medialibrary: allow
```

### Deny all permissions but allow adding voicemails

```yaml
- launchApp:
    permissions:
        all: deny
        com.android.voicemail.permission.ADD_VOICEMAIL: allow
```

---

---

## description: >-
Check if your app runs under Maestro by inspecting launch arguments, open
ports, and window.maestro property.

# Detect Maestro in your app

{% tabs %}
{% tab title="Mobile" %}

## Using launch arguments

The recommended way to check if maestro is currently running is to use [arguments](../../api-reference/commands/launchapp#launch-arguments) and have your app detect a particular parameter to indicate Maestro's usage, e.g. `isE2ETest`.

## Checking for open ports (deprecated)

{% hint style="warning" %}
Using ports is deprecated and may stop working at any time in future maestro updates and is not supported when [running in the cloud](../cloud/run-maestro-tests-in-the-cloud).
{% endhint %}

It's sometimes useful to be able to add logic in your app that depends that whether you are running within the context of Maestro. In order to detect Maestro, check to see whether the Maestro-specific port is open on your device:

<table><thead><tr><th width="146">Platform</th><th>Maestro Port on Device</th></tr></thead><tbody><tr><td>iOS</td><td>22087</td></tr><tr><td>Android</td><td>7001</td></tr></tbody></table>

Here's an example of how to check for Maestro in an Android app:

```kotlin
fun isMaestro(): Boolean {
    return try {
        Socket("localhost", 7001).use { true }
    } catch(ignored: IOException) {
        false
    }
}
```

### NetworkOnMainThreadException

On Android, you may encounter a `NetworkOnMainThreadException`. This means you'll need to move the call above to a background thread. As an example:

```kotlin
CoroutineScope(Dispatchers.IO).launch {
    if (isMaestro()) {
        // Do Maestro things
        
    }
}
```

{% endtab %}

{% tab title="Web" %}

## Using JS property

Maestro defines `window.maestro` property during test execution, so you can simply check if it is defined to check whether your app is running under a Maestro test:

```javascript
if (window.maestro) {
  console.log("Maestro test is running!");
}
```

{% endtab %}
{% endtabs %}

---

---

## description: >-
Set onFlowStart and onFlowComplete hooks to run scripts or flows before and
after main flow.

# Maestro Hooks: onFlowStart and onFlowComplete

### General

If some logic needs to be executed before the start or after the completion of maestro flow onStart and onComplete hooks can be used.

The hooks are a part of [flow configuration section](../api-reference/configuration/flow-configuration).

Basic usage of an API could look like that:

```
# flow.yaml
appId: my.app
onFlowStart:
  - runFlow: setup.yaml
  - runScript: setup.js
  - <any other command>
onFlowComplete:
  - runFlow: teardown.yaml
  - runScript: teardown.js
  - <any other command>
```

### What if one of the hooks fails?

In case of either **onFlowStart** / **onFlowComplete** failure the behavior of maestro is consistent with JUnit (@before / @after) and XCTest (setup / teardown) hooks.

Test caseBehaviorwhen before onFlowStart hook fails, does that fail the whole flow?flow marked 🔴when onFlowStart hook fails, does that skip the main body of the flow execution?flow execution skippedwhen onFlowStart hook fails, does the onFlowComplete hook still run?onFlowComplete hook is still calledwhen the onFlowComplete hook fails, does the flow fail?flow marked 🔴

### onFlowStart / onFlowComplete in the subflows

If either `onFlowStart` or `onFlowComplete` hooks are implemented within a [subflow](../api-reference/commands/runflow), their commands will execute as expected. However, note that the execution start and end times will correspond to the subflow's duration, not the main flow's.

---

---

## description: >-
Set onFlowStart and onFlowComplete hooks to run scripts or flows before and
after main flow.

# Maestro Hooks: onFlowStart and onFlowComplete

### General

If some logic needs to be executed before the start or after the completion of maestro flow onStart and onComplete hooks can be used.

The hooks are a part of [flow configuration section](../api-reference/configuration/flow-configuration).

Basic usage of an API could look like that:

```
# flow.yaml
appId: my.app
onFlowStart:
  - runFlow: setup.yaml
  - runScript: setup.js
  - <any other command>
onFlowComplete:
  - runFlow: teardown.yaml
  - runScript: teardown.js
  - <any other command>
```

### What if one of the hooks fails?

In case of either **onFlowStart** / **onFlowComplete** failure the behavior of maestro is consistent with JUnit (@before / @after) and XCTest (setup / teardown) hooks.

Test caseBehaviorwhen before onFlowStart hook fails, does that fail the whole flow?flow marked 🔴when onFlowStart hook fails, does that skip the main body of the flow execution?flow execution skippedwhen onFlowStart hook fails, does the onFlowComplete hook still run?onFlowComplete hook is still calledwhen the onFlowComplete hook fails, does the flow fail?flow marked 🔴

### onFlowStart / onFlowComplete in the subflows

If either `onFlowStart` or `onFlowComplete` hooks are implemented within a [subflow](../api-reference/commands/runflow), their commands will execute as expected. However, note that the execution start and end times will correspond to the subflow's duration, not the main flow's.

---

# **Maestro Best Practices: Structuring your Test Suite**

Best practices on how to structure and organize your Maestro Test Suite

Leland Takamine•May 4, 2023

Once you’ve familiarized yourself with the basics of Maestro, the next step is to start planning out what a full test suite looks like for your app. We’ll walk through this process and address some of the key questions you’ll likely run into:
- How do I decide what belongs in a single Flow vs multiple Flows?
- How should I organize my Flows?
- How can I run a different set of Flows in different circumstances?

We’ll start with a general rule of thumb for breaking down your Flows:

## ***A Flow should test a single user scenario***

It might be tempting to test your entire app as a long sequence of commands under single Flow. Don’t do this! There are a number of ways this will make things harder for you:
- If any command fails, this will halt the entire test — you won’t get information about the rest of your app
- You won’t be able to run your test cases in parallel, increasing execution time in CI
- Your test results will show up as a single Flow result (even if you are testing many different parts of your app)

Instead, break down your Flows into smaller scenarios that each represent a single scenario you’d like to verify. As is usually the case in these types of situations, this is more of an art than a science. You’ll need to decide on the granularity of your Flows based on the complexity of your app.

A good starting point is thinking about user intent. What is a user trying to accomplish in each scenario (eg. “Search for a item”, “Log in”, “Purchase a product”, “Add a comment”)? If your Flow is covering more than one user intent, it probably make sense to break it up into multiple Flows.

## **Use subdirectories to organize your Flows**

To organize your Flow files, you can place related Flow files into subdirectories. You can choose the directory structure you like, but our recommendation is to group Flows by feature:

```
.maestro
├── auth
│   ├── Login.yaml
│   └── Onboarding.yaml
├── checkout
│   ├── CheckoutWithCreditCard.yaml
│   ├── CheckoutWithGooglePay.yaml
│   └── CheckoutWithInvalidInfo.yaml
├── common
│   ├── OpenDeeplink.yaml
│   └── ScrollToSelected.yaml
└── search
    ├── FilterByCategory.yaml
    ├── Search.yaml
    ├── SearchHistory.yaml
    ├── SortByDate.yaml
    └── SortByPrice.yaml
```

You’ll need to configure your [**__config.yaml__**](https://docs.maestro.dev/api-reference/configuration/workspace-configuration) to specify the Flows you want to run. By default, Maestro will only run Flows at the root level of your Flow directory.

```
# config.yaml
flows:
  - auth/*
  - checkout/*
  - search/*
```

Notice that we omitted the `common/` directory above since it only holds utility Flows which shouldn’t be run as standalone Flows.

Alternatively, you can avoid updating your `config.yaml` every time you add a feature directory by using a more generic [**__file glob__**](https://en.wikipedia.org/wiki/Glob%5F%28programming%29). This does however require adding the `util` tag to every Flow in the common directory so we can [**__exclude that tag from executing__**](https://docs.maestro.dev/cli/tags#global-tags):

```
# config.yaml
flows:
  - */*

excludeTags:
  - util
```

Those were just a couple common patterns, but you are free to organize your Flow subdirectories as you please using a combination of `flows`, `excludeTags`, and `includeTags`.

## **Use Flow tags to run different sets of Flows in different scenarios**

It’s often useful to maintain separate sets of Flows for different situations. For instance, you may want to run your entire test suite nightly, but only a subset of those Flows on every pull request or commit to your main branch. The easiest way to manage this behavior is using [**__Flow Tags__**](https://docs.maestro.dev/cli/tags#global-tags).

Let’s say you want to run your smoke tests on every pull request. First, tag each smoke test Flow with `smokeTest` (You can name the tag whatever you want):

```
appId: com.example
tags:
  - smokeTest
---
- launchApp
...
```

Then, you’ll be able to run just these flows by including the `smokeTest` tag when uploading to Maestro Cloud. The example below shows how you can configure this in a GitHub workflow. The last line is the relevant configuration:

```
name:  Run Smoke Tests

on:
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: macOS-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install Xcode
        uses: maxim-lobanov/setup-xcode@v1
        with:
          xcode-version: latest
      - run: xcodebuild -project MyApp.xcodeproj -scheme MyApp -destination 'platform=iOS Simulator,name=iPhone 11'
      - uses: mobile-dev-inc/action-maestro-cloud@v1.2.3
        with:
          api-key: ${{ secrets.MAESTRO_CLOUD_API_KEY }}
          app-file: <app_name>.app
          include-tags: smokeTest
```

Or when running on the command line, use the `--includeTags` option:

```
$ maestro test --includeTags smokeTest .maestro/
$ maestro cloud --includeTags smokeTest example.app/ .maestro/
```

To run the full test suite, simply omit the `include-tags/--includeTags` configuration. Your nightly GitHub workflow might look something like the config below. Note that the `include-tags` key is not specified this time:

```
name:  Run Nightly Test Suite
on:
  schedule:
    - cron: '0 2 * * *' # run at 2 AM UTC

jobs:
  build:
    runs-on: macOS-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install Xcode
        uses: maxim-lobanov/setup-xcode@v1
        with:
          xcode-version: latest
      - run: xcodebuild -project MyApp.xcodeproj -scheme MyApp -destination 'platform=iOS Simulator,name=iPhone 11'
      - uses: mobile-dev-inc/action-maestro-cloud@v1.2.3
        with:
          api-key: ${{ secrets.MAESTRO_CLOUD_API_KEY }}
          app-file: <app_name>.app
```

---

# Arrange your repository for Maestro tests

Lots of teams choose to keep their Maestro tests alongside the code for their application. That way, a build from a few months back that now needs a patch also has the correct version of the tests sat with them, and a new feature branch that changes how login works can have the changes to the test flows developed right alongside.

But what's a good way to lay this out?

Boring tester answer: it depends :smile:

### Journeys

If you arrange your tests as journeys through your application, then you likely want some top-level folder to contain them, and only start organising them into deeper subfolders once they become unwieldy. Maybe you end up with something like this:

```
├── flows
│   ├── config.yaml
│   ├── login.yaml
│   ├── register.yaml
│   └── shopping.yaml
└── src
    └── app
        └── <code here>
```

Which later spreads into something deeper, once you decide to start splitting. Here, I've broken this up between flows centered around new and existing users, and an extra folder to contain utility scripts that might be shared.

```
├── flows
│   ├── config.yaml
│   ├── tests
│   │   ├── new_users
│   │   │   ├── register.yaml
│   │   │   └── shopping_first_time_discount.yaml
│   │   └── existing_users
│   │       ├── account_settings.yaml
│   │       ├── deeplink_from_email.yaml
│   │       ├── deeplink_from_notification.yaml
│   │       ├── login.yaml
│   │       ├── shopping.yaml
│   │       └── shopping_bulk_buy_discount.yaml
│   └── utils
│       └── set_discount_code.js
└── src
    └── app
        └── <code here>
```

*In this example, the instructions in* [*Controlling What Tests to Include*](../../../cli/test-suites-and-reports#controlling-what-tests-to-include) *have been used to set inclusion patterns in the config.yaml to include everything below the 'tests' folder.*

### Features

For testing approaches that are centered on validating the behaviours of individual features or requirements, you might choose to mirror the source structure, so that the tests are easy to find and maintain:

```
├── flows
│   ├── config.yaml
│   ├── account
│   │   └── set_display_name.yaml
│   ├── auth
│   │   ├── login.yaml
│   │   ├── login_invalid.yaml
│   │   └── login_locked_account.yaml
│   ├── basket
│   │   ├── add_to_cart.yaml
│   │   └── update_cart.yaml
│   └── checkout
│       ├── complete_purchase.yaml
│       └── save_for_later.yaml
└── src
    └── app
        ├── account
        │   └── <code here>
        ├── auth
        │   └── <code here>
        ├── basket
        │   └── <code here>
        └── checkout
            └── <code here>
```

---

# scrollUntilVisible for fragments

Our friends at Amicara hit a problem with their app that Maestro couldn't natively solve. They wanted to use `scrollUntilVisible`, but it wasn't working for them.

Now, under the hood, scrollUntilVisible works like this:
1. Checks for the visibility of the element described by the selector
2. Swipe up from the center of the screen
3. Go to step 1

Now, in Amicara's app, scrolling from the middle wouldn't work - only the bottom half of the app had scrollable elements.

<figure><img src="[https://2384395183-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2Fn5KVIOjVkVjYRyVWZ0yT%2Fuploads%2FEivWNemODcPbIY5lOi1a%2Fimage.png?alt=media&#x26;token=a8735f96-58eb-47da-b771-99f64132d4c0](https://2384395183-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2Fn5KVIOjVkVjYRyVWZ0yT%2Fuploads%2FEivWNemODcPbIY5lOi1a%2Fimage.png?alt=media&#x26;token=a8735f96-58eb-47da-b771-99f64132d4c0)" alt="" width="375"><figcaption></figcaption></figure>

Working with their test developers and other folks in the community, we developed a new version of scrollUntilVisible through native Maestro commands.

```yaml
- evalScript: ${output.foundElement = 0}

# Check if it's already visible
- runFlow:
    when:
      visible:
        id: "the_thing_we_want"
    commands:
      - evalScript: ${output.foundElement = 1}

# Loop until found
- repeat:
    while:
      true: ${output.foundElement == 0}
    commands:
      # Swipe up, from 90% down the screen to 75% down the screen
      - swipe:
          start: 50%, 90%
          end: 50%, 75%
      # Check if it's visible yet
      - runFlow:
          when:
            visible:
              id: "the_thing_we_want"
          commands:
            - evalScript: ${output.foundElement = 1}
```
