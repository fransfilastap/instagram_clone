import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/models/instastory.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/screens/widgets/bottom_navbar.dart';
import 'package:instagram_clone/screens/widgets/post.dart';

class InstagramHome extends StatelessWidget {
  const InstagramHome({Key? key}) : super(key: key);

  static List<Instastory> instastories = Instastory.generateInstaStories();
  static List<Post> posts = Post.generatePosts();

  @override
  Widget build(BuildContext context) {
    var postWidgets = posts
        .map((e) => InstaPostWidget(
              post: e,
            ))
        .toList();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: SizedBox(
                    height: 50,
                    width: 130,
                    child: SvgPicture.asset("assets/icons/Instagram_logo.svg",
                        semanticsLabel: 'Logo')),
              )
            ]),
        actions: [
          SizedBox(
            width: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _instActButton(
                      iconUrl: "assets/icons/Add_Icon_filled.svg", act: () {}),
                  _instActButton(
                      iconUrl: "assets/icons/Heart.svg",
                      width: 28,
                      height: 28,
                      act: () {}),
                  _instActButton(iconUrl: "assets/icons/Share.svg", act: () {}),
                ],
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _instaStoryLine(),
            ...postWidgets,
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(
        child: InstagramNavbar(
          items: [
            InstagramNavbarItem(iconUrl: "assets/icons/Home.svg"),
            InstagramNavbarItem(iconUrl: "assets/icons/Search.svg"),
            InstagramNavbarItem(iconUrl: "assets/icons/Reels.svg"),
            InstagramNavbarItem(
              iconUrl: "assets/icons/Shop.svg",
              height: 33,
              width: 33,
            ),
            InstagramNavbarItem(
              iconUrl: "assets/images/my_profile_picture.jpeg",
              isAvatar: true,
            )
          ],
        ),
      ),
    );
  }

  Widget _instaStoryLine() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 130,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: kInstagramGrey, width: 0.5)),
        ),
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 10, right: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _InstaStory(
                  story: instastories[index],
                ),
            separatorBuilder: (_, index) => const SizedBox(
                  width: 16,
                ),
            itemCount: instastories.length));
  }

  GestureDetector _instActButton(
      {required String iconUrl,
      required Function act,
      double? height,
      double? width}) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SvgPicture.asset(
          iconUrl,
          height: height ?? 25,
          width: width ?? 25,
        ),
      ),
      onTap: () => act,
    );
  }
}

class _InstaStory extends StatelessWidget {
  final Instastory story;
  final String myStoryText = "Your Story";

  const _InstaStory({
    Key? key,
    required this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  story.isLive
                      ? _liveStory(story.user.profilePicture)
                      : _regularStory(story.user.profilePicture),
                  story.isLive
                      ? Positioned(
                          bottom: 5, left: 10, right: 10, child: _liveBadge())
                      : const Text("")
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: Text(
                (story.isMine ? myStoryText : story.user.username),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12.4,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
            )
          ]),
    );
  }

  Widget _liveBadge() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 3.3),
          gradient: kInstagramLiveGradient,
        ),
        child: const Text("LIVE",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    ]);
  }

  Widget _liveStory(String profilePic) {
    return Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
            gradient: kInstagramLiveGradient, shape: BoxShape.circle),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              border: Border.all(color: Colors.white, width: 3)),
          child: AvatarGlow(
            child: LiveStoryAvatar(profilePic: profilePic),
            glowColor: Colors.white,
            endRadius: 40.0,
            duration: const Duration(seconds: 2),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: const Duration(milliseconds: 100),
          ),
        ));
  }

  Widget _regularStory(String profilePic) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          gradient: story.isSeen ? kInstagramGreyGradient : kInstagramGradient,
          shape: BoxShape.circle),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            image: DecorationImage(
                image: AssetImage(profilePic), fit: BoxFit.cover)),
      ),
    );
  }
}

class LiveStoryAvatar extends StatefulWidget {
  const LiveStoryAvatar({Key? key, required this.profilePic}) : super(key: key);

  final String profilePic;

  @override
  _LiveStoryAvatarState createState() => _LiveStoryAvatarState();
}

class _LiveStoryAvatarState extends State<LiveStoryAvatar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final Tween<double> _tween = Tween(begin: 0.95, end: 1);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _tween.animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticInOut)),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.profilePic),
                fit: BoxFit.cover,
              ))),
    );
  }
}
