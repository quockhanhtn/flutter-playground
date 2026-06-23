import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  /// Get Articles from api
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  /// Get Articles from database
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
