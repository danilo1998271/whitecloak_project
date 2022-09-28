import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:post_crud/bloc/comments/lists/comments_bloc.dart';
import 'package:post_crud/models/post_model.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  // final CommentsBloc _commentsBloc = CommentsBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CupertinoTextThemeData _theme = CupertinoTheme.of(context).textTheme;

    return CupertinoPageScaffold(
      child: Container(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              Center(
                child: Text(
                  "Post detail",
                  style: _theme.textStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text("Post Title: ${widget.post.title}"),
              Text("Post Subtitle: ${widget.post.subTitle}"),
              Text("Post: ${widget.post.post}"),
            ],
          ),
        ),
      ),
    );
  }
}
