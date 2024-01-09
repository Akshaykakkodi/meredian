

import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel {
    List<Comment> comments;

    ApiModel({
        required this.comments,
    });

    factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
}

class Comment {
    int id;
    String body;
    int postId;
    User user;

    Comment({
        required this.id,
        required this.body,
        required this.postId,
        required this.user,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        body: json["body"],
        postId: json["postId"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "postId": postId,
        "user": user.toJson(),
    };
}

class User {
    int id;
    String username;

    User({
        required this.id,
        required this.username,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
    };
}
