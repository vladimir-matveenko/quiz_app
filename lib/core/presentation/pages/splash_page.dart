import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app/constants/asset_paths.dart';
import 'package:quiz_app/features/auth/presentation/cubit/cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AuthCubit cubit;
  bool _imagesReady = false;

  Future<void> _initializeSplash() async {
    try {
      await precacheImage(const AssetImage(AssetPaths.splashLogo), context);

      if (!mounted) return;
    } catch (e) {
      log(e.toString());
    } finally {
      setState(() {
        _imagesReady = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    cubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeSplash();
      Future.delayed(const Duration(seconds: 1), () {
        cubit.checkAuth();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _imagesReady
            ? Image.asset(AssetPaths.splashLogo)
            : const SizedBox.shrink(),
      ),
    );
  }
}
