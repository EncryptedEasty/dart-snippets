### dart-snippets

`dart-snippets` is a collection of useful snippets and code utilities for Flutter and Dart development.

---

### Installation

To use the code snippets in this repository, you can simply copy and paste the code into your project. Alternatively, you can clone this repository and import the code snippets you need.

### Snippets

#### `getEmptyContainer()`

This function returns an empty `SizedBox` widget with no width and no height. This can be useful for spacing or for adding an empty widget as a placeholder in a layout.

```dart
import 'emptyContainer.dart';

// Example usage
child: Column(
  children: [
    Text('Title'),
    getEmptyContainer(),
    Text('Description'),
  ],
),

```

---

#### `HexColor` extension

This extension adds a `fromHex()` method to the `Color` class, which creates a `Color` object from a hexadecimal string. The extension also adds a `toHex()` method, which converts a `Color` object to a hexadecimal string with an optional leading hash sign. This can be useful for working with colors in a Flutter application and converting between different color representations.

```dart
import 'hexColor.dart';

// Example usage
Color color = HexColor.fromHex('#FF0000');
String hexString = color.toHex(); // returns '#FF0000'

```

---

#### HTTP Request functions

These functions use the `http` package to make HTTP requests and return the response as a specified data type. The `get()`, `post()`, `patch()`, `put()`, and `delete()` functions each take a URL as an argument and send an HTTP request with the corresponding method. The response is checked for errors, and if successful, the response body is decoded and converted to an object of the specified type using the `fromJson()` method, which must be implemented by the corresponding class. These functions provide a convenient and type-safe way to make HTTP requests in a Flutter application.

```dart
import 'http.dart';

// Example usage
Future<User> getUser(int userId) async {
  final response = await get('https://example.com/users/$userId');
  return User.fromJson(response.body);
}

```

### License

This repository is licensed under the MIT License. See the [LICENSE](https://github.com/EncryptedEasty/dart-snippets/blob/main/LICENSE) file for more information.
