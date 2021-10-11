import 'package:instagram_clone/models/user.dart';

class Instastory {
  final bool isLive;
  final bool isMine;
  final bool isSeen;
  final InstagramUser user;

  Instastory(
      {required this.isMine,
      required this.isLive,
      required this.user,
      this.isSeen = false});

  static List<Instastory> generateInstaStories() {
    return <Instastory>[
      Instastory(
          isMine: true,
          isLive: false,
          isSeen: true,
          user: InstagramUser(
              username: "fransfp___",
              profilePicture: "assets/images/my_profile_picture.jpeg",
              isVerified: false)),
      Instastory(
          isMine: false,
          isLive: true,
          user: InstagramUser(
              username: "brianimanuel",
              profilePicture: "assets/images/rich_brian.jpg",
              isVerified: true)),
      Instastory(
          isMine: false,
          isLive: false,
          isSeen: true,
          user: InstagramUser(
              username: "warrenhue",
              profilePicture: "assets/images/warren_hue.jpg",
              isVerified: true)),
      Instastory(
          isMine: false,
          isLive: false,
          user: InstagramUser(
              username: "nikizefanya",
              profilePicture: "assets/images/niki.jpg",
              isVerified: true)),
      Instastory(
          isMine: false,
          isLive: false,
          user: InstagramUser(
              username: "billieeilish",
              profilePicture: "assets/images/billie_eilish.jpeg",
              isVerified: true)),
      Instastory(
          isMine: false,
          isLive: false,
          user: InstagramUser(
              username: "haleyreinhart",
              profilePicture: "assets/images/haley_reinhart.jpg",
              isVerified: true)),
      Instastory(
          isMine: false,
          isLive: false,
          user: InstagramUser(
              username: "pmjofficial",
              profilePicture: "assets/images/pmj.jpg",
              isVerified: true)),
      Instastory(
          isMine: false,
          isLive: false,
          user: InstagramUser(
              username: "sezairi",
              profilePicture: "assets/images/sezairi.jpg",
              isVerified: true)),
      Instastory(
          isMine: false,
          isLive: false,
          user: InstagramUser(
              username: "ikoy2an",
              profilePicture: "assets/images/ikoy2an.jpg",
              isVerified: true)),
    ];
  }
}
