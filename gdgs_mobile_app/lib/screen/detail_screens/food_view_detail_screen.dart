import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/icons/navigation_icon_icons.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:gdgs_mobile_app/widget/cards/food_img_card.dart';
import 'package:gdgs_mobile_app/widget/cards/local_favorite_card.dart';
import 'package:go_router/go_router.dart';

class FoodViewDetailScreen extends StatefulWidget {
  FoodViewDetailScreen({
    super.key,
    required this.foodName,
    this.imgData,
  });

  String foodName = 'Food Name';
  String? imgData = "";

  @override
  State<FoodViewDetailScreen> createState() => _FoodViewDetailScreenState();
}

class _FoodViewDetailScreenState extends State<FoodViewDetailScreen> {
  bool isLiked = false;

  List<String> foodIngredients = [
    'Rice cake',
    'Fish cake',
    'Green onion',
    'Egg',
    'Chili paste',
    'Sugar',
    'Soy sauce',
    'Sesame oil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoute.foodUpload);
            },
            icon: IconButton(
              icon: Icon(
                isLiked ? NavigationIcon.heart : NavigationIcon.heartOutline,
                color: isLiked ? likeBtnColor : null,
              ),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: defaultLayoutContentMargin,
          left: defaultHorizontalMarginValue,
          right: defaultHorizontalMarginValue,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.foodName,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: textThirdaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: defaultHorizontalMarginValue),
                Image.asset(
                  foodImageSamplePath,
                  width: 180,
                  height: 180,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      text: 'What is it?',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: defaultLayoutContentMargin),
                    Text(
                      'A spicy and sweet Korean street food made with chewy rice cakes in a chili sauce.',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                    ),
                    const SizedBox(height: defaultHorizontalMarginValue),
                    TitleText(
                      text: 'Origin',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: defaultLayoutContentMargin),
                    Text(
                      'The original version of Tteokbokki dates back to the Joseon Dynasty, where it was made with soy sauce and served in royal courts. It has since envolved into various fusion versions like cheese tteokbokki, carbonara tteokbokki, and rosé tteokbokki.',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                    ),
                    const SizedBox(height: defaultHorizontalMarginValue),
                    TitleText(
                      text: 'Common Ingredients ',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: defaultLayoutContentMargin),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: foodIngredients
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Row(
                                children: [
                                  Text(
                                    '• ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: defaultHorizontalMarginValue),
                    TitleText(
                      text: 'Watch out!',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: defaultLayoutContentMargin),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: foodIngredients
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Row(
                                children: [
                                  Text(
                                    '• ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: defaultHorizontalMarginValue),
                    TitleText(
                      text: 'Local Favorites',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: defaultLayoutContentMargin),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return LocalFavoriteCard(
                            storeName: 'Store Name $index',
                            storeContent: 'Store Content $index',
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: defaultHorizontalMarginValue),
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
                                text: "Other Food",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "More",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ),
                            ],
                          ),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
