import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

abstract class IPostService {
  Future<List<Post>?> fetchPostAsync();
}

class PostService implements IPostService {
  String baseUrl =
      'https://ed05a9f2-0e36-4fe1-9963-e3d98a2963ae.mock.pstmn.io';

  @override
  Future<List<Post>?> fetchPostAsync() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));

      if (response.statusCode == HttpStatus.ok) {
        List jsonResponse = json.decode(response.body);
        List<Post>? result =
            jsonResponse.map((post) => Post.fromJson(post)).toList();

        if (kDebugMode) {
          print(result);
        }

        return result;
      }
    } on http.ClientException catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

//enum _PostServicePaths { posts }

class _ShowDebug {
  static void showDioError<T>(http.ClientException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}
