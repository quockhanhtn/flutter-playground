import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'remote_article_state.dart';

import 'remote_article_event.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUsecase _getArticleUsecase;

  RemoteArticleBloc(this._getArticleUsecase) : super(RemoteArticlesLoading()) {
    on<GetArticlesEvent>(onGetArticles);
  }

  void onGetArticles(
    GetArticlesEvent event,
    Emitter<RemoteArticleState> emit,
  ) async {
    final dataState = await _getArticleUsecase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
