import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_source/local/app_database.dart';
import 'package:news_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article_usecase%20copy.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article_usecase.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

import 'features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .build();

  getIt.registerSingleton<AppDatabase>(database);

  // Dio
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<NewsApiService>(NewsApiService(getIt<Dio>()));
  getIt.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(getIt<NewsApiService>(), getIt<AppDatabase>()),
  );

  // usecase
  getIt.registerSingleton<GetArticleUsecase>(GetArticleUsecase(getIt()));
  getIt.registerSingleton<GetSavedArticleUsecase>(
    GetSavedArticleUsecase(getIt()),
  );
  getIt.registerSingleton<SaveArticleUsecase>(SaveArticleUsecase(getIt()));
  getIt.registerSingleton<RemoveArticleUsecase>(RemoveArticleUsecase(getIt()));

  // blocs
  getIt.registerSingleton<RemoteArticleBloc>(RemoteArticleBloc(getIt()));
  getIt.registerSingleton<LocalArticleBloc>(
    LocalArticleBloc(getIt(), getIt(), getIt()),
  );
}
