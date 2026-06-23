import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';

import 'config/theme/app_theme.dart';
import 'injection_container.dart';

void main() async {
  await dotenv.load();

  await configureDependencies();

  log('Api key $apiKey');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => getIt<RemoteArticleBloc>()..add(GetArticlesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DailyNews(),
        theme: theme(),
      ),
    );
  }
}
