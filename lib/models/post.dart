import 'package:instagram_clone/models/post_item.dart';
import 'package:instagram_clone/models/user.dart';

class Post {
  final InstagramUser user;
  final List<PostItem> postItems;
  final String caption;
  String? location;
  final int likedBy;

  Post(
      {required this.user,
      required this.postItems,
      required this.likedBy,
      this.location,
      required this.caption});

  static List<Post> generatePosts() {
    return [
      Post(
          caption: "Kangen pempek 🥲",
          location: "Pempek Pico",
          user: InstagramUser(
              username: "haleyreinhart",
              profilePicture: "assets/images/haley_reinhart.jpg",
              isVerified: true),
          postItems: [
            PostItem(
                itemUrl: "assets/images/haley_reinhart.jpg",
                type: PostType.Photo)
          ],
          likedBy: 1086),
      Post(
          caption: "Am I Handsome?",
          user: InstagramUser(
              username: "brianimanual",
              profilePicture: "assets/images/rich_brian.jpg",
              isVerified: true),
          postItems: [
            PostItem(
                itemUrl: "assets/images/rich_brian.jpg", type: PostType.Photo)
          ],
          likedBy: 1086),
      Post(
          caption: "I am 18",
          user: InstagramUser(
              username: "billieilish",
              profilePicture: "assets/images/billie_eilish.jpeg",
              isVerified: true),
          postItems: [
            PostItem(
                itemUrl: "assets/images/billie_eilish.jpeg",
                type: PostType.Photo)
          ],
          likedBy: 1086)
    ];
  }
}
