part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class Loading extends PostsState {}

class Loaded extends PostsState {
  final List<Post> posts;

  Loaded({required this.posts});
}

class Error extends PostsState {
  final String error;

  Error({required this.error});
}
