import 'package:gdgs_mobile_app/screen/detail_screens/food_upload_screen.dart';
import 'package:gdgs_mobile_app/screen/detail_screens/food_view_detail_screen.dart';
import 'package:gdgs_mobile_app/screen/detail_screens/global_cuisine_screen.dart';
import 'package:gdgs_mobile_app/screen/navigators/food_history_screen.dart';
import 'package:gdgs_mobile_app/screen/navigators/food_recomend_screen.dart';
import 'package:gdgs_mobile_app/screen/navigators/home_screen.dart';
import 'package:gdgs_mobile_app/screen/navigators/user_setting_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const String home = 'home';
  static const String foodUpload = 'food-upload';
  static const String foodViewDetail = 'food-view-detail';
  static const String globalCuisine = 'global-cuisine';
  static const String foodHistory = 'food-history';
  static const String settings = 'settings';
  static const String foodRecomend = 'food-recomend';
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
  ],
);

//util screens
final foodUploadRoutes = GoRoute(
  path: '/${AppRoute.foodUpload}',
  name: AppRoute.foodUpload,
  builder: (context, state) => const FoodUploadScreen(),
  routes: [
    foodViewDetailRoutes,
  ],
);

final foodViewDetailRoutes = GoRoute(
  path: '/${AppRoute.foodViewDetail}',
  name: AppRoute.foodViewDetail,
  builder: (context, state) => const FoodViewDetailScreen(),
);

final globalCuisineRoutes = GoRoute(
  path: '/${AppRoute.globalCuisine}',
  name: AppRoute.globalCuisine,
  builder: (context, state) => const GlobalCuisineScreen(),
);
