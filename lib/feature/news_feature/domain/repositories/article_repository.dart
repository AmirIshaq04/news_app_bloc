import 'package:news/core/resources/data_state.dart';
import 'package:news/feature/news_feature/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getnewsArticles();
}
