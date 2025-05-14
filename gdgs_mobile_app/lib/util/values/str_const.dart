import 'package:gdgs_mobile_app/models/food/food_restriction.dart';

///Main string constants for the app
const String mainHomeTitle = 'Search for food culture';
const String mainHomeSubTitle = 'Upload a food photo to search';

///font Pretendard family
const String fontPretendard = 'Pretendard';

const foodImageSamplePath = 'assets/image/food/food_sample_img.jpg';

const foodIconPigPath = 'assets/image/icon/pig_icon.png';
const foodIconFishPath = 'assets/image/icon/fish_icon.png';
const foodIconAlmondPath = 'assets/image/icon/almond_icon.png';
const foodIconDairyPath = 'assets/image/icon/dairy_icon.png';
const foodIconSoybeanPath = 'assets/image/icon/soybean_icon.png';

const logoImagePath = 'assets/image/icon/logo.png';

const imageNullMsg = 'image Null';

const foodNamdNullMsg = 'Name not found';

final List<FoodRestriction> meatFood = [
  FoodRestriction(
    foodName: "Pork",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Beef",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Horse meat",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Chicken",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Duck",
    selected: false,
  ),
];

final List<FoodRestriction> seaFoodFish = [
  FoodRestriction(
    foodName: "Salmon",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Tuna",
    selected: false,
  ),
];

final List<FoodRestriction> seaFoodShellfish = [
  FoodRestriction(
    foodName: "Shrimp",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Crab",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Lobster",
    selected: false,
  ),
];

final List<FoodRestriction> seaFoodMollusks = [
  FoodRestriction(
    foodName: "Clam",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Oyster",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Mussel",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Scallop",
    selected: false,
  ),
];

final List<FoodRestriction> dairyFood = [
  FoodRestriction(
    foodName: "Milk",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Cheese",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Butter",
    selected: false,
  ),
];

final List<FoodRestriction> grainsAndLegumesFood = [
  FoodRestriction(
    foodName: "Wheat",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Barley",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Rice",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Corn",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Soybean",
    selected: false,
  ),
];

final List<FoodRestriction> nutsFood = [
  FoodRestriction(
    foodName: "Peanut",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Almond",
    selected: false,
  ),
  FoodRestriction(
    foodName: "Cashew nut",
    selected: false,
  ),
];
