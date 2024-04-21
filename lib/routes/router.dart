import 'package:aksara_ebook_apps/model/book.dart';
import 'package:auto_route/auto_route.dart';

import 'package:aksara_ebook_apps/features/pages.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

// generate with dart run build_runner build
@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: OnboardingRoute.page,
      path: '/onboarding',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: DetailbookRoute.page,
      path: '/detailbook',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: DashboardRoute.page,
      path: '/dashboard/',
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        CustomRoute(
          page: HomeRoute.page,
          path: 'home',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: ExploreRoute.page,
          path: 'explore',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: CartRoute.page,
          path: 'cart',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: ProfileRoute.page,
          path: 'profile',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ],
    ),

  ];
}

