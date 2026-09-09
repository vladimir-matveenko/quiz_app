// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:quiz_app/app/di/modules/database_module.dart' as _i1034;
import 'package:quiz_app/app/di/modules/shared_pref_module.dart' as _i775;
import 'package:quiz_app/app/router/app_router.dart' as _i223;
import 'package:quiz_app/features/auth/domain/usecases/check_auth_usecase.dart'
    as _i387;
import 'package:quiz_app/features/auth/presentation/cubit/cubit.dart' as _i1034;
import 'package:quiz_app/features/dictionary/data/data_sources/dictionary_asset_data_source.dart'
    as _i976;
import 'package:quiz_app/features/dictionary/data/data_sources/dictionary_local_data_source.dart'
    as _i66;
import 'package:quiz_app/features/dictionary/data/database/app_database.dart'
    as _i316;
import 'package:quiz_app/features/dictionary/data/providers/database_provider.dart'
    as _i451;
import 'package:quiz_app/features/dictionary/services/dictionary_service.dart'
    as _i457;
import 'package:quiz_app/features/dictionary/services/tts_service.dart'
    as _i192;
import 'package:quiz_app/features/find_matches/presentation/cubit/cubit.dart'
    as _i146;
import 'package:quiz_app/features/history/data/data_sources/history_local_data_source.dart'
    as _i731;
import 'package:quiz_app/features/history/data/repository/history_repository_impl.dart'
    as _i878;
import 'package:quiz_app/features/history/domain/repository/history_repository.dart'
    as _i427;
import 'package:quiz_app/features/history/domain/usecases/delete_history_usecase.dart'
    as _i471;
import 'package:quiz_app/features/history/domain/usecases/fetch_history_usecase.dart'
    as _i876;
import 'package:quiz_app/features/history/domain/usecases/fetch_month_history_usecase.dart'
    as _i173;
import 'package:quiz_app/features/history/domain/usecases/save_history_usecase.dart'
    as _i1051;
import 'package:quiz_app/features/history/presentation/cubit/cubit.dart'
    as _i61;
import 'package:quiz_app/features/profile/data/data_sources/profile_local_data_source.dart'
    as _i146;
import 'package:quiz_app/features/profile/data/repository/profile_repository_impl.dart'
    as _i102;
import 'package:quiz_app/features/profile/domain/repository/profile_repository.dart'
    as _i1049;
import 'package:quiz_app/features/profile/domain/usecases/delete_profile_usecase.dart'
    as _i519;
import 'package:quiz_app/features/profile/domain/usecases/fetch_profile_usecase.dart'
    as _i89;
import 'package:quiz_app/features/profile/domain/usecases/save_profile_usecase.dart'
    as _i235;
import 'package:quiz_app/features/profile/presentation/cubit/cubit.dart'
    as _i504;
import 'package:quiz_app/features/quiz/presentation/cubit/cubit.dart' as _i936;
import 'package:quiz_app/features/text_catalog/data/data_sources/text_catalog_local_data_source.dart'
    as _i935;
import 'package:quiz_app/features/text_catalog/data/repository/text_catalog_repository_impl.dart'
    as _i843;
import 'package:quiz_app/features/text_catalog/domain/repository/text_catalog_repository.dart'
    as _i819;
import 'package:quiz_app/features/text_catalog/domain/usecases/load_catalog_usecase.dart'
    as _i912;
import 'package:quiz_app/features/text_catalog/presentation/cubit/cubit.dart'
    as _i25;
import 'package:quiz_app/features/translation/data/services/gemini_service_impl.dart'
    as _i192;
import 'package:quiz_app/features/translation/domain/services/gemini_service.dart'
    as _i631;
import 'package:quiz_app/features/translation/domain/usecases/check_translation_usecase.dart'
    as _i806;
import 'package:quiz_app/features/translation/presentation/cubit/cubit.dart'
    as _i998;
import 'package:quiz_app/theme/data/data_sources/theme_local_data_source.dart'
    as _i593;
import 'package:quiz_app/theme/data/repository/theme_repository_impl.dart'
    as _i496;
import 'package:quiz_app/theme/domain/repository/theme_repository.dart' as _i37;
import 'package:quiz_app/theme/domain/usecases/get_theme_usecase.dart' as _i575;
import 'package:quiz_app/theme/domain/usecases/set_theme_usecase.dart'
    as _i1061;
