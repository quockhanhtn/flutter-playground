import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article_usecase%20copy.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article_usecase.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUsecase _getSavedArticlesUsecase;
  final SaveArticleUsecase _saveArticleUsecase;
  final RemoveArticleUsecase _removeArticleUsecase;

  LocalArticleBloc(
    this._getSavedArticlesUsecase,
    this._saveArticleUsecase,
    this._removeArticleUsecase,
  ) : super(LocalArticleLoading()) {
    on<GetSavedArticles>((event, emit) async {
      await _loadArticles(emit);
    });

    on<SaveArticle>((event, emit) async {
      await _saveArticleUsecase(params: event.article);
      await _loadArticles(emit);
    });

    on<RemoveArticle>((event, emit) async {
      await _removeArticleUsecase(params: event.article);
      await _loadArticles(emit);
    });
  }

  Future<void> _loadArticles(Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticlesUsecase();
    emit(LocalArticleDone(articles));
  }
}
