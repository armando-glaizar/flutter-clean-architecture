import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_bloc/features/posts/presentation/pages/posts_page.dart';
import 'package:clean_architecture_bloc/usecase_config.dart';
import 'package:clean_architecture_bloc/features/posts/presentation/blocs/posts_bloc.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (BuildContext context) => PostsBloc(getPostsUsecase: usecaseConfig.getPostsUsecase!)
        ),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PostsPage(),
      ),
    );
  }
}
