import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/models/food/food_ai_detail.dart';
import 'package:gdgs_mobile_app/service/foodService/food_img_upload_service.dart';
import 'package:gdgs_mobile_app/util/icons/navigation_icon_icons.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:gdgs_mobile_app/widget/cards/food_img_card.dart';
import 'package:gdgs_mobile_app/widget/cards/local_favorite_card.dart';
import 'package:image_picker/image_picker.dart';

class FoodViewDetailScreen extends StatefulWidget {
  FoodViewDetailScreen({
    super.key,
    this.imgData,
    this.foodName,
  });

  XFile? imgData;
  String? foodName;

  @override
  State<FoodViewDetailScreen> createState() => _FoodViewDetailScreenState();
}

class _FoodViewDetailScreenState extends State<FoodViewDetailScreen> {
  bool isLiked = false;

  FoodAiDetail foodAiDetail = FoodAiDetail(
    sidx: 1,
    imgUri: foodImageSamplePath,
    food: "food",
    description: "description",
    origin: "origin",
    howToEat: "howToEat",
    ingredients: ["ingredients"],
    cantIngredients: ["cantIngredients"],
  );

  Future<void> foodAiDetailDataUpdate() async {
    try {
      if (widget.imgData == null) {
        return;
      }
      FoodAiDetail? responseData =
          await FoodImgUploadService.foodImgUpload(widget.imgData!);
      print("foodAiDetailDataUpdate >> dataGet");
      if (responseData != null) {
        foodAiDetail = responseData;
        print("foodAiDetailDataUpdate >> data done");
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> foodAiDetailDataTextUpdate() async {
    try {
      if (widget.imgData == null) {
        return;
      }
      FoodAiDetail? responseData =
          await FoodImgUploadService.menuTextUpload(widget.foodName!);
      print("foodAiDetailDataUpdate >> dataGet");
      if (responseData != null) {
        foodAiDetail = responseData;
        print("foodAiDetailDataUpdate >> data done");
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
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
        ],
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: defaultLayoutContentMargin,
          left: defaultHorizontalMargin,
          right: defaultHorizontalMargin,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: widget.imgData != null
                  ? foodAiDetailDataUpdate()
                  : foodAiDetailDataTextUpdate(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        foodAiDetail.food,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: textThirdaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: defaultHorizontalMargin),
                      widget.imgData == null
                          ? Image.asset(
                              foodImageSamplePath,
                              width: 180,
                              height: 180,
                            )
                          : Image.file(
                              File(widget.imgData!.path),
                              width: 180,
                              height: 180,
                            ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(
                            text: 'What is it?',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(height: defaultLayoutContentMargin),
                          Text(
                            foodAiDetail.description,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                          ),
                          const SizedBox(height: defaultHorizontalMargin),
                          TitleText(
                            text: 'Origin',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(height: defaultLayoutContentMargin),
                          Text(
                            foodAiDetail.origin,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                          ),
                          const SizedBox(height: defaultHorizontalMargin),
                          TitleText(
                            text: 'How to eat',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(height: defaultLayoutContentMargin),
                          Text(
                            foodAiDetail.howToEat,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                          ),
                          const SizedBox(height: defaultHorizontalMargin),
                          TitleText(
                            text: 'Common Ingredients ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(height: defaultLayoutContentMargin),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: foodAiDetail.ingredients!
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
                          const SizedBox(height: defaultHorizontalMargin),
                          TitleText(
                            text: 'Watch out!',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(height: defaultLayoutContentMargin),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: foodAiDetail.cantIngredients!
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
                                                      .error,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: defaultHorizontalMargin),
                          TitleText(
                            text: 'Local Favorites',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
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
                          const SizedBox(height: defaultHorizontalMargin),
                          Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TitleText(
                                      text: "Other Food",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
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
                  );
                } else {
                  return Center(
                    child: Text("Server Err\n ${snapshot.error.toString()}"),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
