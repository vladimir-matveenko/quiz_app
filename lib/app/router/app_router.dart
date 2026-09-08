import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_app/app/router/app_routes.dart';
import 'package:quiz_app/features/auth/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/auth/presentation/cubit/state.dart';
import 'package:quiz_app/features/history/presentation/pages/history_page.dart';
import 'package:quiz_app/features/main/presentation/pages/tests_page.dart';
import 'package:quiz_app/features/profile/presentation/pages/create_profile_page.dart';
import 'package:quiz_app/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:quiz_app/features/profile/presentation/pages/licences_page.dart';
import 'package:quiz_app/features/profile/presentation/pages/profile_page.dart';
import 'package:quiz_app/features/quiz/presentation/pages/quiz_page.dart';
import 'package:quiz_app/features/quiz/presentation/pages/test_page.dart';
import 'package:quiz_app/features/text_catalog/presentation/pages/text_catalog_page.dart';
import 'package:quiz_app/features/translation/presentation/pages/translation_page.dart';

import '../../core/presentation/pages/splash_page.dart';
import '../../features/find_matches/presentation/pages/find_matches_page.dart';
import '../../features/main/presentation/main_screen.dart';
import '../../features/quiz/presentation/pages/flashcards_page.dart';
import '../../features/quiz/presentation/pages/listening_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@lazySingleton
class AppRouter {
  AppRouter(this.cubit);

  final AuthCubit cubit;

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(cubit.stream),
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final status = cubit.state.status;

      final isSplash = state.matchedLocation == AppRoutes.splash;
      final isCreateProfile = state.matchedLocation == AppRoutes.createProfile;

      if (status == AuthStatus.unknown) {
        return null;
      }

      if (status == AuthStatus.unauthenticated) {
        if (isCreateProfile) {
          return null;
        }
        return AppRoutes.createProfile;
      }

      if (status == AuthStatus.authenticated) {
        if (isSplash || isCreateProfile) {
          return AppRoutes.tests;
        }
        return null;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SplashPage()),
      ),
      GoRoute(
        path: AppRoutes.createProfile,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: CreateProfilePage()),
      ),
      GoRoute(
        path: AppRoutes.history,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HistoryPage()),
      ),
      GoRoute(
        path: AppRoutes.translation,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: TranslationPage()),
      ),
      GoRoute(
        path: AppRoutes.catalog,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: TextCatalogPage()),
      ),
      GoRoute(
        path: AppRoutes.licenses,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LicensesPage()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell, state: state);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.tests,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: TestsPage()),
                routes: [
                  GoRoute(
                    path: AppRoutes.translate,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: QuizPage()),
                  ),
                  GoRoute(
                    path: AppRoutes.flashcards,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: FlashcardsPage()),
                  ),
                  GoRoute(
                    path: AppRoutes.test,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: TestPage()),
                  ),
                  GoRoute(
                    path: AppRoutes.listening,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: ListeningPage()),
                  ),
                  GoRoute(
                    path: AppRoutes.findMatches,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: FindMatchesPage()),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            preload: true,
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
                routes: [
                  GoRoute(
                    path: AppRoutes.editProfile,
                    pageBuilder: (context, state) =>
                        const NoTransitionPage(child: EditProfilePage()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
