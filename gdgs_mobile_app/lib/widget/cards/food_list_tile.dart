import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';

class FoodListTile extends StatelessWidget {
  FoodListTile({
    super.key,
    required this.title,
    this.leadingWidget,
    this.trailingWidget,
    this.subTitle,
    this.foodImg,
    this.onTap,
  });
  String title;
  Widget? trailingWidget;
  Widget? leadingWidget;
  Text? subTitle;
  String? foodImg;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.only(
        left: defaultLayoutContentMargin,
        right: defaultLayoutContentMargin,
      ),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leadingWidget != null) leadingWidget!,
            if (leadingWidget != null)
              const SizedBox(width: defaultLayoutContentMargin),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  if (subTitle != null) subTitle!,
                ],
              ),
            ),
            if (trailingWidget != null) trailingWidget!,
          ],
        ),
      ),
    );
  }
}
