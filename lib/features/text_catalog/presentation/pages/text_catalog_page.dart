import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:quiz_app/app/router/app_routes.dart';
import 'package:quiz_app/core/presentation/widgets/app_loader.dart';

import '../../../../app/constants/asset_paths.dart';
import '../../../../core/presentation/widgets/app_back_button.dart';
import '../../../translation/presentation/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/catalog_item.dart';

class TextCatalogPage extends StatelessWidget {
  const TextCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isLandscape = screenSize.width > screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('textCatalogPage.screenName'.tr()),
        leading: const AppBackButton(),
      ),
      body: BlocBuilder<TextCatalogCubit, TextCatalogState>(
        builder: (context, state) {
          return state.isLoading
              ? const AppLoader()
              : GridView.builder(
                  itemCount: state.translations.length,
                  physics: const ClampingScrollPhysics(),
                  padding: const .all(16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isLandscape ? 2 : 1,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = state.translations[index];
                    return CatalogItem(
                      key: ValueKey(item.id),
                      onTap: () {
                        context.read<TranslationCubit>().loadRussianText(
                          item.text,
                        );
                        context.push(AppRoutes.translation);
                      },
                      image: '${AssetPaths.coversPath}${item.id}.png',
                      title: item.title,
                      level: item.level,
                      phraseCount: item.text.length,
                    );
                  },
                );
        },
      ),
    );
  }
}
