
--- 

<div align="center">

[![pub package](https://img.shields.io/pub/v/flutter_klipper.svg)](https://pub.dev/packages/flutter_klipper)
[![GitHub license](https://img.shields.io/github/license/Alexandre2006/flutter_klipper)](LICENSE.md)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

</div>

---

<h1 align="center">
  <!--<img src="https://raw.githubusercontent.com/<your_username>/<your_repository>/main/assets/flutter_klipper_logo.png" alt="Flutter Klipper Logo" width="200">
  <br>-->
  Flutter Klipper
</h1>

<p align="center">
  <strong>Control 3D printers with Klipper firmware via Moonraker using Dart/Flutter</strong>
</p>

---

<p align="center">
  <a href="#how-to-use">How to Use</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

---

<p align="center">

<img src="https://repobeats.axiom.co/api/embed/c019550dd5cc0a7769b47efb31f29c9c6283ba9d.svg" alt="Repobeats analytics image"/>

</p>

---

<h2 align="center">How to Use</h2>

To use `flutter_klipper`, start by installing the package from [pub.dev](https://pub.dev/packages/flutter_klipper). You can do this by adding the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_klipper: ^{latest version}
```

Once you've installed the package, you can refer to the [documentation](https://klipper.thinkalex.dev) for details on how to use the client API. Here are the basic steps to get started:

1. Import the `flutter_klipper` package in your Dart code:

```dart
import 'package:flutter_klipper/flutter_klipper.dart';
```

2. Create a new `Klipper` instance and connect to your printer:

```dart
Klipper klipper = Klipper('raspberrypi.local');
```

If necessary, you can use the `port` parameter to specify a custom port. The default port is `7125`. You can also use the `token` parameter to specify a custom token.

This instance of Klipper will repeatedly attempt to connect to the printer until it is successful. If Klipper gets disconnected, it will attempt to reconnect automatically. To manually close the connection, use the `close()` method:

```dart
klipper.close();
```

3. Listen for events from Klipper:

```dart
klipper.statusNotifier.ready.addListener(
    (ready) => {print("Connected and ready to receive commands!")});
```

4. Send commands to the printer:

```dart
klipper.sendCommand(RunGCodeCommand('G28')); // Home the printer
```
<br/>

That's it! You can now use the flutter_klipper package to control your Klipper-based 3D printer via Moonraker. For more information, refer to the [documentation](https://klipper.thinkalex.dev).

---

<h2 align="center">Contributing</h2>

We welcome contributions to `flutter_klipper`! If you would like to contribute, please follow these steps:

1. Fork the repository and create a new branch for your changes.
2. Make your changes, including adding tests where appropriate.
3. Run the tests using `flutter test`.
4. Ensure that your code adheres to the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style), with the exception of using the [`lint`](https://pub.dev/packages/lint) style instead of the default [`lints`](https://pub.dev/packages/lints) style.
5. Submit a pull request.

We will review your changes and provide feedback as needed. Please note that all contributions will be subject to review and approval before being merged into the main repository.

Thank you for your interest in contributing to `flutter_klipper`!

---

<h2 align="center">Credits</h2>

`flutter_klipper` would not be possible without the amazing work of the following projects:

- [Klipper](https://github.com/Klipper3d/klipper): The 3D printer firmware that `flutter_klipper` communicates with.
- [Moonraker](https://github.com/Arksine/moonraker): The web-based interface that allows remote control of Klipper.
- [Flutter](https://flutter.dev/): The open-source UI toolkit that `flutter_klipper` is built on.
- [Dart](https://dart.dev/): The programming language used to develop `flutter_klipper`.
- and all contributors who have supported this project.

We would like to express our gratitude to the developers of these projects and the entire open-source community for their contributions to the world of 3D printing and software development.

---

<h2 align="center">License</h2>

<table align="center">
    <tr>
        <td>Permissions</td>
        <td>Conditions</td>
        <td>Limitations</td>
    </tr>
    <tr>
        <td>Commercial use</td>
        <td>Disclose source</td>
        <td>Liability</td>
    </tr>
    <tr>
        <td>Modification</td>
        <td>Same license</td>
        <td>Warranty</td>
    </tr>
    <tr>
        <td>Distribution</td>
        <td>State changes</td>
        <td></td>
    </tr>
    <tr>
        <td>Patent use</td>
        <td>License and copyright notice</td>
        <td></td>
    </tr>
    <tr>
        <td>Private use</td>
        <td></td>
        <td></td>
    </tr>
</table>

---

Flutter Klipper is licensed under the GNU General Public License v3.0. You may obtain a copy of the License at https://www.gnu.org/licenses/gpl-3.0.en.html.

This means that any software using or distributing Flutter Klipper must also be licensed under the GPLv3 or a compatible license. Additionally, any modifications to the code must also be released under the same license.

For more information about open-source licensing and the GPL, please visit the Open Source Initiative.

Note that this license does not apply to any third-party libraries used by Flutter Klipper, which are each distributed under their own respective licenses. Please refer to the documentation of each library for details.

The full license is available in the [LICENSE](LICENSE.md) file.
