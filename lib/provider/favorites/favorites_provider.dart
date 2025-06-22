import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_series/models/item_models.dart';
import 'package:riverpod_series/provider/favorites/favorites_states.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, FavoritesStates>((ref) {
      return FavoriteNotifier();
    });

class FavoriteNotifier extends StateNotifier<FavoritesStates> {
  FavoriteNotifier()
    : super(FavoritesStates(allItems: [], filteredItems: [], search: ''));
  // Dummy List using models

  void addItem() {
    List<Items> items = [
      Items(name: "Avocado", id: 1, favorite: false, emoji: "🥑"),
      Items(name: "Watermelon", id: 2, favorite: true, emoji: "🍉"),
      Items(name: "Mango", id: 3, favorite: true, emoji: "🥭"),
      Items(name: "Kiwi", id: 4, favorite: false, emoji: "🥝"),
      Items(name: "Peach", id: 5, favorite: false, emoji: "🍑"),
      Items(name: "Pear", id: 6, favorite: false, emoji: "🍐"),
      Items(name: "Blueberries", id: 7, favorite: false, emoji: "🫐"),
      Items(name: "Apple", id: 8, favorite: true, emoji: "🍎"),
      Items(name: "Grapes", id: 9, favorite: true, emoji: "🍇"),
      Items(name: "Cherries", id: 10, favorite: false, emoji: "🍒"),
      Items(name: "Strawberry", id: 11, favorite: true, emoji: "🍓"),
      Items(name: "Melon", id: 12, favorite: false, emoji: "🍈"),
    ];

    //Now we need to change the state of the app.
    state = state.copyWith(
      allItems: items.toList(),
      filteredItems: items.toList(),
    );
  }

  //Displaying the Favorites
  void favorite(String option) {
    state = state.copyWith(
      allItems: _favoriteItems(state.filteredItems, option),
    );
  }

  List<Items> _favoriteItems(List<Items> items, String option) {
    if (option == 'All') {
      return items;
    }
    return items.where((item) => item.favorite == true).toList();
  }

  //Forwading the input text here
  void filteredList(String search) {
    state = state.copyWith(
      allItems: _filteredItems(state.filteredItems, search),
    );
  }

  List<Items> _filteredItems(List<Items> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
