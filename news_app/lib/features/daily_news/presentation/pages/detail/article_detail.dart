import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/injection_container.dart';

class ArticleDetailView extends HookWidget {
  final ArticleEntity? _article;

  const ArticleDetailView({super.key, this._article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_article!.title!, style: TextStyle(fontSize: 26)),

                SizedBox(height: 14),

                Row(
                  children: [
                    const Icon(Icons.schedule, size: 16),
                    SizedBox(width: 4),
                    Text(_article.publishedAt!, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: double.maxFinite,
            height: 250,
            margin: EdgeInsets.only(top: 14),
            child: Image.network(_article.urlToImage!, fit: BoxFit.cover),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: Text(
              '${_article.description ?? ''}\n\n${_article.content ?? ''}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onBookmarkPressed(context),
        child: Icon(Icons.bookmark, color: Colors.white),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onBookmarkPressed(BuildContext context) {
    BlocProvider.of<LocalArticleBloc>(context).add(SaveArticle(_article!));

    const snackBar = SnackBar(content: Text('Article saved success !'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
