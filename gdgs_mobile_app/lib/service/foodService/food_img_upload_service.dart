import 'package:dio/dio.dart';
import 'package:gdgs_mobile_app/models/food/food_ai_detail.dart';
import 'package:gdgs_mobile_app/service/api_service.dart';
import 'package:gdgs_mobile_app/service/token_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class FoodImgUploadService {
  FoodImgUploadService();

  static Future<FoodAiDetail?> foodImgUpload(XFile imgFile) async {
    const funcName = "foodImgUpload";
    print("$funcName >> Start");

    final token = await TokenStorage().getToken();
    if (token == null) {
      return null;
    }

    print("$funcName >> token get $token");

    try {
      String fileName = imgFile.path.split('/').last;
      String fileExtension =
          fileName.split('.').last.toLowerCase(); // 파일 확장자 (예: jpg, png)
      MediaType? fileContentType;
      if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
        fileContentType = MediaType('image', fileExtension);
      }

      print("$funcName >> path => ${imgFile.path} // files => $fileName");
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imgFile.path,
          filename: fileName,
          contentType: fileContentType,
        ),
        'session': token,
      });
      print("$funcName >> form data done");
      final response = await ApiService.instanse.post(
        ApiService.foodAISearch,
        data: formData,
      );
      print("$funcName >> server request done");
      ApiService.printErrorMsage("foodImgUpload", response);

      if (response.statusCode == StateCode.success) {
        print("$funcName >> ${response.data["ingredients"]}");
        print("$funcName >> ${response.data["cantIngredients"]}");
        var inList = response.data["ingredients"] as List<dynamic>;
        var cantList = response.data["cantIngredients"] as List<dynamic>;
        final foodDetailData = FoodAiDetail.fromListMap(
          response.data,
          inList,
          cantList,
        );
        return foodDetailData;
      }
    } on DioException catch (err) {
      ApiService.printErrorMsage("foodImgUpload", err.response!);
      print(err.toString());
      return null;
    }
    return null;
  }

  static Future<List<String>?> menuImgUpload(XFile imgFile) async {
    const funcName = "menuImgUpload";

    print("$funcName >> Start");

    final token = await TokenStorage().getToken();
    if (token == null) {
      return null;
    }

    print("$funcName >> token get $token");

    try {
      String fileName = imgFile.path.split('/').last;
      String fileExtension =
          fileName.split('.').last.toLowerCase(); // 파일 확장자 (예: jpg, png)
      MediaType? fileContentType;
      if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
        fileContentType = MediaType('image', fileExtension);
      }

      print("$funcName >> path => ${imgFile.path} // files => $fileName");
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imgFile.path,
          filename: fileName,
          contentType: fileContentType,
        ),
        'session': token,
      });
      print("$funcName >> form data done");
      final response = await ApiService.instanse.post(
        ApiService.ocrAISearch,
        data: formData,
      );
      print("$funcName >> server request done");
      ApiService.printErrorMsage("foodImgUpload", response);

      if (response.statusCode == StateCode.success) {
        print("$funcName >> ${response.data["menu"]}");
        var menu = response.data["menu"] as List<dynamic>;
        return menu.map((item) => item.toString()).toList(growable: true);
      }
    } on DioException catch (err) {
      ApiService.printErrorMsage(funcName, err.response!);
      print(err.toString());
      return null;
    }
    return null;
  }

  static Future<FoodAiDetail?> menuTextUpload(String foodName) async {
    const funcName = "menuTextUpload";

    print("$funcName >> Start");

    final token = await TokenStorage().getToken();
    if (token == null) {
      return null;
    }

    print("$funcName >> token get $token");

    try {
      final response = await ApiService.instanse.post(
        ApiService.ocrAISearch,
        data: {
          'session': token,
          'food': foodName,
        },
      );
      print("$funcName >> server request done");
      ApiService.printErrorMsage(funcName, response);

      if (response.statusCode == StateCode.success) {
        print("$funcName >> ${response.data["ingredients"]}");
        print("$funcName >> ${response.data["cantIngredients"]}");
        var inList = response.data["ingredients"] as List<dynamic>;
        var cantList = response.data["cantIngredients"] as List<dynamic>;
        final foodDetailData = FoodAiDetail.fromListMap(
          response.data,
          inList,
          cantList,
        );
        return foodDetailData;
      }
    } on DioException catch (err) {
      ApiService.printErrorMsage(funcName, err.response!);
      print(err.toString());
      return null;
    }
    return null;
  }
}
