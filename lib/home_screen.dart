// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'image_controller.dart';

class HomeScreen extends StatelessWidget {
  final ImagePickerController imageController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker with GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          backgroundImage: imageController.imagePath.isNotEmpty
                              ? FileImage(
                                  File(
                                    imageController.imagePath.toString(),
                                  ),
                                )
                              : null,
                        ),
                      ),
                      Expanded(
                        child: CircleAvatar(
                          backgroundImage: imageController
                                  .backImagePath.isNotEmpty
                              ? FileImage(
                                  File(
                                    imageController.backImagePath.toString(),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            imageController.getImage(1);
                          },
                          child: Text("Pick Image"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            imageController.getImage(2);
                          },
                          child: Text("Pick 2nd image"),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      log("Image path: ${imageController.imagePath}");
                      log("Image path: ${imageController.backImagePath}");
                      log("Runtime type: ${imageController.imagePath.runtimeType}");
                      log("Runtime type-2: ${imageController.backImagePath.runtimeType}");
                    },
                    child: Text("Image type check"),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
