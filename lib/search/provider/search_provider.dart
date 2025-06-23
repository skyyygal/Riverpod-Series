//State Notifier Provider.
//Used For handling complex state

//It requires a "notifier" and a "state" of any data type
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, String>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<String> {
  //Creating contructor
  SearchNotifier() : super("");

  void search(String query) {
    state = query;
  }
}
