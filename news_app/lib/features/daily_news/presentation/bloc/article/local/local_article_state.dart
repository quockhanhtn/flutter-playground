part of 'local_article_bloc.dart';

sealed class LocalArticleState extends Equatable {
  final List<ArticleEntity>? listArticles;

  const LocalArticleState({this.listArticles});

  @override
  List<Object> get props => [listArticles!];
}

final class LocalArticleLoading extends LocalArticleState {}

final class LocalArticleDone extends LocalArticleState {
  const LocalArticleDone(List<ArticleEntity> data) : super(listArticles: data);
}
