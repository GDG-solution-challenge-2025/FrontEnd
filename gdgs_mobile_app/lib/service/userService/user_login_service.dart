import 'package:gdgs_mobile_app/models/user_model.dart';
import 'package:gdgs_mobile_app/service/api_service.dart';

enum Language {
  korean,
  english,
}

class UserLoginService {
  UserLoginService();

  void UserSignup(UserDataModel user) async {
    try {
      final response = await ApiService.instanse.post(
        ApiService.signup,
        data: user.toJson(),
      );

      if (response.data["message"] == StateCode.successMsg) {
        print("회원가입 성공");
      }
    } catch (err) {
      print(err.toString());
    }
  }

  void UserIdCheck(String id) async {
    try {
      final response = await ApiService.instanse.get(
        ApiService.checkId,
        data: {"id", "\"$id\""},
      );

      if (bool.parse(response.data["duplicate"])) {
        print("아이디 중복 체크 ok");
      }
    } catch (err) {
      print(err.toString());
    }
  }
}
