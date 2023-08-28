import 'package:api_call/data/respository/PostReposetry.dart';
import 'package:api_call/models/Api_posts_Model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'api_data_state.dart';

class ApiDataCubit extends Cubit<ApiDataState> {
  ApiDataCubit() : super(ApiloadingState()) {
    fetchPost();
  }

  PostReposetry postReposetry = PostReposetry();
  void fetchPost() async {
    try {
      List<PostModel> Posts = await postReposetry.fetchPost();
      emit(ApiloadedState(Posts));
    } catch (err) {
      emit(ApiErrorState(err.toString()));
    }
  }
}
