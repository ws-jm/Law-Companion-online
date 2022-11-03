import 'package:ftv2/controller/feedback_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/page/widget/extensions.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FeedBackPage extends GetView<FeedBackController> {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText('Feedback', 20, Colors.white),
        backgroundColor: appBarColor,
      ),
      body: Container(
        decoration: gradientColor(),
        child: Form(
          key: controller.validationKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                normalText('Add FeedBack', 20, Colors.white),
                const SizedBox(height: 20,),
                inputField2(
                  controller: controller.title,
                  hintText: 'Enter Title'
                ),
                inputField2(
                  validation: (value) => controller.isEmailValid(value),
                    controller: controller.email,
                    hintText: 'Enter Email id'
                ),
                inputField2(
                    controller: controller.description,
                    hintText: 'Enter Description'
                ),
                const SizedBox(height: 20,),
                purpleButton('Submit', (){
                  controller.feedBackApi();
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
