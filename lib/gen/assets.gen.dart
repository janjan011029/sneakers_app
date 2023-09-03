/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/air_max.png
  AssetGenImage get airMax => const AssetGenImage('assets/images/air_max.png');

  /// File path: assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.png');

  /// File path: assets/images/basketball.png
  AssetGenImage get basketball =>
      const AssetGenImage('assets/images/basketball.png');

  /// File path: assets/images/jordan2.png
  AssetGenImage get jordan2 => const AssetGenImage('assets/images/jordan2.png');

  /// File path: assets/images/max2.png
  AssetGenImage get max2 => const AssetGenImage('assets/images/max2.png');

  /// File path: assets/images/me.jpg
  AssetGenImage get me => const AssetGenImage('assets/images/me.jpg');

  /// File path: assets/images/nike.png
  AssetGenImage get nike => const AssetGenImage('assets/images/nike.png');

  /// File path: assets/images/rewards_and_promos.jpg
  AssetGenImage get rewardsAndPromos =>
      const AssetGenImage('assets/images/rewards_and_promos.jpg');

  /// File path: assets/images/running.png
  AssetGenImage get running => const AssetGenImage('assets/images/running.png');

  /// File path: assets/images/sneakers_app.png
  AssetGenImage get sneakersApp =>
      const AssetGenImage('assets/images/sneakers_app.png');

  /// File path: assets/images/sneakers_icon.png
  AssetGenImage get sneakersIcon =>
      const AssetGenImage('assets/images/sneakers_icon.png');

  /// File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        airMax,
        background,
        basketball,
        jordan2,
        max2,
        me,
        nike,
        rewardsAndPromos,
        running,
        sneakersApp,
        sneakersIcon,
        welcome
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
