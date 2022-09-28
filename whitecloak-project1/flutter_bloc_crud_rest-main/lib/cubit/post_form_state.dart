part of 'post_form_cubit.dart';
class PostFormState extends Equatable {

  const PostFormState({this.title = "", this.subTitle = "", this.date = "", this.post = "", required this.id});

  PostFormState copyWith({
    String? title,
    String? subTitle,
    String? date,
    String? post,
    int? id,
  }) {
    return PostFormState(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      date: date ?? this.date,
      post: post ?? this.post,
      id: id ?? this.id,
    );
  }

  final String title;
  final String subTitle;
  final String date;
  final String post;
  final int id;

  @override
  List<Object> get props => [title, subTitle, date, post, id];
}
