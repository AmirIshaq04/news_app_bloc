import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/config/themes/app_theme.dart';
import 'package:news/feature/news_feature/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news/feature/news_feature/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news/feature/news_feature/presentation/pages/daily_news.dart';
import 'package:news/injection_container.dart';

//fbdc5924e9624af4846b0d1101df8a92
//https://newsapi.org/docs/endpoints
void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
