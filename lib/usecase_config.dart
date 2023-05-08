import 'package:clean_architecture_bloc/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_bloc/features/posts/data/repositories/post_repository_impl.dart';
import 'package:clean_architecture_bloc/features/posts/domain/usecases/get_posts_usecase.dart';

class UsecaseConfig {
  GetPostsUsecase? getPostsUsecase;
  PostRepositoryImpl? postRepositoryImpl;
  PostRemoteDataSourceImp? postRemoteDataSourceImp;

  UsecaseConfig() {
    postRemoteDataSourceImp = PostRemoteDataSourceImp();
    postRepositoryImpl = PostRepositoryImpl(postRemoteDataSource: postRemoteDataSourceImp!);
    getPostsUsecase = GetPostsUsecase(postRepositoryImpl!);
  }
}