import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';

class LocalFavoriteCard extends StatefulWidget {
  LocalFavoriteCard({
    super.key,
    required this.storeName,
    required this.storeContent,
  });

  String storeName;
  String storeContent;

  @override
  State<LocalFavoriteCard> createState() => _LocalFavoriteCardState();
}

class _LocalFavoriteCardState extends State<LocalFavoriteCard> {
  double reviewScore = 5.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 160,
      padding: const EdgeInsets.all(defaultLayoutContentMargin),
      margin: const EdgeInsets.only(
        top: defaultLayoutContentMargin / 2,
        left: defaultLayoutContentMargin,
        right: defaultLayoutContentMargin,
        bottom: defaultLayoutContentMargin / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.15),
            blurRadius: 13,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          print('tab');
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.storeName,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  RatingBar(
                    initialRating: reviewScore,
                    itemCount: 5,
                    minRating: 0,
                    itemSize: 20,
                    direction: Axis.horizontal,
                    updateOnDrag: true,
                    allowHalfRating: true,
                    ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: startBtnColor,
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: startBtnColor,
                      ),
                      empty: Icon(
                        Icons.star_outline,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        reviewScore = rating;
                      });
                    },
                  ),
                  Text(
                    widget.storeContent,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: defaultLayoutContentMargin,
            ),
            Image.asset(
              foodImageSamplePath,
              width: 100,
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
