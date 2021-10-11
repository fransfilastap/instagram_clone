import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/models/post.dart';

class InstaPostWidget extends StatelessWidget {
  const InstaPostWidget({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _postHeader(),
          _postContent(),
          _postFooter(),
          _postComments(),
        ],
      ),
    );
  }

  Widget _postHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  gradient: kInstagramGradient,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                          image: AssetImage(post.user.profilePicture))),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.user.username,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  post.location != null
                      ? Text(
                          post.location!,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        )
                      : Row(),
                ],
              ),
            ],
          ),
          GestureDetector(child: const Icon(Icons.more_vert_outlined))
        ],
      ),
    );
  }

  Widget _postContent() {
    return Image.asset(post.postItems[0].itemUrl);
  }

  Widget _postFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _postActionButton(
                    act: () {}, iconUrl: "assets/icons/Heart.svg"),
                _postActionButton(
                    act: () {}, iconUrl: "assets/icons/Comment.svg"),
                _postActionButton(
                    act: () {}, iconUrl: "assets/icons/Share2.svg"),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: _postActionButton(
                  act: () {}, iconUrl: "assets/icons/Bookmark.svg"),
            ),
          )
        ],
      ),
    );
  }

  Widget _postComments() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                        text: post.user.username,
                        style: const TextStyle(
                            fontFamily: "SF",
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    TextSpan(
                        text: " ${post.caption}",
                        style: const TextStyle(
                            fontFamily: "SF", color: Colors.black)),
                  ]))),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: const Text(
                    "17 minutes ago",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: "SF", color: Colors.black45, fontSize: 11),
                  )),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                  child: const Text(
                    "See Translation",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: "SF", color: Colors.black, fontSize: 11),
                  )),
            ],
          ),
        ]);
  }

  GestureDetector _postActionButton(
      {required String iconUrl,
      required Function act,
      double? height,
      double? width}) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SvgPicture.asset(
          iconUrl,
          height: height ?? 30,
          width: width ?? 30,
        ),
      ),
      onTap: () => act,
    );
  }
}
