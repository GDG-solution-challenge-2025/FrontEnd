// 모달 BottomSheet를 보여주는 함수
import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/number_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:go_router/go_router.dart';

void showFoodCultureOptions(
  BuildContext context, {
  required Future<void> Function() onSelectPhoto,
  required Future<void> Function() onSelectAlbum,
}) {
  showModalBottomSheet(
    context: context,
    // 모달의 모양 설정 (상단 모서리 둥글게)
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    // 모달의 배경색 (선택 사항, 기본값은 테마에 따름)
    // backgroundColor: Colors.white,
    builder: (BuildContext bc) {
      // 모달 내부 UI 구성
      return Padding(
        padding: const EdgeInsets.all(defaultHorizontalMargin),
        child: Column(
          children: [
            TitleText(
              text: "Search for food culture",
            ),
            const SizedBox(
              height: defaultHorizontalMargin,
            ),
            InkWell(
              onTap: () async {
                if (bc.mounted) {
                  bc.pop();
                }
                await onSelectPhoto();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.photo_camera,
                    size: imgMediumIconSize,
                    color: titleTextColor,
                  ),
                  const SizedBox(
                    width: defaultLayoutContentMargin,
                  ),
                  Text(
                    "Take a photo",
                    style: Theme.of(bc).textTheme.titleLarge!.copyWith(
                          color: titleTextColor,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: defaultLayoutContentMargin,
            ),
            InkWell(
              onTap: () async {
                if (bc.mounted) {
                  bc.pop();
                }
                await onSelectAlbum();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.image,
                    size: imgMediumIconSize,
                    color: titleTextColor,
                  ),
                  const SizedBox(
                    width: defaultLayoutContentMargin,
                  ),
                  Text(
                    "Import from album",
                    style: Theme.of(bc).textTheme.titleLarge!.copyWith(
                          color: titleTextColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
