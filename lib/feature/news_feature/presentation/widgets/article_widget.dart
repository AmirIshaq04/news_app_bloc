import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/feature/news_feature/domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;
  const ArticleWidget({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsetsDirectional.only(bottom: 14, top: 14, start: 14, end: 14),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [
          _buildImage(context),
          _buildTileAndDescription(),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article!.urlToImage??'',
      imageBuilder: (context, imageProvider) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              child: CupertinoActivityIndicator(),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
              ),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              child: const Icon(Icons.error),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTileAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              article!.title ?? 'Loading...',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                article!.description ?? '',
                maxLines: 2,
              ),
            )),
            Row(
              children: [
                Icon(
                  Icons.timeline_outlined,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  article!.publishedAt ?? '',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
