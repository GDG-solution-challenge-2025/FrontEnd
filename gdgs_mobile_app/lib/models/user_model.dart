// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gdgs_mobile_app/service/userService/user_login_service.dart';

class UserDataModel {
  String id;
  String name;
  String pw;
  Language lang;
  UserDataModel({
    required this.id,
    required this.name,
    required this.pw,
    required this.lang,
  });

  UserDataModel copyWith({
    String? id,
    String? name,
    String? pw,
    Language? lang,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      pw: pw ?? this.pw,
      lang: lang ?? this.lang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pw': pw,
      'lang': lang.index,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'] as String,
      name: map['name'] as String,
      pw: map['pw'] as String,
      lang: Language.values[map['lang'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDataModel(id: $id, name: $name,  pw: $pw, lang: $lang)';
  }

  @override
  bool operator ==(covariant UserDataModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.pw == pw &&
        other.lang == lang;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ pw.hashCode ^ lang.hashCode;
  }
}
