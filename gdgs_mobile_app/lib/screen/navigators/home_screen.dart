import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/text_title.dart';
import 'package:gdgs_mobile_app/widget/cards/food_img_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: defaultHorizontalMarginValue,
          right: defaultHorizontalMarginValue,
          top: defaultTopMarginValue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: mainHomeTitle,
                      ),
                      Text(
                        mainHomeSubTitle,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: defaultLayoutContentMargin),
                SizedBox(
                  width: double.infinity,
                  height: 160,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'photo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: defaultLayoutDistance,
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        text: "Global Cuisine",
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "More",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultLayoutContentMargin,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return FoodImgCard(
                        foodName: 'foodName $index',
                        foodImgUrl: foodImageSamplePath,
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: defaultLayoutDistance,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    text: "Ranking",
                  ),
                  Row(
                    children: [
                      ChoiceChip(
                        selected: true,
                        selectedColor: Theme.of(context).colorScheme.primary,
                        backgroundColor: Theme.of(context).colorScheme.outline,
                        label: Text(
                          "Searched",
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                        ),
                      ),
                      const SizedBox(width: defaultLayoutContentMargin),
                      ChoiceChip(
                        selected: false,
                        selectedColor: Theme.of(context).colorScheme.primary,
                        backgroundColor: Theme.of(context).colorScheme.outline,
                        label: Text(
                          "Liked",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
