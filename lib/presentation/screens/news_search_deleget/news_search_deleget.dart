import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/ArticlesResponse.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/articles_list_widget/article_item_widget.dart';

class NewsSearchDeleget extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
      ),
      inputDecorationTheme: const InputDecorationTheme(
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
        Icons.arrow_back_ios_new_outlined,
        color: Colors.white,
      ),
    );
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

          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }

          var articalsResponse = snapshot.data as ArticlesResponse;
          if (articalsResponse.articles == null ||
              articalsResponse.articles!.isEmpty) {
            return const Center(
              child: Text('No result found'),
            );
          }

          return ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItemWidget(article: articalsResponse.articles![index]),
            itemCount: articalsResponse.articles?.length ?? 0,
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
            return Center(
              child: Text('${snapshot.error}'),
            );
          }

          var articalsResponse = snapshot.data as ArticlesResponse;
          if (articalsResponse.articles == null ||
              articalsResponse.articles!.isEmpty) {
            return const Center(
              child: Text('No result found'),
            );
          }

          return ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItemWidget(article: articalsResponse.articles![index]),
            itemCount: articalsResponse.articles?.length ?? 0,
          );
        });
  }
}
