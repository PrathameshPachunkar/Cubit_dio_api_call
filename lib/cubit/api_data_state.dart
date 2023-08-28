part of 'api_data_cubit.dart';

abstract class ApiDataState {}

final class ApiloadingState extends ApiDataState {}

class ApiloadedState extends ApiDataState {
  List<PostModel> posts;
  ApiloadedState(this.posts);
}

class ApiErrorState extends ApiDataState {
  final String error;
  ApiErrorState(this.error);
}
