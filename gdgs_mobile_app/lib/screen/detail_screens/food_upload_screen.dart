import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/widget/Buttons/food_switch_ocr_btn.dart';
import 'package:gdgs_mobile_app/widget/Texts/input_text_field.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:go_router/go_router.dart';

class FoodUploadScreen extends StatefulWidget {
  const FoodUploadScreen({super.key});

  @override
  State<FoodUploadScreen> createState() => _FoodUploadScreenState();
}

class _FoodUploadScreenState extends State<FoodUploadScreen> {
  bool isPhotoState = true; // ture = Food, false = OCR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: defaultHorizontalMarginValue,
          right: defaultHorizontalMarginValue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FoodSwitchOcrBtn(
              state: isPhotoState
                  ? FoodSwitchOcrState.food
                  : FoodSwitchOcrState.ocr,
              onTap: () {
                setState(() {
                  isPhotoState = !isPhotoState;
                });
              },
            ),
            const SizedBox(height: defaultLayoutContentMargin),
            TitleText(
              text: 'Search for food culture',
            ),
            const SizedBox(height: defaultLayoutContentMargin),
            SizedBox(
              width: 280,
              height: 160,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  elevation: 4.0,
                  shadowColor: Colors.black.withOpacity(0.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
                child: const Text('phto upload'),
              ),
            ),
            const SizedBox(height: defaultLayoutContentMargin),
            SizedBox(
              width: 280,
              child: Text(
                'Please upload a picture of the food.\n(Image file of 2MB or less)',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Expanded(
                child: SizedBox(
              height: defaultLayoutDistance,
            )),
            InputTextField(
              titleName: "Dish name",
              hintText: "required",
              textController: TextEditingController(),
            ),
            const SizedBox(height: defaultLayoutContentMargin),
            InputTextField(
              titleName: "Country of origin",
              hintText: "optional",
              textController: TextEditingController(),
            ),
            const SizedBox(height: defaultLayoutContentMargin),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed(
                    AppRoute.foodViewDetail,
                    pathParameters: {
                      'foodName': 'foodName1',
                      'imgData': 'imgData1',
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  elevation: 4.0,
                  shadowColor: Colors.black.withOpacity(0.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                child: const Text('data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
