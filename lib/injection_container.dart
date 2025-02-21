import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/feature/news_feature/data/data_source/local/DAO/app_database.dart';
import 'package:news/feature/news_feature/data/data_source/remote/news_api_service.dart';
import 'package:news/feature/news_feature/data/repository/article_repository.dart';
import 'package:news/feature/news_feature/domain/repositories/article_repository.dart';
import 'package:news/feature/news_feature/domain/usecases/get_artical.dart';
import 'package:news/feature/news_feature/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // final database =
  //     await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //     sl.registerSingleton<AppDatabase>(database);
  //Dio

  sl.registerSingleton<Dio>(Dio());
  //Dependencies

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImp(sl()));
  //usecases

  sl.registerSingleton<GetArticalUseCase>(GetArticalUseCase(sl()));

  //bloc
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
