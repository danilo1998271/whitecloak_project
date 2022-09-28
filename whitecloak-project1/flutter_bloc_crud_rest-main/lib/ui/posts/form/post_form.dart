import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_crud/bloc/posts/lists/posts_bloc.dart';
import 'package:post_crud/cubit/post_form_cubit.dart';
import 'package:post_crud/models/post_model.dart';

class PostForm extends StatefulWidget {
  const PostForm({
    Key? key,
    this.post,
    this.isEditing = false,
  }) : super(key: key);
  final Post? post;
  final bool isEditing;

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  late TextEditingController _titleController;
  late TextEditingController _subTitleController;
  late TextEditingController _postController;
  final PostFormCubit _formCubit = PostFormCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isEditing && widget.post != null) {
      _formCubit.updateId(widget.post!.id);
      _formCubit.updateTitle(widget.post!.title);
      _formCubit.updatesubTitle(widget.post!.subTitle);
      _formCubit.updatePost(widget.post!.post);
    }

    _titleController = TextEditingController(text: widget.post?.title)
      ..addListener(() {
        _formCubit.updateTitle(_titleController.text);
      });
    _subTitleController = TextEditingController(text: widget.post?.subTitle)
      ..addListener(() {
        _formCubit.updatesubTitle(_subTitleController.text);
      });
     _postController = TextEditingController(text: widget.post?.post)
      ..addListener(() {
        _formCubit.updatePost(_postController.text);
      }); 
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle _style = CupertinoTheme.of(context).textTheme.textStyle;

    return BlocProvider<PostFormCubit>(
      create: (context) => _formCubit,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            Text(
              "Add Post",
              style: _style.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            CupertinoTextField(
              padding: const EdgeInsets.all(18),
              placeholder: "Title",
              controller: _titleController,
            ),
            const SizedBox(
              height: 12,
            ),
            CupertinoTextField(
              padding: const EdgeInsets.all(18),
              placeholder: "Subtitle",
              controller: _subTitleController,
            ),
            const SizedBox(
              height: 12,
            ),
            CupertinoTextField(
              padding: const EdgeInsets.all(18),
              placeholder: "Post",
              controller: _postController,
            ),
            const SizedBox(
              height: 12,
            ),
            CupertinoButton(
              onPressed: _onSaved,
              child: const Text(
                "Save",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSaved() {
    if (widget.isEditing) {
      BlocProvider.of<PostsBloc>(context).add(PostsUpdate(
        _formCubit.state,
      ));
    } else {
      BlocProvider.of<PostsBloc>(context).add(PostsAdd(
        _formCubit.state,
      ));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _subTitleController.dispose();
    _postController.dispose();
  }
}
