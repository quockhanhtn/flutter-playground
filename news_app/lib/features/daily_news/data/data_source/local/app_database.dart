import 'dart:async';

import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/data/data_source/local/article_dao.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';
import 'package:sqflite_common/sqflite.dart' as sqflite;
import 'package:sqflite_common/sqlite_api.dart' hide Database;

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
