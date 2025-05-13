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
        data: user.toJson(),
      );

      if (response.data["message"] == StateCode.successMsg) {
        print("회원가입 성공");
        return true;
      }
    } catch (err) {
      print(err.toString());
      return false;
    }
    return false;
  }

  static Future<bool?> userIdCheck(String id) async {
    try {
      final response = await ApiService.instanse.get(
        ApiService.checkId,
        data: {
          "id",
          "\"$id\"",
        },
      );

      if (bool.parse(response.data["duplicate"])) {
        print("아이디 중복 체크 ok");
        return true;
      }
    } catch (err) {
      print(err.toString());
      return false;
    }
    return false;
  }

  static Future<UserModel?> userLogin(String id, String pw) async {
    try {
      final response = await ApiService.instanse.post(
        ApiService.login,
        data: {
          "id": "\"$id\"",
          "pw": "\"$pw\"",
        },
      );

      if (response.data["id"].toString() == id) {
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
