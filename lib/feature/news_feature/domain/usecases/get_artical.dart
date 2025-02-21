import 'package:news/core/resources/data_state.dart';
import 'package:news/core/usecases/use_case.dart';
import 'package:news/feature/news_feature/domain/entities/article.dart';
import 'package:news/feature/news_feature/domain/repositories/article_repository.dart';

class GetArticalUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticalUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getnewsArticles();
  }
}
