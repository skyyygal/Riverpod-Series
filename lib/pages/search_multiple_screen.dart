import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_series/provider/search_multiple_provider.dart';

class SearchMultipleScreen extends ConsumerWidget {
  const SearchMultipleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Screen")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              print("object");
              ref.read(searchMultipleProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print("text");
              final search = ref.watch(
                searchMultipleProvider.select((state) => state.search),
              );
              return Text(search);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print("toggle");
              final isChanged = ref.watch(
                searchMultipleProvider.select((state) => state.isChanged),
              );
              return Switch(
                value: isChanged,
                onChanged: (value) {
                  ref.read(searchMultipleProvider.notifier).onChanged(value);
                  //   final stateMultipleProvider = ref.read(searchMultipleProvider.notifier);
                  // stateMultipleProvider.state = stateMultipleProvider
                  //       .copyWith(isChanged: value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
