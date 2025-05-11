import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:gdgs_mobile_app/widget/cards/food_list_tile.dart';

class GlobalCuisineScreen extends StatelessWidget {
  GlobalCuisineScreen({super.key});

  List<String> foodlist = [
    "food1",
    "food2",
    "food3",
    "food4",
    "food5",
    "food6",
    "food7",
    "food8",
    "food9",
    "food10",
    "food11",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: defaultLayoutContentMargin,
          left: defaultHorizontalMargin,
          right: defaultHorizontalMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              text: "Global Cuisine",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: defaultLayoutContentMargin,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: foodlist.length,
                  itemBuilder: (context, indexItem) {
                    return SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: FoodListTile(
                        title: foodlist[indexItem],
                        trailingWidget: Image.asset(
                          foodImageSamplePath,
                          width: 100,
                          height: 100,
                        ),
                        subTitle: Text(
                          "Sub",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                        boxDeco: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: boxShadowColor.withOpacity(0.1),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        marginValue: const EdgeInsets.all(6.0),
                        paddingValue: const EdgeInsets.only(
                          right: defaultLayoutContentMargin,
                          left: defaultLayoutContentMargin,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
