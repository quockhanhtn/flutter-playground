import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_source/local/app_database.dart';
import 'package:news_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResp = await _newsApiService.getNewsArticles(
        apiKey: apiKey,
        country: apiCountryQuery,
        category: apiCategoryQuery,
      );

      if (httpResp.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResp.data);
      }

      return DataFailed(
        DioError(
          error: httpResp.response.statusMessage,
          response: httpResp.response,
          type: DioErrorType.response,
          requestOptions: httpResp.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDao.deleteArticle(
      ArticleModel.fromEntity(article),
    );
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDao.insertArticle(
      ArticleModel.fromEntity(article),
    );
  }
}
