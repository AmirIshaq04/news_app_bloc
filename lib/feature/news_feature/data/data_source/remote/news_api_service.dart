import 'package:dio/dio.dart';
import 'package:news/core/constants/constants.dart';
import 'package:news/feature/news_feature/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
//import 'package:retrofit/dio.dart'; // ✅ Import this

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({ 
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
