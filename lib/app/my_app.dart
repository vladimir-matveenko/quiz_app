import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app/router/app_router.dart';
import 'package:quiz_app/features/auth/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/find_matches/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/profile/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/quiz/presentation/cubit/cubit.dart';

import '../features/history/presentation/cubit/cubit.dart';
import '../features/text_catalog/presentation/cubit/cubit.dart';
import '../features/translation/presentation/cubit/cubit.dart';
import '../theme/presentation/cubit/cubit.dart';
import '../theme/presentation/cubit/state.dart';
import 'di/injection.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = getIt<AppRouter>();
  final themeCubit = getIt<ThemeCubit>();
  final authCubit = getIt<AuthCubit>();
  final profileCubit = getIt<ProfileCubit>();
  final historyCubit = getIt<HistoryCubit>();
  final translationCubit = getIt<TranslationCubit>();
  final translationCatalogCubit = getIt<TextCatalogCubit>();
  final quizCubit = getIt<QuizCubit>();
  final findMatchesCubit = getIt<FindMatchesCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => authCubit),
        BlocProvider(create: (_) => themeCubit..loadTheme()),
        BlocProvider(create: (_) => profileCubit),
        BlocProvider(create: (_) => historyCubit..init()),
        BlocProvider(create: (_) => translationCubit),
        BlocProvider(create: (_) => translationCatalogCubit),
        BlocProvider(create: (_) => quizCubit),
        BlocProvider(create: (_) => findMatchesCubit),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Quiz App',
            routerConfig: appRouter.router,
            debugShowCheckedModeBanner: false,
            theme: state.theme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}
