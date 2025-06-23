import 'package:riverpod/riverpod.dart';
import 'package:riverpod_series/state/get_api_state.dart';

final getPostProvider = StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier();
});
// final getPostProvider = FutureProvider<List<Post>>((ref) async {
//   List<Post> posts = [];
//   try {
//     final response = await http.get(Uri.parse(ApiUrls.posts));

//     if (response.statusCode == 200) {
//       List postList = convert.jsonDecode(response.body);
//       for (var element in postList) {
//         Post post = Post.fromMap(element);
//         posts.add(post);
//       }
//     }
//     return posts;
//   } catch (e) {
//     log(e.toString());
//   }
//   return posts;
//   // throw "Exception Error";
// });
