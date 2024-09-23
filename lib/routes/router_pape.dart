import 'package:get/get.dart';
import 'package:thuctap/routes/router_name.dart';
import 'package:thuctap/views/login_view.dart';

import '../views/menu_view.dart';
import '../views/sales_statistics_view.dart';
import '../views/select_route_view.dart';
import '../views/summary_of_day_view.dart';
import '../views/synchronized_data_view.dart';

var pages = [
  GetPage(
      name: RouterName.login,
      page: () => const LoginViews(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300)),
  GetPage(
      name: RouterName.menu,
      page: () => const MenuView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300)),
  GetPage(
      name: RouterName.salesStatistics,
      page: () => const SalesStatisticsView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300)),
  GetPage(
      name: RouterName.selectedRoute,
      page: () => const SelectRouteView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300)),
  GetPage(
      name: RouterName.summaryOfDay,
      page: () => SummaryOfDayView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300)),
  GetPage(
      name: RouterName.synchronizedData,
      page: () => SynchronizedDataView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300)),
];
