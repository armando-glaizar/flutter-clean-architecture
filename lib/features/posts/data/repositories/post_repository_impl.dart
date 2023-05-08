import 'package:clean_architecture_bloc/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_bloc/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl({required this.postRemoteDataSource});

  @override
  Future<List<Post>> getPosts() async {
    //print('Repository');
    return await postRemoteDataSource.getPosts();
  }
}