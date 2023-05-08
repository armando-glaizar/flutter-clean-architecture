import 'package:clean_architecture_bloc/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_bloc/features/posts/domain/repositories/post_repository.dart';

class GetPostsUsecase {
  final PostRepository postRepository;

  GetPostsUsecase(this.postRepository);

  Future<List<Post>> execute() async {
    return await postRepository.getPosts();
  }
}