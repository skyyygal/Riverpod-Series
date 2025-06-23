/// All API endpoints are managed here for clarity and reusability.
class ApiUrls {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Posts
  static const String posts = '$baseUrl/posts';
  static String postById(int id) => '$baseUrl/posts/$id';

  // Comments
  static const String comments = '$baseUrl/comments';
  static String commentByPostId(int postId) =>
      '$baseUrl/comments?postId=$postId';

  // Users
  static const String users = '$baseUrl/users';
  static String userById(int id) => '$baseUrl/users/$id';

  // Albums
  static const String albums = '$baseUrl/albums';
  static String albumById(int id) => '$baseUrl/albums/$id';

  // Photos
  static const String photos = '$baseUrl/photos';
  static String photosByAlbum(int albumId) =>
      '$baseUrl/photos?albumId=$albumId';

  // Todos
  static const String todos = '$baseUrl/todos';
  static String todoByUser(int userId) => '$baseUrl/todos?userId=$userId';
}
