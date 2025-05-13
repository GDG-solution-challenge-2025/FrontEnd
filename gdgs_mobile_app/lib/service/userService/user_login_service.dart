import 'package:gdgs_mobile_app/models/user_model.dart';
import 'package:gdgs_mobile_app/service/api_service.dart';

enum Language {
  korean,
  english,
}

class UserLoginService {
  UserLoginService();

  static Future<bool?> userSignup(UserModel user) async {
    try {
      final response = await ApiService.instanse.post(
        ApiService.signup,
        data: user.toSignupJson(),
      );

      if (response.statusCode == StateCode.success) {
        print("회원가입 >> 회원가입 성공");
        return true;
      } else if (response.statusCode == StateCode.fail) {
        print("회원가입 >> ${response.data["message"]}");
        return false;
      }
    } catch (err) {
      print("회원가입 >> $err");
      return false;
    }
    return false;
  }

  static Future<bool?> userIdCheck(String id) async {
    try {
      print("아이디 체크 >> 실행");
      final response = await ApiService.instanse.get(
        ApiService.checkId,
        data: {
          "id": id,
        },
      );

      print("아이디 체크 >> 끝");
      print("아이디 체크 >> ${!bool.parse(response.data["duplicate"].toString())}");
      print("아이디 체크 >> ${response.statusCode}");
      return !bool.parse(response.data["duplicate"].toString());
    } catch (err) {
      print("아이디 체크 >> $err");
      return false;
    }
  }

  static Future<UserModel?> userLogin(String id, String pw) async {
    try {
      print("로그인 >> 시작");
      final response = await ApiService.instanse.post(
        ApiService.login,
        data: {
          "id": id,
          "pw": pw,
        },
      );

      if (response.statusCode == StateCode.success) {
        return UserModel.ServerfromMap(response.data);
      }
    } catch (err) {
      print(err);
    }
    return null;
  }

  static Future<UserModel?> userSessionLogin(String token) async {
    try {
      final response = await ApiService.instanse.post(
        ApiService.sessionLogin,
        data: {
          "session": "\"$token\"",
        },
      );

      if (response.statusCode == StateCode.success) {
        return UserModel.ServerfromMap(response.data);
      } else {
        print(response.data["message"].toString());
      }
    } catch (err) {
      print(err);
    }
    return null;
  }
}
