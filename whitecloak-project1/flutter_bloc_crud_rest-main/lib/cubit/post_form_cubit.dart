import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_form_state.dart';

class PostFormCubit extends Cubit<PostFormState> {
  PostFormCubit() : super(const PostFormState(id: 0));

  void updateId(int id) => emit(state.copyWith(id: id));
  void updateTitle(String title) => emit(state.copyWith(title: title));
  void updatesubTitle(String subTitle) => emit(state.copyWith(subTitle: subTitle));
  void updatePost(String post) => emit(state.copyWith(post: post));
}
