import 'package:material_ui/material_ui.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.size = 40.0, this.thickness});

  static AppLoader small() => const AppLoader(size: 20.0, thickness: 2.0);

  final double? size;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator.adaptive(strokeWidth: thickness),
    );
  }
}
