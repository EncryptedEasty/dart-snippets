import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<T> get<T>(String url) async {
  if (url.trim().isNotEmpty) {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response != null) {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return (T as dynamic).fromJSON(jsonDecode(response.body));
        } else {
          dynamic body =
              response.body != null ? jsonDecode(response.body) : null;

          if (body != null) {
            throw HttpException(body.message);
          } else {
            throw HttpException('test');
          }
        }
      } else {
        throw HttpException('test');
      }
    } on SocketException catch (error) {
      throw HttpException(error.toString());
    } on HttpException catch (errorMessage) {
      print(errorMessage);
      throw errorMessage;
    }
  } else {
    throw Exception('URL is empty');
  }
}

Future<T> post<T>(String url) async {
  if (url.trim().isNotEmpty) {
    return (T as dynamic)
        .fromJson(jsonDecode((await http.post(Uri.parse(url))).body));
  } else {
    throw Exception('URL is empty');
  }
}

Future<T> patch<T>(String url) async {
  if (url.trim().isNotEmpty) {
    return (T as dynamic)
        .fromJson(jsonDecode((await http.patch(Uri.parse(url))).body));
  } else {
    throw Exception('URL is empty');
  }
}

Future<T> put<T>(String url) async {
  if (url.trim().isNotEmpty) {
    return (T as dynamic)
        .fromJson(jsonDecode((await http.put(Uri.parse(url))).body));
  } else {
    throw Exception('URL is empty');
  }
}

Future<T> delete<T>(String url) async {
  if (url.trim().isNotEmpty) {
    return (T as dynamic)
        .fromJson(jsonDecode((await http.delete(Uri.parse(url))).body));
  } else {
    throw Exception('URL is empty');
  }
}
