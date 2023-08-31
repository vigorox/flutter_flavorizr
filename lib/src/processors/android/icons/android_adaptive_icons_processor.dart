import 'package:flutter_flavorizr/src/parser/models/flavorizr.dart';
import 'package:flutter_flavorizr/src/processors/android/icons/android_adaptive_icon_delete_processor.dart';
import 'package:flutter_flavorizr/src/processors/android/icons/android_adaptive_icon_processor.dart';
import 'package:flutter_flavorizr/src/processors/commons/queue_processor.dart';

class AndroidAdaptiveIconsProcessor extends QueueProcessor {
  AndroidAdaptiveIconsProcessor({
    required Flavorizr config,
  }) : super(
          config.androidFlavors.map(
            (flavorName, flavor) {
              if (flavor.android?.iconForeground != null &&
                  flavor.android?.iconBackground != null) {
                return MapEntry(
                  flavorName,
                  AndroidAdaptiveIconProcessor(
                    flavor.android!.iconForeground ?? '',
                    flavor.android!.iconBackground ?? '',
                    flavorName,
                    config: config,
                  ),
                );
              } else {
                return MapEntry(
                  flavorName,
                  AndroidAdaptiveIconDeleteProcessor(
                    flavorName,
                    config: config,
                  ),
                );
              }
            },
          ).values,
          config: config,
        );

  @override
  String toString() => 'AndroidAdaptiveIconsProcessor';
}
