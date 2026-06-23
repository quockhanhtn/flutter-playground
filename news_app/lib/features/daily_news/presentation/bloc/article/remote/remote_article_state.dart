import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError? error;

  const RemoteArticleState(this.articles, this.error);

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading() : super(null, null);
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> articles)
    : super(articles, null);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioError e) : super(null, e);
}
