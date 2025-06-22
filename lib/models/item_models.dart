class Item {
  String id;
  String name;

  Item({required this.id, required this.name});
}

class Items {
  final String name;
  final int id;
  final bool favorite;
  String? emoji;
  Items({
    required this.name,
    required this.id,
    required this.favorite,
    this.emoji,
  });

  Items copyWith({String? name, int? id, bool? favorite, String? emoji}) {
    return Items(
      name: name ?? this.name,
      id: id ?? this.id,
      favorite: favorite ?? this.favorite,
      emoji: emoji ?? this.emoji,
    );
  }
}

   /*
  // similar to this.
//Make sure you have written copy method already. Like above
  Items item = Items(name: "Anita", id: 123, favorite: true);
  print(item.name);

  //If i want to change the value of these items. Lets take name.
  final name = item.copyWith(name: "Anitaa pandey");
  print(name.name);
   */