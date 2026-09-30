import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/core/error/failure.dart';

@immutable
class AppUtils {
  const AppUtils._();

  static String? parseFailureMessage(Failure failure) {
    if (failure is CacheFailure) {
      return 'errors.cacheError'.tr();
    }
    if (failure is CacheFailure) {
      return 'errors.assetError'.tr();
    }
    if (failure is UnknownFailure) {
      return failure.message;
    }
    return null;
  }

  static Map<String, dynamic> parseJson(String text) {
    final match = RegExp(r'\{[\s\S]*\}').firstMatch(text);

    if (match == null) {
      throw Exception('JSON not found in Gemini response');
    }

    final jsonString = match.group(0)!;

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  static String parseHttpError(int statusCode) {
    return switch (statusCode) {
      400 => 'errors.geminiErrors.badRequest'.tr(),
      401 => 'errors.geminiErrors.unauthorized'.tr(),
      403 => 'errors.geminiErrors.permissionDenied'.tr(),
      404 => 'errors.geminiErrors.notFound'.tr(),
      408 => 'errors.network.timeout'.tr(),
      413 => 'errors.geminiErrors.requestTooLarge'.tr(),
      422 => 'errors.geminiErrors.invalidRequest'.tr(),
      429 => 'errors.geminiErrors.limitReached'.tr(),
      500 => 'errors.geminiErrors.internalServerError'.tr(),
      502 || 503 || 504 => 'errors.geminiErrors.serverUnavailable'.tr(),
      _ => 'errors.geminiErrors.unknownError'.tr(),
    };
  }

  static String parseClientError(Object e) {
    if (e is SocketException) {
      return 'errors.network.noInternet'.tr();
    }
    if (e is TimeoutException) {
      return 'errors.network.timeout'.tr();
    }
    if (e is HandshakeException) {
      return 'errors.network.sslError'.tr();
    }
    if (e is http.ClientException) {
      return 'errors.network.connectionError'.tr();
    }
    if (e is FormatException) {
      return 'errors.geminiErrors.formatException'.tr();
    }
    if (e is TypeError || e is NoSuchMethodError || e is RangeError) {
      return 'errors.geminiErrors.invalidResponse'.tr();
    }

    return 'errors.geminiErrors.unknownError'.tr();
  }

  static Future<void> precacheImages(
    BuildContext context, {
    required List<String> images,
    VoidCallback? onDone,
  }) async {
    try {
      await Future.wait(
        images.map((image) async {
          try {
            if (image.toLowerCase().endsWith('.svg')) {
              final loader = SvgAssetLoader(image);
              await svg.cache.putIfAbsent(
                loader.cacheKey(null),
                () => loader.loadBytes(null),
              );
            } else {
              await precacheImage(AssetImage(image), context);
            }
          } catch (e, stackTrace) {
            log(
              'Failed to precache image: $image',
              error: e,
              stackTrace: stackTrace,
            );
          }
        }),
      );
    } finally {
      if (context.mounted) {
        onDone?.call();
      }
    }
  }
}
