import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/models/food/food_ai_detail.dart';
import 'package:gdgs_mobile_app/service/foodService/food_img_upload_service.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class FoodUploadOcrList extends StatefulWidget {
  FoodUploadOcrList({
    super.key,
    required this.imgData,
  });

  XFile? imgData;
  @override
  State<FoodUploadOcrList> createState() => _FoodUploadOcrListState();
}

class _FoodUploadOcrListState extends State<FoodUploadOcrList> {
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

  List<String>? _menuList = List<String>.empty(growable: true);

  Future<void> foodOcrData() async {
    try {
      if (widget.imgData == null) {
        return;
      }
      _menuList = await FoodImgUploadService.menuImgUpload(widget.imgData!);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: foodOcrData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  context.goNamed(
                    AppRoute.foodViewDetailText,
                    extra: _menuList![index],
                  );
                },
                child: ListTile(
                  title: Text(
                    _menuList![index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text("err"));
        }
      },
    );
  }
}
