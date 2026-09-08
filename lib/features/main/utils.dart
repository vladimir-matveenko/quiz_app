import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/app/router/app_routes.dart';

@immutable
class MainScreenUtils {
  const MainScreenUtils._();

  static String getAppBarTitle(BuildContext context) {
    final location = GoRouterState.of(context).uri;
    if (location.pathSegments.length == 2) {
      if (location.pathSegments.last == AppRoutes.translate) {
        return 'testsPage.translate'.tr();
      }
      if (location.pathSegments.last == AppRoutes.flashcards) {
        return 'testsPage.flashcards'.tr();
      }
      if (location.pathSegments.last == AppRoutes.test) {
        return 'testsPage.test'.tr();
      }
      if (location.pathSegments.last == AppRoutes.listening) {
        return 'testsPage.listening'.tr();
      }
      if (location.pathSegments.last == AppRoutes.editProfile) {
        return 'editProfilePage.screenName'.tr();
      }
      if (location.pathSegments.last == AppRoutes.findMatches) {
        return 'findMatchesPage.screenName'.tr();
      }
    }
    return switch (location.toString()) {
      AppRoutes.tests => 'testsPage.screenName'.tr(),
      AppRoutes.profile => 'profilePage.screenName'.tr(),
      _ => '',
    };
  }

  static bool showBackButton(BuildContext context) {
    final uri = GoRouterState.of(context).uri;
    return uri.pathSegments.length > 1;
  }
}
