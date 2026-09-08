import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/app/constants/app_enums.dart';
import 'package:quiz_app/app/constants/asset_paths.dart';
import 'package:quiz_app/app/router/app_routes.dart';
import 'package:quiz_app/features/find_matches/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/profile/presentation/cubit/cubit.dart';
import 'package:quiz_app/features/quiz/presentation/cubit/cubit.dart';

import '../../../text_catalog/presentation/cubit/cubit.dart';
import '../widgets/test_item.dart';

class TestsPage extends StatelessWidget {
  const TestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge;
    final profileState = context.watch<ProfileCubit>().state;
    final wordCount = profileState.profile?.wordCount ?? 10;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: constraints.maxHeight,
            color: theme.scaffoldBackgroundColor,
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .stretch,
              spacing: 16.0,
              children: [
                TestItem(
                  title: 'testsPage.translate'.tr(),
                  onLeftTap: () {
                    context.read<QuizCubit>().loadWords(
                      type: TranslationType.enRu,
                      wordCount: wordCount,
                    );
                    context.go('${AppRoutes.tests}/${AppRoutes.translate}');
                  },
                  onRightTap: () {
                    context.read<QuizCubit>().loadWords(
                      type: TranslationType.ruEn,
                      wordCount: wordCount,
                    );
                    context.go('${AppRoutes.tests}/${AppRoutes.translate}');
                  },
                ),
                TestItem(
                  title: 'testsPage.flashcards'.tr(),
                  onLeftTap: () {
                    context.read<QuizCubit>().loadWords(
                      type: TranslationType.enRu,
                      wordCount: wordCount,
                    );
                    context.go('${AppRoutes.tests}/${AppRoutes.flashcards}');
                  },
                  onRightTap: () {
                    context.read<QuizCubit>().loadWords(
                      type: TranslationType.ruEn,
                      wordCount: wordCount,
                    );
                    context.go('${AppRoutes.tests}/${AppRoutes.flashcards}');
                  },
                ),
                TestItem(
                  title: 'testsPage.test'.tr(),
                  onLeftTap: () {
                    context.read<QuizCubit>().loadWords(
                      type: TranslationType.enRu,
                      loadAdditionalWords: true,
                      wordCount: wordCount,
                    );
                    context.go('${AppRoutes.tests}/${AppRoutes.test}');
                  },
                  onRightTap: () {
                    context.read<QuizCubit>().loadWords(
                      type: TranslationType.ruEn,
                      loadAdditionalWords: true,
                      wordCount: wordCount,
                    );
                    context.go('${AppRoutes.tests}/${AppRoutes.test}');
                  },
                ),
                OutlinedButton(
                  onPressed: () {
                    context.read<TextCatalogCubit>().loadCatalog();
                    context.push(AppRoutes.catalog);
                  },
                  child: Row(
                    mainAxisSize: .min,
                    spacing: 4.0,
                    children: [
                      Text('testsPage.translation'.tr(), style: textStyle),
                      SvgPicture.asset(AssetPaths.flagRu, height: 20.0),
                      SvgPicture.asset(AssetPaths.flagUs, height: 20.0),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    context.read<QuizCubit>().loadWords(
                      type: TranslationType.ruEn,
                      wordCount: wordCount,
                    );
                    context.go('${AppRoutes.tests}/${AppRoutes.listening}');
                  },
                  child: Text(
                    'listeningPage.screenName'.tr(),
                    style: textStyle,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    context.read<FindMatchesCubit>().loadWords(
                      wordCount: wordCount,
                    );
                    context.go('${AppRoutes.tests}/${AppRoutes.findMatches}');
                  },
                  child: Text(
                    'findMatchesPage.screenName'.tr(),
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
