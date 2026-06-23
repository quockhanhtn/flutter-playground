import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Dio
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<NewsApiService>(NewsApiService(getIt()));
  getIt.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(getIt()));

  // usecase
  getIt.registerSingleton<GetArticleUsecase>(GetArticleUsecase(getIt()));

  // blocs
  getIt.registerSingleton<RemoteArticleBloc>(RemoteArticleBloc(getIt()));
}
