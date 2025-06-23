import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_series/service/post_service.dart';

import '../model/get_post_models.dart';

@immutable
abstract class PostState {}

class InitialPostState extends PostState {}

class LoadingPostState extends PostState {}

class LoadedPostState extends PostState {
  LoadedPostState({required this.posts});
  final List<Post> posts;
}

class ErrorPostState extends PostState {
  final String message;
  ErrorPostState({required this.message});
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(InitialPostState());
  final PostService getPost = PostService();
  fetchPost() async {
    try {
      state = LoadingPostState();
      List<Post> posts = await getPost.getPosts();
      state = LoadedPostState(posts: posts);
    } catch (e) {
      state = ErrorPostState(message: e.toString());
    }
  }
}
