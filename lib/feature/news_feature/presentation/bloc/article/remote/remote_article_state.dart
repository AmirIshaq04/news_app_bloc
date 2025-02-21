import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news/feature/news_feature/domain/entities/article.dart';

class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError? error;
  RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

class RemoteArticlesLoading extends RemoteArticleState {
  RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  RemoteArticlesDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticlesError extends RemoteArticleState {
  RemoteArticlesError(DioError error) : super(error: error);
  
}
