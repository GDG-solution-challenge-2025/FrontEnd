import 'package:dio/dio.dart';

const baseServerUri = "http://39.118.135.87/API";

class ApiService {
  static const login = "/login";
  static const sessionLogin = "/sessionLogin";
  static const checkId = "/checkId";
  static const signup = "/signup";
  static const nameChange = "/name";
  static const passwordChange = "/password";
  static const langChange = "/lang";
  static const othersIngredients = "/othersIngredients";
  static const ingredients = "/ingredients";
  static const foodAISearch = "/foodAI";
  static const ocrAISearch = "/ocrAI";
  static const textAISearch = "/textAI";
  static const googleTranslate = "/googleTranslate";
  static const searchList = "/searchList";
  static const searchDetail = "/searchDetail";
  static const foodLike = "/foodLike";
  static const likeRanking = "/likeRanking";
  static const searchRanking = "/searchRanking";

  ApiService._();

  static final ApiService _instance = ApiService._();

  static Dio get instanse => _dio;

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseServerUri,
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
}

class StateCode {
  static const success = 200;
  static const fail = 400;
  static const failNumber1 = 1;
  static const failNumber2 = 2;
  static const failNumber3 = 3;
  static const failNumber4 = 4;
  static const failNumber5 = 5;
  static const serverError = 500;
  static const successMsg = "성공";

  int? code;
  String message;
  StateCode({
    required this.message,
    this.code,
  });
}
