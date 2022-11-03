import 'package:ftv2/controller/home_controller.dart';
import 'package:ftv2/page/widget/all_widget.dart';
import 'package:ftv2/resource/all_color.dart';
import 'package:ftv2/resource/image.dart';
import 'package:ftv2/route/route.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../shared/common/state_status.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => controller.box(Get.arguments));
    Future<void> share(title) async {
      Share.share('$title check out our app at: \n https://play.google.com/store/apps/details?id=com.funmiquadrionline.ftv2');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: (){
                Get.toNamed(AppRoute.notification);
              },
              icon: const Icon(Icons.notifications,color: Colors.white,))
        ],
      ),
      drawer: newDrawer(controller),

      body: Container(
        height: Get.height,
        decoration: gradientColor(),
        child: SingleChildScrollView(
          child:Obx(() =>  controller.stateStatus == StateStatus.LOADING ?  const Center(
            child: CircularProgressIndicator(
                strokeWidth: 1),
          )
              :  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                normalText("FUNMI QUADRI (SAN) & CO.",16,Colors.white),
                SizedBox(height: Get.height/6),
                 TextField(
                  controller: controller.controller,
                  onSubmitted: (value){
                    print(value);
                    controller.searchHistoryAdd(value);
                    Get.toNamed(AppRoute.cases,arguments: value);
                  },
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.white,),
                    hintText: 'Search Keyword',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        normalText(controller.data.users![0].title!, 20, yellowColor),
                        normalText(controller.data.users![0].description!, 15, yellowColor),
                        normalText(controller.data.users![0].createdAt!.toString(), 15, yellowColor),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(onPressed: (){share(controller.data.users![0].title!);}, icon: const Icon(Icons.share,color: Colors.white,)),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: Get.height/8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                              onTap: (){
                                final Uri url = Uri.parse('tel:08131210744');
                                controller.pointAddApi(url);
                                },
                              child: Image.asset(phoneImage,height: 20,width: 20,)),
                          const SizedBox(height: 10),
                          InkWell(
                              onTap: (){
                                final Uri url = Uri.parse('https://www.facebook.com/sharer/sharer.php?u=https://funmiquadrionline.com&quote=Hi,%20I%20just%20downloaded%20law%20companion%20for%20free%20from%20https://play.google.com/store/apps/details?id=com.funmiquadrionline.elc');
                                controller.pointAddApi(url);
                              },child: Image.asset(facebookImage,height: 20,width: 20,)),
                          const SizedBox(height: 10),
                          InkWell(
                              onTap: (){
                                final Uri url = Uri.parse('https://twitter.com/intent/tweet?via=LawCompanionNG&text=Hi,%20I%20just%20downloaded%20law%20companion%20for%20free%20from%20https://play.google.com/store/apps/details?id=com.funmiquadrionline.elc');
                                controller.pointAddApi(url);
                              },child: Image.asset(twitterImage,height: 20,width: 20,)),
                          const SizedBox(height: 10),
                            InkWell(
                                onTap: (){
                                  final Uri url = Uri.parse('https://api.whatsapp.com/send?text=Hi,%20I%20just%20downloaded%20law%20companion%20for%20free%20from%20https://play.google.com/store/apps/details?id=com.funmiquadrionline.elc');
                                  controller.pointAddApi(url);
                                },child: Image.asset(whatsappImage,height: 20,width: 20,)),
                        ],
                      ),
                      Image.asset(yellowLogo,height: Get.height/4,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}

Widget newDrawer(HomeController controller){
  return  Drawer(
    child: Container(
      decoration: gradientColor(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Image.asset(peopleImage,height: 50,width: 50,),
              const SizedBox(height: 20),
              normalText(controller.name.value, 15, Colors.white),
              const SizedBox(height: 10),
              normalText(controller.email.value, 15, Colors.white),
              const SizedBox(height: 10),
              normalText('Refer ID :- ${controller.referId.value}', 15, Colors.white),
              const SizedBox(height: 10),
              normalText('Point :- ${controller.point.value}', 15, Colors.white),
              const SizedBox(height: 10),
              const Divider(color: Colors.white),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,0),
                child: InkWell(
                  onTap: (){Get.back();},
                  child: Row(
                    children: [
                      Image.asset(home_ic,height: 30,width: 30),
                      const SizedBox(width: 15,),
                      normalText('Home',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){Get.toNamed(AppRoute.laws);},
                  child: Row(
                    children: [
                      Image.asset(law_ic,height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      normalText('Laws',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){Get.toNamed(AppRoute.cases,arguments: '');},
                  child: Row(
                    children: [
                      Image.asset(cases_ic,height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      normalText('Cases',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){Get.toNamed(AppRoute.rulesOfCourts);},
                  child: Row(
                    children: [
                      Image.asset(rule_of_court_ic,height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      normalText('Rules of Court',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){Get.toNamed(AppRoute.citations);},
                  child: Row(
                    children: [
                      Image.asset(link_ic,height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      normalText('Citations',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){Get.toNamed(AppRoute.news);},
                  child: Row(
                    children: [
                      Image.asset(news_ic,height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      normalText('News',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){Get.toNamed(AppRoute.properties);},
                  child: Row(
                    children: [
                      Image.asset(property_ic,height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      normalText('Properties',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){Get.toNamed(AppRoute.feedback);},
                  child: Row(
                    children: [
                      Image.asset(feedback_ic,height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      normalText('FeedBack',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){Get.toNamed(AppRoute.badge);},
                  child: Row(
                    children: [
                      Image.asset(badge_ic,height: 30,width: 30,),
                      const SizedBox(width: 15,),
                      normalText('Badge',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){shareApp();},
                  child: Row(
                    children: [
                      const Icon(Icons.share,color: Colors.white,size: 30,),
                      const SizedBox(width: 15,),
                      normalText('Share App',14,Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,0),
                child: InkWell(
                  onTap: (){Get.toNamed(AppRoute.searchHistory);},
                  child: Row(
                    children: [
                      Image.asset(search_history_ic,height: 30,width: 30),
                      const SizedBox(width: 15),
                      normalText('Search History',14,Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.bottomCenter,
                child: normalText('Your law companion', 14, Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
Future<void> shareApp() async {
  Share.share(' check out our app at: \n https://play.google.com/store/apps/details?id=com.funmiquadrionline.ftv2');
}
