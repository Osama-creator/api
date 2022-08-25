// import 'dart:convert';
// List<User> machineFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// String machineToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class User {
  late final String name;
  late final String birthday;
  late final String image;

  User({required this.birthday,required this.image,required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      birthday: json['birthday'],
      image: json['img'],

    );
  }

}