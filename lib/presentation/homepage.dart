import 'package:api_call/cubit/api_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiDataCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Api Calls"),
          centerTitle: true,
        ),
        body:
            BlocConsumer<ApiDataCubit, ApiDataState>(builder: (context, state) {
          return ListView.builder(itemBuilder: (context, index) {
            if (state is ApiloadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ApiloadedState) {
              final posts = state.posts[index];
              return ListTile(
                title: Text(posts.title.toString()),
                subtitle: Text(posts.body.toString()),
              );
            }

            return Center(
              child: Text("An error has occured"),
            );
          });
        }, listener: (context, state) {
          if (state is ApiErrorState) {
            ScaffoldMessenger(
                child: SnackBar(
              content: Text("error has occured"),
              backgroundColor: Colors.red,
            ));
          }
        }),
      ),
    );
  }
}
