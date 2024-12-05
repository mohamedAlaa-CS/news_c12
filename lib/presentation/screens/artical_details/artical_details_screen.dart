import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sat/config/theme/app_styles.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticalDetailsScreen extends StatelessWidget {
  const ArticalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Article;

    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        title: Text(
          'Artical Details',
          style: AppStyles.appBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: article.urlToImage ?? '',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              article.source?.name ?? '',
              style: AppStyles.sourceName,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(article.title ?? '', style: AppStyles.articleTitle),
            SizedBox(
              height: 4.h,
            ),
            Text(article.publishedAt ?? '',
                textAlign: TextAlign.end, style: AppStyles.publishedAt),
            const SizedBox(height: 20),
            Text(article.content ?? '', style: AppStyles.articleTitle),
            const Spacer(),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: TextButton.icon(
            //     iconAlignment: IconAlignment.end,
            //     onPressed: () {},
            //     label: const Text('view full Article'),
            //     icon: const Icon(Icons.arrow_forward_ios_outlined),
            //   ),
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    await _launchUrl(article.url ?? '');
                  },
                  child: const Text('view full Article'),
                ),
                const Icon(Icons.arrow_forward_ios_outlined),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri url0 = Uri.parse(url);
    try {
      await launchUrl(url0);
    } catch (e) {
      //todo: handel error url not found
    }
  }
}
