import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/constants/colors.dart';

class InstagramNavbar extends StatelessWidget {
  const InstagramNavbar({Key? key, required this.items}) : super(key: key);
  final List<InstagramNavbarItem> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: kInstagramGrey, width: 0.5))),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: items.map((e) => e).toList()),
          ),
        ],
      ),
    );
  }
}

class InstagramNavbarItem extends StatelessWidget {
  const InstagramNavbarItem(
      {Key? key,
      required this.iconUrl,
      this.height = 30,
      this.width = 30,
      this.isAvatar = false})
      : super(key: key);
  final String iconUrl;
  final double height;
  final double width;
  final bool isAvatar;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: !isAvatar
          ? SvgPicture.asset(
              iconUrl,
              fit: BoxFit.fitWidth,
            )
          : Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage("assets/images/my_profile_picture.jpeg"))),
            ),
    );
  }
}
