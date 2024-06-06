class _CoverImage {
  String fileName;
  String url;

  _CoverImage({
    required this.fileName,
    required this.url,
  });

  factory _CoverImage.fromJson(Map<dynamic, dynamic> json) {
    return _CoverImage(
      fileName: json['fileName'],
      url: json['url'],
    );
  }
}

class News {
  String id;
  String title;
  String preview;
  _CoverImage coverImage;

  News({
    required this.id,
    required this.title,
    required this.preview,
    required this.coverImage,
  });

  factory News.fromJson(Map<dynamic, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      preview: json['preview'],
      coverImage: _CoverImage.fromJson(json['coverImage']),
    );
  }
}
