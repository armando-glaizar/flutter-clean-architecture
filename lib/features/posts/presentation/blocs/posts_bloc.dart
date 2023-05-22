import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:clean_architecture_bloc/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_bloc/features/posts/domain/usecases/get_posts_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUsecase getPostsUsecase;

  PostsBloc({required this.getPostsUsecase}) : super(Loaded(posts: [])) {
    on<PostsEvent>((event, emit) async {
      if(event is GetPosts) {
        try {
          emit(Loading());
          List<Post> response = await getPostsUsecase.execute();
          emit(Loaded(posts: response));
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}
