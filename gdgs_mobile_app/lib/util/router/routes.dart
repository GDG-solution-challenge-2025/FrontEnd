import 'package:gdgs_mobile_app/screen/detail_screens/food_upload_screen.dart';
import 'package:gdgs_mobile_app/screen/detail_screens/food_view_detail_screen.dart';
import 'package:gdgs_mobile_app/screen/detail_screens/global_cuisine_screen.dart';
import 'package:gdgs_mobile_app/screen/navigators/food_history_screen.dart';
import 'package:gdgs_mobile_app/screen/navigators/food_recomend_screen.dart';
import 'package:gdgs_mobile_app/screen/navigators/home_screen.dart';
import 'package:gdgs_mobile_app/screen/navigators/user_setting_screen.dart';
import 'package:gdgs_mobile_app/screen/user_control/login_screen.dart';
import 'package:gdgs_mobile_app/screen/user_control/signup_screen.dart';
import 'package:gdgs_mobile_app/screen/user_control/splash_screen.dart';
import 'package:gdgs_mobile_app/screen/user_control/user_food_restriction_screen.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const String home = 'home';
  static const String foodUpload = 'food-upload';
  static const String foodViewDetail = 'food-view-detail';
  static const String foodViewDetailGoHome = 'food-view-detail-go-home';
  static const String globalCuisine = 'global-cuisine';
  static const String foodHistory = 'food-history';
  static const String settings = 'settings';
  static const String foodRecomend = 'food-recomend';
  static const String login = 'login';
  static const String signup = 'signup';
  static const String splash = 'splash';
  static const String foodRestrictionSelect = 'food-restriction-select';
}

//main navigator screens
final foodRecomendRoutes = GoRoute(
  path: '/${AppRoute.foodRecomend}',
  name: AppRoute.foodRecomend,
  builder: (context, state) => const FoodRecomendScreen(),
);

final settingsRoutes = GoRoute(
  path: '/${AppRoute.settings}',
  name: AppRoute.settings,
  builder: (context, state) => const UserSettingScreen(),
);

final foodHistoryRoutes = GoRoute(
  path: '/${AppRoute.foodHistory}',
  name: AppRoute.foodHistory,
  builder: (context, state) => const FoodHistoryScreen(),
);

final homeRoutes = GoRoute(
  path: '/${AppRoute.home}',
  name: AppRoute.home,
  builder: (context, state) => const HomeScreen(),
  routes: [
    globalCuisineRoutes,
    foodUploadRoutes,
    foodViewDetailRoutes(AppRoute.foodViewDetailGoHome),
  ],
);

//util screens
final foodUploadRoutes = GoRoute(
    path: '/${AppRoute.foodUpload}',
    name: AppRoute.foodUpload,
    builder: (context, state) => const FoodUploadScreen(),
    routes: [
      foodViewDetailRoutes(AppRoute.foodViewDetail),
    ]);

GoRoute foodViewDetailRoutes(String name) => GoRoute(
      path: '/${AppRoute.foodViewDetail}/:foodName/:imgData',
      name: name,
      builder: (context, state) => FoodViewDetailScreen(
        foodName: state.pathParameters['foodName'] ?? foodNamdNullMsg,
        imgData: state.pathParameters['imgData'] ?? imageNullMsg,
      ),
    );

final globalCuisineRoutes = GoRoute(
  path: '/${AppRoute.globalCuisine}',
  name: AppRoute.globalCuisine,
  builder: (context, state) => GlobalCuisineScreen(),
);

final loginRoutes = GoRoute(
  path: '/${AppRoute.login}',
  name: AppRoute.login,
  builder: (context, state) => const LoginScreen(),
  routes: [
    signupRoutes,
  ],
);

final signupRoutes = GoRoute(
  path: '/${AppRoute.signup}',
  name: AppRoute.signup,
  builder: (context, state) => const SignupScreen(),
  routes: [
    foodRestrictionSelectRoutes,
  ],
);

final splashRoutes = GoRoute(
  path: '/${AppRoute.splash}',
  name: AppRoute.splash,
  builder: (context, state) => const SplashScreen(),
);

final foodRestrictionSelectRoutes = GoRoute(
  path: '/${AppRoute.foodRestrictionSelect}',
  name: AppRoute.foodRestrictionSelect,
  builder: (context, state) => const UserFoodRestrictionScreen(),
);
