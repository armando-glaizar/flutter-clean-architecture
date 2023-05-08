import 'package:clean_architecture_bloc/features/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}