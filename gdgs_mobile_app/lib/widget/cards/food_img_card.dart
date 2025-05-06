import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';

class FoodImgCard extends StatelessWidget {
  FoodImgCard({
    super.key,
    required this.foodName,
    required this.foodImgUrl,
    this.onTap,
  });

  String foodName;
  String foodImgUrl;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 150,
      padding: const EdgeInsets.all(defaultLayoutContentMargin),
      margin: const EdgeInsets.only(
          top: defaultLayoutContentMargin / 2,
          left: defaultLayoutContentMargin,
          right: defaultLayoutContentMargin,
          bottom: defaultLayoutContentMargin / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              foodImgUrl,
              width: 72,
              height: 72,
            ),
            const SizedBox(
              height: defaultLayoutContentMargin,
            ),
            Text(
              foodName,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
