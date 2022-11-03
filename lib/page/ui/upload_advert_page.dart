import 'package:ftv2/controller/upload_advert_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/page/widget/extensions.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UploadAdvertPage extends GetView<UploadAdvertController> {
  const UploadAdvertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: normalText('Upload Advert', 20, Colors.white),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: gradientColor(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                GetBuilder<UploadAdvertController>(
                    builder: (controller) => controller.pickedfile != null
                        ? InkWell(
                            onTap: () {
                              controller.pickFiles();
                            },
                            child: Image.file(
                              controller.fileToDisplay!,
                              height: 100,
                              width: 100,
                            ))
                        : InkWell(
                            onTap: () {
                              controller.pickFiles();
                            },
                            child: Icon(Icons.image, size: 100))),
                SizedBox(
                  height: 100,
                ),
                inputField(
                    hintText: 'Description', controller: controller.desc),
                inputField(
                    hintText: 'Location', controller: controller.location),
                inputField(hintText: 'Price', controller: controller.price),
                inputField(
                    hintText: 'Full Name', controller: controller.fullName),
                inputField(hintText: 'Email', controller: controller.email),
                purpleButton('POST ADVERT', () {
                  controller.uploadImage();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
