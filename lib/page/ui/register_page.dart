import 'package:ftv2/page/widget/extensions.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/register_controller.dart';
import '../widget/all_widget.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(decoration: gradientColor()),
            SingleChildScrollView(
              child: Form(
                key: controller.validationKey,
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(Get.width/12,0,Get.width/12,0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const  SizedBox(height: 10),
                      Row(
                        children: [
                           InkWell(
                               onTap: (){
                                 Get.back();
                               },
                               child:const Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)),
                        ],
                      ),
                      const  SizedBox(height: 20),
                      inputField(
                        controller: controller.referId,
                        hintText: 'Refer ID',
                      ),
                      inputField(
                        validation: (value) => controller.isNameValid(value),
                        controller: controller.name,
                        hintText: 'Full name',
                      ),
                      inputField(
                        validation: (value) => controller.isEmailValid(value),
                        controller: controller.email,
                        hintText: 'Email address',
                      ),
                      inputField(
                        validation: (value) => controller.isNumberValid(value),
                        controller: controller.phone,
                        hintText: 'Phone number',
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Obx(
                              () => Padding(
                            padding: const EdgeInsets.all(0),
                            child: Theme(
                              data: Theme.of(context).copyWith(canvasColor: Colors.black),
                              child: DropdownButton(
                                focusColor: Colors.black,
                                isExpanded: true,
                                value: controller.selectedCountry.value == ''
                                    ? controller.countryListRx.value
                                    .toSet()
                                    .toList()[0]
                                    : controller.selectedCountry.value,
                                onChanged: (newValue) {
                                  controller.onSelectedCountry(newValue);
                                },
                                underline: const SizedBox(),
                                items: controller.countryListRx.value
                                    .toSet()
                                    .toList()
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),

                                    ),
                                  );
                                }).toList(),
                                hint: const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "State",
                                    style:
                                    TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                      inputField(
                        controller: controller.organization,
                        hintText: 'Organization',
                      ),
                      const SizedBox(height: 10,),
                      purpleButton('REGISTER', (){
                        _signUpValidate();
                      }),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          normalText('Already have an account?  ', 15, Colors.white),
                          boldText('LOGIN NOW', 15, Colors.deepPurple)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signUpValidate() {
    switch (controller.validationKey.currentState!.validate()) {
      case true:
        controller.validationKey.currentState!.save();
        controller.registerApi();
        break;
      case false:
        controller.checkAutoValidate();
        break;
    }
  }

}
