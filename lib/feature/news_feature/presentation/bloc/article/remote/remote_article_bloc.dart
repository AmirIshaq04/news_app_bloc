import 'package:news/core/resources/data_state.dart';
import 'package:news/feature/news_feature/domain/usecases/get_artical.dart';
import 'package:news/feature/news_feature/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news/feature/news_feature/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticalUseCase _articalUseCase;
  RemoteArticleBloc(this._articalUseCase) : super(RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }
  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _articalUseCase();
    if (dataState is DataSucces && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
