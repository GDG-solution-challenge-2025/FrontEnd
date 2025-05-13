import 'package:gdgs_mobile_app/models/food_ai_detail.dart';
import 'package:gdgs_mobile_app/service/api_service.dart';
import 'package:gdgs_mobile_app/service/token_storage.dart';

class FoodImgUploadService {
  FoodImgUploadService();

  static Future<FoodAiDetail?> foodImgUpload(String imgFilePath) async {
    final token = await TokenStorage().getToken();
    if (token == null) {
      return null;
    }

    try {
      final response = await ApiService.instanse.post(
        ApiService.foodAISearch,
        data: {
          "file": "\"$imgFilePath\"",
          "session": "\"$token\"",
        },
      );
      final foodDetailData = FoodAiDetail.fromMap(response.data);
      return foodDetailData;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
