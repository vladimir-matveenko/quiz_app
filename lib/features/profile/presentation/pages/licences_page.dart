import 'package:material_ui/material_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quiz_app/core/presentation/widgets/app_loader.dart';

class LicensesPage extends StatefulWidget {
  const LicensesPage({super.key});

  @override
  State<LicensesPage> createState() => _LicensesPageState();
}

class _LicensesPageState extends State<LicensesPage> {
  late Future<PackageInfo> _future;

  @override
  void initState() {
    _future = PackageInfo.fromPlatform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const AppLoader();
        }

        final info = snapshot.data!;

        return LicensePage(
          applicationName: info.appName,
          applicationVersion: '${info.version} (${info.buildNumber})',
        );
      },
    );
  }
}
