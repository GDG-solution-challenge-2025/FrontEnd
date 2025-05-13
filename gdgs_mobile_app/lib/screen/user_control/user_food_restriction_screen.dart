import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/models/food_restriction.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:gdgs_mobile_app/widget/components/food_restriction_chip_list.dart';
import 'package:gdgs_mobile_app/widget/components/food_restriction_title.dart';

class UserFoodRestrictionScreen extends StatefulWidget {
  const UserFoodRestrictionScreen({super.key});

  @override
  State<UserFoodRestrictionScreen> createState() =>
      _UserFoodRestrictionScreenState();
}

class _UserFoodRestrictionScreenState extends State<UserFoodRestrictionScreen> {
  final List<FoodRestriction> othersFood = [
    FoodRestriction(
      foodName: "Egg",
      selected: false,
    ),
    FoodRestriction(
      foodName: "Alcohol",
      selected: false,
    ),
    FoodRestriction(
      foodName: "Caffeine",
      selected: false,
    ),
    FoodRestriction(
      foodName: "Gelatin",
      selected: false,
    ),
    FoodRestriction(
      foodName: "Honey",
      selected: false,
    ),
  ];

  List<FoodRestriction> userSelect =
      List<FoodRestriction>.empty(growable: true);

  void isUserSelect(FoodRestriction foodRestrictionItem) {
    print(
        'selected user => ${foodRestrictionItem.foodName} // ${foodRestrictionItem.selected}');

    if (userSelect.contains(foodRestrictionItem)) {
      if (!foodRestrictionItem.selected) {
        setState(() {
          userSelect.remove(foodRestrictionItem);
        });
      }
    } else {
      if (foodRestrictionItem.selected) {
        setState(() {
          userSelect.add(foodRestrictionItem);
        });
      }
    }
    print(userSelect.length);
  }

  String? _enteredText; // 사용자가 입력한 텍스트를 저장할 변수

  // 텍스트 입력 다이얼로그를 표시하는 함수
  Future<String?> _showTextInputDialog(BuildContext context) async {
    // TextField의 내용을 제어하기 위한 컨트롤러
    final TextEditingController textFieldController = TextEditingController();
    String? result;

    // showDialog는 Future를 반환하며, 다이얼로그가 닫힐 때 값을 전달받을 수 있습니다.
    result = await showDialog<String?>(
      context: context,
      // barrierDismissible: false, // 다이얼로그 바깥을 탭해도 닫히지 않게 하려면 true로 설정
      builder: (BuildContext dialogContext) {
        // 다이얼로그 내부의 context
        return AlertDialog(
          title: const Text('텍스트 입력'),
          content: TextField(
            controller: textFieldController, // 컨트롤러 연결
            decoration: const InputDecoration(hintText: "여기에 내용을 입력하세요."),
            autofocus: true, // 다이얼로그가 열리면 자동으로 포커스
            onSubmitted: (value) {
              // 엔터 키를 눌렀을 때 처리 (선택 사항)
              Navigator.of(dialogContext).pop(value);
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(dialogContext)
                    .pop(); // 다이얼로그를 닫고 아무 값도 반환하지 않음 (null 반환)
              },
            ),
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                // TextField의 현재 텍스트를 가지고 다이얼로그를 닫음
                Navigator.of(dialogContext).pop(textFieldController.text);
              },
            ),
          ],
        );
      },
    );

    // 다이얼로그가 닫힌 후 컨트롤러를 반드시 dispose 해주어야 메모리 누수를 방지할 수 있습니다.
    textFieldController.dispose();

    return result; // 사용자가 입력한 텍스트 또는 null 반환
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: defaultLayoutContentMargin,
            right: defaultHorizontalMargin,
            left: defaultHorizontalMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                text: "Food Restrictions",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              TitleText(
                text: "Please choose any ingredients you can't eat.",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: titleTextColor,
                    ),
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Meat",
                foodIcon: foodIconPigPath,
              ),
              FoodRestrictionChipList(
                foodList: meatFood,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Seafood",
                foodIcon: foodIconFishPath,
              ),
              TitleText(
                text: "Fish",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: titleTextColor,
                    ),
              ),
              FoodRestrictionChipList(
                foodList: seaFoodFish,
                isUserSelect: isUserSelect,
              ),
              TitleText(
                text: "Shellfish",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: titleTextColor,
                    ),
              ),
              FoodRestrictionChipList(
                foodList: seaFoodShellfish,
                isUserSelect: isUserSelect,
              ),
              TitleText(
                text: "Mollusks",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: titleTextColor,
                    ),
              ),
              FoodRestrictionChipList(
                foodList: seaFoodMollusks,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Dairy",
                foodIcon: foodIconDairyPath,
              ),
              FoodRestrictionChipList(
                foodList: dairyFood,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Grains & Legumes",
                foodIcon: foodIconSoybeanPath,
              ),
              FoodRestrictionChipList(
                foodList: grainsAndLegumesFood,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Nuts",
                foodIcon: foodIconAlmondPath,
              ),
              FoodRestrictionChipList(
                foodList: nutsFood,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Others",
                foodIcon: imageNullMsg,
              ),
              FoodRestrictionChipList(
                foodList: othersFood,
                isUserSelect: isUserSelect,
                onLongPress: (item) async {
                  final changFoodName = await _showTextInputDialog(context);
                  if (changFoodName != null && changFoodName.isNotEmpty) {
                    final itemIndex = othersFood.indexOf(item);
                    if (itemIndex != -1) {
                      setState(() {
                        othersFood[itemIndex].foodName = changFoodName;
                      });
                    }
                  }
                },
              ),
              ChoiceChip(
                label: Text(
                  "ingredient",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: chipTextColor,
                      ),
                ),
                selected: false,
                selectedColor: chipSelectColor,
                backgroundColor: chipUnSelectColor,
                showCheckmark: false,
                avatar: const Icon(
                  Icons.add,
                  size: 16.0,
                  color: chipTextColor,
                ),
                onSelected: (selected) async {
                  final value = await _showTextInputDialog(context);
                  if (value != null && value.isNotEmpty) {
                    setState(() {
                      othersFood.add(
                        FoodRestriction(
                          foodName: value,
                          selected: true,
                        ),
                      );
                    });
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Save",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
