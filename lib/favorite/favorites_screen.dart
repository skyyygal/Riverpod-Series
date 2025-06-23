import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_series/favorite/provider/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("List of Fruits")),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              ref.read(favoriteProvider.notifier).favorite(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "All", child: Text("All")),
                PopupMenuItem(value: "Favorites", child: Text("Favorites")),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                ref.read(favoriteProvider.notifier).filteredList(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteList.allItems.length,
              itemBuilder: (context, index) {
                final item = favoriteList.allItems[index];
                return ListTile(
                  title: Text(item.name),
                  leading: Text(item.emoji!),
                  trailing: Icon(
                    item.favorite ? Icons.favorite : Icons.favorite_border,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favoriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
