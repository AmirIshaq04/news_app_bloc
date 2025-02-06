import 'dart:io';

import 'package:news/feature/news_feature/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publisedAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author']??"",
      title: map['title']??"",
      description: map['description']??"",
      content: map['content']??"",
      url: map['url']??"",
      urlToImage: map['urlToImage']??"",
      publisedAt: map['publishedAt']??"",

    );
  }
}
