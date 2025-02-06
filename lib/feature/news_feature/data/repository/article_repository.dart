import 'package:news/core/resources/data_state.dart';
import 'package:news/feature/news_feature/data/models/article.dart';
import 'package:news/feature/news_feature/domain/entities/article.dart';
import 'package:news/feature/news_feature/domain/repositories/article_repository.dart';

class ArticleRepositoryImp implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getnewsArticles() {
    throw UnimplementedError();
  }
}