import 'package:quiz_app/theme/presentation/cubit/cubit.dart' as _i740;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefModule = _$SharedPrefModule();
    final databaseModule = _$DatabaseModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i192.TtsService>(() => _i192.TtsService());
    gh.lazySingleton<_i976.DictionaryAssetDataSource>(
      () => _i976.DictionaryAssetDataSource(),
    );
    gh.lazySingleton<_i451.DatabaseProvider>(() => _i451.DatabaseProvider());
    gh.lazySingleton<_i935.TextCatalogLocalDataSource>(
      () => _i935.CatalogLocalDataSourceImpl(),
    );
    await gh.factoryAsync<_i316.AppDatabase>(
      () => databaseModule.provideDatabase(gh<_i451.DatabaseProvider>()),
      preResolve: true,
    );
    gh.lazySingleton<_i66.DictionaryLocalDataSource>(
      () => _i66.DictionaryLocalDataSource(gh<_i316.AppDatabase>()),
    );
    gh.lazySingleton<_i731.HistoryLocalDataSource>(
      () => _i731.HistoryLocalDataSourceImpl(gh<_i316.AppDatabase>()),
    );
    gh.lazySingleton<_i593.ThemeLocalDataSource>(
      () => _i593.ThemeLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i631.GeminiService>(() => _i192.GeminiServiceImpl());
    gh.lazySingleton<_i806.CheckTranslationUseCase>(
      () => _i806.CheckTranslationUseCase(gh<_i631.GeminiService>()),
    );
    gh.lazySingleton<_i146.ProfileLocalDataSource>(
      () => _i146.ProfileLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i819.TextCatalogRepository>(
      () => _i843.TextCatalogRepositoryImpl(
        catalogLocalDataSource: gh<_i935.TextCatalogLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i998.TranslationCubit>(
      () => _i998.TranslationCubit(gh<_i806.CheckTranslationUseCase>()),
    );
    gh.lazySingleton<_i146.FindMatchesCubit>(
      () => _i146.FindMatchesCubit(
        gh<_i66.DictionaryLocalDataSource>(),
        gh<_i192.TtsService>(),
      ),
    );
    gh.lazySingleton<_i457.DictionaryService>(
      () => _i457.DictionaryService(gh<_i976.DictionaryAssetDataSource>()),
    );
    gh.lazySingleton<_i1049.ProfileRepository>(
      () => _i102.ProfileRepositoryImpl(
        profileLocalDataSource: gh<_i146.ProfileLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i427.HistoryRepository>(
      () => _i878.HistoryRepositoryImpl(
        historyLocalDataSource: gh<_i731.HistoryLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i37.ThemeRepository>(
      () => _i496.ThemeRepositoryImpl(
        themeLocalDataSource: gh<_i593.ThemeLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i936.QuizCubit>(
      () => _i936.QuizCubit(
        gh<_i66.DictionaryLocalDataSource>(),
        gh<_i192.TtsService>(),
      ),
    );
    gh.lazySingleton<_i387.CheckAuthUseCase>(
      () => _i387.CheckAuthUseCase(gh<_i1049.ProfileRepository>()),
    );
    gh.lazySingleton<_i519.DeleteProfileUseCase>(
      () => _i519.DeleteProfileUseCase(gh<_i1049.ProfileRepository>()),
    );
    gh.lazySingleton<_i89.FetchProfileUseCase>(
      () => _i89.FetchProfileUseCase(gh<_i1049.ProfileRepository>()),
    );
    gh.lazySingleton<_i235.SaveProfileUseCase>(
      () => _i235.SaveProfileUseCase(gh<_i1049.ProfileRepository>()),
    );
    gh.lazySingleton<_i912.LoadCatalogUseCase>(
      () => _i912.LoadCatalogUseCase(gh<_i819.TextCatalogRepository>()),
    );
    gh.lazySingleton<_i575.GetThemeUseCase>(
      () => _i575.GetThemeUseCase(gh<_i37.ThemeRepository>()),
    );
    gh.lazySingleton<_i1061.SetThemeUseCase>(
      () => _i1061.SetThemeUseCase(gh<_i37.ThemeRepository>()),
    );
    gh.lazySingleton<_i471.DeleteHistoryUseCase>(
      () => _i471.DeleteHistoryUseCase(gh<_i427.HistoryRepository>()),
    );
    gh.lazySingleton<_i876.FetchHistoryUseCase>(
      () => _i876.FetchHistoryUseCase(gh<_i427.HistoryRepository>()),
    );
    gh.lazySingleton<_i173.FetchMonthHistoryUseCase>(
      () => _i173.FetchMonthHistoryUseCase(gh<_i427.HistoryRepository>()),
    );
    gh.lazySingleton<_i1051.SaveHistoryUseCase>(
      () => _i1051.SaveHistoryUseCase(gh<_i427.HistoryRepository>()),
    );
    gh.lazySingleton<_i25.TextCatalogCubit>(
      () => _i25.TextCatalogCubit(gh<_i912.LoadCatalogUseCase>()),
    );
    gh.lazySingleton<_i1034.AuthCubit>(
      () => _i1034.AuthCubit(gh<_i387.CheckAuthUseCase>()),
    );
    gh.lazySingleton<_i61.HistoryCubit>(
      () => _i61.HistoryCubit(
        gh<_i876.FetchHistoryUseCase>(),
        gh<_i173.FetchMonthHistoryUseCase>(),
        gh<_i1051.SaveHistoryUseCase>(),
        gh<_i471.DeleteHistoryUseCase>(),
      ),
    );
    gh.lazySingleton<_i504.ProfileCubit>(
      () => _i504.ProfileCubit(
        gh<_i89.FetchProfileUseCase>(),
        gh<_i235.SaveProfileUseCase>(),
        gh<_i519.DeleteProfileUseCase>(),
      ),
    );
    gh.lazySingleton<_i740.ThemeCubit>(
      () => _i740.ThemeCubit(
        gh<_i575.GetThemeUseCase>(),
        gh<_i1061.SetThemeUseCase>(),
      ),
    );
    gh.lazySingleton<_i223.AppRouter>(
      () => _i223.AppRouter(gh<_i1034.AuthCubit>()),
    );
    return this;
  }
}

class _$SharedPrefModule extends _i775.SharedPrefModule {}

class _$DatabaseModule extends _i1034.DatabaseModule {}
