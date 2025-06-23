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
          final expandedIndex = ref.watch(expandedProvider);

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
                final isExpanded = expandedIndex == index;
                final post = getState.posts[index];
                print("Post ${index + 1}: ${post.title}");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      ref.read(expandedProvider.notifier).state = isExpanded
                          ? null
                          : index;
                    },
                    leading: CircleAvatar(child: Text(post.id.toString())),
                    title: Text(post.title.trimRight()),
                    subtitle: isExpanded ? Text(post.body) : null,
                    trailing: Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                    ),
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
