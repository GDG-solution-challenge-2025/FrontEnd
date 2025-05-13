import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/widget/Buttons/food_switch_ocr_btn.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class FoodUploadScreen extends StatefulWidget {
  const FoodUploadScreen({super.key});

  @override
  State<FoodUploadScreen> createState() => _FoodUploadScreenState();
}

class _FoodUploadScreenState extends State<FoodUploadScreen> {
  bool isPhotoState = true; // ture = Food, false = OCR
  XFile? imageFile;

  Future<void> _pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.camera, // 카메라 실행
      );

      if (pickedFile != null) {
        setState(() {
          imageFile = pickedFile;
        });
        print("카메라에서 이미지 선택됨: ${imageFile!.path}");
        // TODO: 선택된 이미지로 다음 작업 수행 (예: 화면에 표시, 업로드 등)
      } else {
        print("이미지 선택이 취소되었습니다.");
      }
    } catch (e) {
      print("이미지 선택 중 오류 발생: $e");
      // TODO: 사용자에게 오류 알림
    }
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile;
      });
      print("갤러리에서 이미지 선택됨: ${imageFile!.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: defaultHorizontalMargin,
          right: defaultHorizontalMargin,
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
              child: imageFile != null
                  ? Image.file(File(imageFile!.path))
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        elevation: 4.0,
                        shadowColor: Colors.black.withOpacity(0.25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: _pickImageFromCamera,
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
            const SizedBox(height: defaultLayoutContentMargin),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed(
                    AppRoute.foodViewDetail,
                    pathParameters: {
                      'imgData':
                          imageFile != null ? imageFile!.path : imageNullMsg,
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
