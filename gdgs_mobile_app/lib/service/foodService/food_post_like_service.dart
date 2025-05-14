import 'package:dio/dio.dart';
import 'package:gdgs_mobile_app/models/food/food_like_post.dart';
import 'package:gdgs_mobile_app/service/api_service.dart';
import 'package:gdgs_mobile_app/service/token_storage.dart';

class FoodPostLikeService {
  static Future<bool> foodLikeSet(int sidx, FoodPostLiked like) async {
    final token = await TokenStorage().getToken();
    if (token != null) {
      try {
        final response =
            await ApiService.instanse.patch(ApiService.foodLike, data: {
          "session": "\"$token\"",
          "sidx": sidx,
          "like": like.index,
        });

        if (response.data["message"].toString() == StateCode.successMsg) {
          return true;
        } else {
          print(response.data["code"].toString());
        }
      } on DioException catch (err) {
        ApiService.printErrorMsage("foodImgUpload", err.response!);
        print(err.toString());
      }
    }
    return false;
  }

  static Future<FoodPostLiked> foodLikeGet(int sidx) async {
    final token = await TokenStorage().getToken();
    if (token != null) {
      try {
        final response =
            await ApiService.instanse.get(ApiService.foodLike, data: {
          "session": "\"$token\"",
          "sidx": sidx,
        });

        if (response.data["like"].toString() == "1") {
          return FoodPostLiked.enable;
        } else {
          print(response.data["code"].toString());
        }
      } on DioException catch (err) {
        ApiService.printErrorMsage("foodImgUpload", err.response!);
        print(err.toString());
      }
    }
    return FoodPostLiked.unable;
  }
}
