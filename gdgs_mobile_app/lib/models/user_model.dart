// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gdgs_mobile_app/service/userService/user_login_service.dart';

class UserModel {
  String id;
  String name;
  String? pw;
  String? session;
  Language lang;
  UserModel({
    required this.id,
    required this.name,
    this.pw,
    this.session,
    required this.lang,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? pw,
    String? session,
    Language? lang,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      pw: pw ?? this.pw,
      session: pw ?? this.session,
      lang: lang ?? this.lang,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pw': pw,
      'session': session,
      'lang': lang.index,
    };
  }

  Map<String, dynamic> toSignupMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pw': pw,
      'lang': lang.index,
    };
  }

  factory UserModel.SignupfromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      pw: map['pw'] as String,
      lang: Language.values[map['lang'] as int],
    );
  }

  factory UserModel.ServerfromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      session: map['session'] as String,
      lang: Language.values[map['lang'] as int],
    );
  }

  String toSignupJson() => json.encode(toSignupMap());
  String toJson() => json.encode(toMap());

  factory UserModel.SignupfromJson(String source) =>
      UserModel.SignupfromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDataModel(id: $id, name: $name,  pw: $pw, lang: $lang)';
  }

  @override
  bool operator ==(covariant UserModel other) {
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
