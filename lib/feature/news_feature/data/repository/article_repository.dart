import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news/core/constants/constants.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/feature/news_feature/data/data_source/remote/news_api_service.dart';
import 'package:news/feature/news_feature/data/models/article.dart';
import 'package:news/feature/news_feature/domain/entities/article.dart';
import 'package:news/feature/news_feature/domain/repositories/article_repository.dart';

class ArticleRepositoryImp implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImp(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getnewsArticles() async {
    try {
    
      final httpResponse = await _newsApiService.getNewsArticle(
        
        apiKey: newsApiKey,
        category: categoryQuery,
        country: countryQuery,
        
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        
        return DataSucces(httpResponse.data);
      } else {
        return DataFailed(DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
