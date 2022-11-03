import 'package:ftv2/binding/badge_binding.dart';
import 'package:ftv2/binding/cases_binding.dart';
import 'package:ftv2/binding/cases_details_binding.dart';
import 'package:ftv2/binding/citations_binding.dart';
import 'package:ftv2/binding/details_binding.dart';
import 'package:ftv2/binding/feedback_binding.dart';
import 'package:ftv2/binding/home_binding.dart';
import 'package:ftv2/binding/news_binding.dart';
import 'package:ftv2/binding/notification_binding.dart';
import 'package:ftv2/binding/payment_binding.dart';
import 'package:ftv2/binding/properties_binding.dart';
import 'package:ftv2/binding/search_history_binding.dart';
import 'package:ftv2/binding/upload_advert_binding.dart';
import 'package:ftv2/page/cases_detail_page.dart';
import 'package:ftv2/page/ui/badge_page.dart';
import 'package:ftv2/page/ui/cases_page.dart';
import 'package:ftv2/page/ui/citations_page.dart';
import 'package:ftv2/page/ui/feedback_page.dart';
import 'package:ftv2/page/ui/home_page.dart';
import 'package:ftv2/page/ui/news_page.dart';
import 'package:ftv2/page/ui/notification_page.dart';
import 'package:ftv2/page/ui/payment_page.dart';
import 'package:ftv2/page/ui/properties_page.dart';
import 'package:ftv2/page/ui/search_history_page.dart';
import 'package:ftv2/page/ui/upload_advert_page.dart';

import '../binding/chapter_details_binding.dart';
import '../binding/laws_binding.dart';
import '../binding/login_binding.dart';
import '../binding/onboarding_binding.dart';
import '../binding/register_binding.dart';
import '../binding/rules_binding.dart';
import '../binding/splash_binding.dart';
import '../page/ui/laws/detail_page.dart';
import '../page/ui/laws/laws_page.dart';
import '../page/ui/login_page.dart';
import '../page/ui/onboarding_page.dart';
import '../page/ui/register_page.dart';
import '../page/ui/rules/chapter_detail_page.dart';
import '../page/ui/rules/rules_page.dart';
import '../page/ui/splash_page.dart';
import 'route.dart';
import 'package:get/route_manager.dart';

class AppPage {
  AppPage._();
  static final routes = [
    GetPage(
        name: AppRoute.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoute.onBoarding,
        page: () => const OnBoardingPage(),
        binding: OnBoardingBinding()),
    GetPage(
        name: AppRoute.register,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoute.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
      name: AppRoute.home,
      page:  () => const HomePage(),
      binding:  HomeBinding()
    ),
    GetPage(
      name: AppRoute.notification,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoute.cases,
      page: () => const CasesPage(),
      binding: CasesBinding(),
    ),
    GetPage(
      name: AppRoute.casesDetails,
      page: () => const CasesDetailPage(),
      binding: CasesDetailsBinding(),
    ),
    GetPage(
      name: AppRoute.citations,
      page: () => const CitationsPage(),
      binding: CitationsBinding(),
    ),
    GetPage(
      name: AppRoute.laws,
      page: () => const LawsPage(),
      binding: LawsBinding(),
    ),
    GetPage(
      name: AppRoute.rulesOfCourts,
      page: () => const RulesPage(),
      binding: RulesBinding(),
    ),
    GetPage(
      name: AppRoute.news,
      page: () => const NewsPage(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: AppRoute.feedback,
      page: () => const FeedBackPage(),
      binding: FeedBackBinding(),
    ),
    GetPage(
      name: AppRoute.searchHistory,
      page: () => const SearchHistoryPage(),
      binding: SearchHistoryBinding(),
    ),
    GetPage(
      name: AppRoute.badge,
      page: () => const BadgePage(),
      binding: BadgeBinding(),
    ),
    GetPage(
      name: AppRoute.properties,
      page: () => const PropertiesPage(),
      binding: PropertiesBinding(),
    ),
    GetPage(
      name: AppRoute.uploadAdvert,
      page: () =>  const UploadAdvertPage(),
      binding: UploadAdvertBinding(),
    ),
    GetPage(
      name: AppRoute.details,
      page: () =>  const DetailPage(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: AppRoute.chapterDetails,
      page: () =>  const ChapterDetailPage(),
      binding: ChapterDetailsBinding(),
    ),
    GetPage(
      name: AppRoute.paymentPage,
      page: () => const PaymentPage(),
      binding: PaymentBinding()
    )
  ];
}