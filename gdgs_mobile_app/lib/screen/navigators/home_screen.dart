import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/widget/Buttons/ranking_chip.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:gdgs_mobile_app/widget/cards/food_img_card.dart';
import 'package:gdgs_mobile_app/widget/cards/food_list_tile.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RankingState selectRank =
      RankingState.searched; // true = Searched, false = Liked

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: defaultHorizontalMarginValue,
          right: defaultHorizontalMarginValue,
          top: defaultTopMarginValue,
        ),
        child: SingleChildScrollView(
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
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
                      onPressed: () {
                        context.goNamed(AppRoute.foodUpload);
                      },
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
                        RankingChip(
                          selected: selectRank,
                          title: "Searched",
                          onTap: () {
                            setState(() {
                              selectRank = RankingState.searched;
                            });
                          },
                        ),
                        const SizedBox(width: defaultLayoutContentMargin),
                        RankingChip(
                          selected: selectRank,
                          title: "Liked",
                          onTap: () {
                            setState(() {
                              selectRank = RankingState.liked;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: defaultLayoutContentMargin,
                    ),
                    SizedBox(
                      height: 72 * 5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return FoodListTile(
                            title: 'Food Name',
                            onTap: () {},
                            leadingWidget: Text('${index + 1}'),
                            trailingWidget: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
