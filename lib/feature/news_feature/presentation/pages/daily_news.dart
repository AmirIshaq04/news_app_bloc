import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/feature/news_feature/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news/feature/news_feature/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news/feature/news_feature/presentation/widgets/article_widget.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Column(
        children: [
          _buildBody(),
        ],
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteArticlesError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is RemoteArticlesDone) {
          print(state.articles); // Debug: Print the list of articles

          return Expanded(
            child: ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, index) {
                print(state.articles![index]
                    .urlToImage); // Debug: Print each image URL
                print(state.articles![index]
                    .description); // Debug: Print each description
                return ArticleWidget(
                  article: state.articles![index],
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
