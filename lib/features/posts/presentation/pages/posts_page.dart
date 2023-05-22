import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:clean_architecture_bloc/features/posts/presentation/blocs/posts_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.wifi) {
        context.read<PostsBloc>().add(GetPosts());
        ScaffoldMessenger.of(context).clearSnackBars();
      } else {
        const snackBar = SnackBar(
          content: Text('Se perdió la conectividad Wi-Fi', style: TextStyle(),),
          duration: Duration(days: 365),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),

      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if(state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is Loaded) {
            return SingleChildScrollView(
              child: Column(
                children: state.posts.map((post) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    color: Colors.black12,

                    child: ListTile(
                      leading: Text(post.id.toString()),
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    ),
                  );
                }).toList()
              ),
            );
          } else if(state is Error) {
            return Center(
              child: Text(state.error, style: const TextStyle(color: Colors.red)),
            );
          } else {
            return Container();
          }
        }
      ),
    );
  }
}
