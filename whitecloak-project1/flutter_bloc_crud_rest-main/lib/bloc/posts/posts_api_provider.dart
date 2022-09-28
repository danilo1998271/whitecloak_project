import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:post_crud/cubit/post_form_cubit.dart';
import 'package:post_crud/models/post_model.dart';

List<Post> posts = [];

class PostApiProvider {
  Future<List<Post>> fetchPosts() async {
    if (posts.isEmpty) {
      Post post1 = Post(id: 1, title: "post1", subTitle: "post1", post: "post1", date: "05-27-2022");
      Post post2 = Post(id: 2, title: "post2", subTitle: "post2", post: "post2", date: "05-27-2022");
      Post post3 = Post(id: 3, title: "post3", subTitle: "post3", post: "post3", date: "05-27-2022");
      Post post4 = Post(id: 4, title: "post4", subTitle: "post4", post: "post4", date: "05-27-2022");
      posts.add(post1);
      posts.add(post2);
      posts.add(post3);
      posts.add(post4);
      return posts;
    } else {
      return posts;
    }
  }

  Future<Post> fetchPost(int id) async {
    for (var i = 0; i < posts.length; i++) {
      if (posts[i].id == id) {
        return posts[i];
      }
    }
    Post post1 = Post(id: 1, title: "post1", subTitle: "post1", post: "post1", date: "05-27-2022");
    return post1;
  }

  Future<Post> addPost(PostFormState post) async {
    final Post newPost = Post(id: post.id, title: post.title, subTitle: post.subTitle, post: post.post, date: post.date);
    return newPost;
  }

  // Future<Post> editPost(PostFormState post) async {
    // for (var i = 0; i < posts.length; i++) {
    //   if (posts[i].id == id) {
    //       Post post1 = Post(id: 1, title: "post1", subTitle: "post1", post: "post1", date: "05-27-2022");
    //     return posts[i];
    //   }
    // }
    // Post post1 = Post(id: 1, title: "post1", subTitle: "post1", post: "post1", date: "05-27-2022");
    // return post1;
  // }
}
