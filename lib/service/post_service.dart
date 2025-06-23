import 'dart:convert' as convert;
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:riverpod_series/model/get_post_models.dart';
import 'package:riverpod_series/utils/api_url.dart';

class PostService {
  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    try {
      final response = await http.get(
        Uri.parse(ApiUrls.posts),
        headers: {
          'Content-Type': 'application/json',
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
              '(KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        },
      );
      print("RAW API RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        print("API RESPONSE: ${response.body}");
        List postList = convert.jsonDecode(response.body);
        for (var element in postList) {
          Post post = Post.fromMap(element);
          posts.add(post);
        }
      }
      return posts;
    } catch (e) {
      log(e.toString());
    }
    return posts;
  }
}
