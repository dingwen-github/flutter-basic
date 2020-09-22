import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

/// 使用 mock 模拟一个 http.Client 对象
class MockClient extends Mock implements http.Client {}

void main() {
  group("fetchPost", () {
    test("接口返回数据正确", () async {
      final client = MockClient();

      // 当调用指定的接口的时候返回指定的数据
      when(client.get("https://jsonplaceholder.typicode.com/posts/1"))
          .thenAnswer((_) async {
        return http.Response(
            '{"title": "test title", "body": "test body"}', 200);
      });
      var post = await fetchPost(client);
      expect(post.title, "test title");
    });

    test("接口返回数据错误，抛出异常", () {
      final client = MockClient();

      // 当调用这个接口的时候返回 Not Found
      when(client.get("https://jsonplaceholder.typicode.com/posts/1"))
          .thenAnswer((_) async {
        return http.Response('Not Found', 404);
      });
      expect(fetchPost(client), throwsException);
    });
  });
}

Future<Post> fetchPost(http.Client client) async {
  final response =
  await client.get("https://jsonplaceholder.typicode.com/posts/1");
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Post {
  final String title;

  const Post({this.title});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
        title: json['title']
    );
  }
}

