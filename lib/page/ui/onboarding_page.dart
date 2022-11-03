import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/onboarding_controller.dart';
import '../../resource/all_color.dart';


class OnBoardingPage extends GetView<OnBoardingController> {
  const OnBoardingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    onNext(){
      if (controller.pageController.hasClients) {
        controller.pageController.animateToPage(controller.selectPageIndex.value++, duration: const Duration(milliseconds: 200), curve: Curves.ease);
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      //Obx(() =>
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: PageView.builder(
                        controller: controller.pageController,
                        onPageChanged: controller.selectPageIndex,
                        itemCount: controller.onBoardingPages.length,
                        itemBuilder: (context,index){
                          return Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height:10),
                                  Row(
                                    children: [
                                      Text(controller.onBoardingPages[index].title,style:  TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: appBarColor)),
                                    ],
                                  ),
                                  const SizedBox(height:5),
                                  Row(
                                    children: [
                                      Expanded(child: Text(controller.onBoardingPages[index].subTitle,style:  TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: appBarColor))),
                                    ],
                                  ),
                                  const SizedBox(height:20),
                                  Image.asset(controller.onBoardingPages[index].image,height: Get.height/2.5,),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0,right: 30),
                                    child: Text(controller.onBoardingPages[index].desc,style:  TextStyle(fontSize: 16,color: appBarColor),textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                ),
        Obx(() =>  DotsIndicator(
                  dotsCount: 3,
                  decorator: const DotsDecorator(color: Colors.grey,activeColor: Colors.deepPurpleAccent),
                  position: double.parse(controller.selectPageIndex.value.toString()))),
                const SizedBox(height: 10),
                Obx(() => controller.selectPageIndex != 2 ?
                 Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            controller.forwardAction();
                          },child: const Text('Skip',style:  TextStyle(color: Colors.deepPurpleAccent,fontSize: 18))),
                      const Spacer(),
                      GestureDetector(
                          onTap: (){
                            onNext();
                          },child: const Text('Next',style:  TextStyle(color: Colors.deepPurpleAccent,fontSize: 18))),
                    ],
                  ),
                )  :
                GestureDetector(
                  onTap: (){
                    controller.forwardAction();
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color:  Colors.deepPurpleAccent,
                    child: SizedBox(
                        height: 50,width: Get.width/1.3,
                        child: const Center(child: Text('Get Started',style:  TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))),
                  ),
                )
                ),
                const SizedBox(height: 13),
              ],
            ),
          ),
    //)
    );
  }
}
