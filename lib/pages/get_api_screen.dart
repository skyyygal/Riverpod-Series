import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_series/provider/get_api_provider.dart';
import 'package:riverpod_series/state/get_api_state.dart';

class Post extends ConsumerWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: Consumer(
        builder: (context, ref, child) {
          final getState = ref.watch(getPostProvider);
          if (getState is InitialPostState) {
            print("InitialPostState");
            return Center(child: Text("Press FAB to Fetch data"));
          }
          if (getState is LoadingPostState) {
            print("LoadingPostState");
            return Center(child: CircularProgressIndicator());
          }
          if (getState is ErrorPostState) {
            print("ErrorPostState");
            return Text(getState.message);
          }
          if (getState is LoadedPostState) {
            print("LoadedPostState");
            print("Total posts: ${getState.posts.length}");

            return ListView.builder(
              itemCount: getState.posts.length,
              itemBuilder: (context, index) {
                final post = getState.posts[index];
                print("Post ${index + 1}: ${post.title}");
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(post.id.toString())),
                    title: Text("post.title: ${post.title}"),
                    subtitle: Text(post.body),
                  ),
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          return FloatingActionButton(
            onPressed: () {
              ref.read(getPostProvider.notifier).fetchPost();
            },
            child: Icon(Icons.refresh),
          );
        },
      ),
    );
  }
}
