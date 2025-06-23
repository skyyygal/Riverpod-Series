import 'package:riverpod_series/model/item_models.dart';

class FavoritesStates {
  final List<Items> allItems;
  final List<Items> filteredItems;
  final String search;
  FavoritesStates({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavoritesStates copyWith({
    List<Items>? allItems,
    List<Items>? filteredItems,
    String? search,
  }) {
    return FavoritesStates(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
