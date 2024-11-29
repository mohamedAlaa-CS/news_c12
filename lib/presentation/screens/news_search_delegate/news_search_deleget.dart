import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/ArticlesResponse.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/articles_list_widget/article_item_widget.dart';

class NewsSearchDeleget extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search for articles';
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.searchArtical(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data?.articles == null) {
            return const Center(child: Text('some thing wrong'));
          }

          var articlesResponse = snapshot.data as ArticlesResponse;
          return ListView.builder(
            itemBuilder: (context, index) => ArticleItemWidget(
                article: articlesResponse.articles?[index] ?? [] as Article),
            itemCount: articlesResponse.articles?.length ?? 0,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.searchArtical(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('some thing wrong'));
          }

          var articlesResponse = snapshot.data as ArticlesResponse;
          if (articlesResponse.articles == null ||
              articlesResponse.articles!.isEmpty) {
            return const Center(
              child: Text(
                'No articles found. Try another search.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => ArticleItemWidget(
                article: articlesResponse.articles?[index] ?? [] as Article),
            itemCount: articlesResponse.articles?.length ?? 0,
          );
        });
  }
}
