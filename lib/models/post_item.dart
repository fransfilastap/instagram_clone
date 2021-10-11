enum PostType { Photo, Video }

class PostItem {
  final String itemUrl;
  final PostType type;

  PostItem({
    required this.itemUrl,
    required this.type,
  });
}
