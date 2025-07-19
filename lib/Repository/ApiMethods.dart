import 'dart:convert';
import 'dart:io';

import 'package:bloc_example/Models/PostModel.dart';
import 'package:http/http.dart' as http;

class Apimethods {
  Future<List<PostModel>> getPostList() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body
            .map((e) => PostModel(
                  body: e['body'] as String,
                  email: e['email'] as String,
                  id: e['id'] as int,
                  name: e['name'] as String,
                  postId: e['postId'] as int,
                ))
            .toList();
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } catch (e) {
      throw Exception("Error in fetching data: $e");
    }
  }
}
