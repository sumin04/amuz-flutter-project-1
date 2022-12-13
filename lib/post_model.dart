// class Post {
//   // final이란 최초 선언 시 어떠한 변수형으로도 사용이 가능하지만 선언 이후엔 값조차 변경할 수 없다.
//   // final int userId;
//   final String userId;
//   // final int id;
//   // final String title;
//   // final String completed;
//
//   Post({
//     required this.userId,
//     // required this.id,
//     // required this.title,
//     // required this.completed,
//   });
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       userId: json['userId'],
//       // userId: json['id'],
//       // userId: json['title'],
//       // userId: json['completed'],
//     );
//   }
// }