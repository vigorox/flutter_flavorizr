import 'package:flutter_flavorizr/src/parser/models/flavorizr.dart';
import 'package:flutter_flavorizr/src/processors/commons/delete_path_processor.dart';
import 'package:flutter_flavorizr/src/processors/commons/image_resizer_processor.dart';
import 'package:flutter_flavorizr/src/processors/commons/queue_processor.dart';
import 'package:flutter_flavorizr/src/utils/constants.dart';
import 'package:sprintf/sprintf.dart';

class AndroidAdaptiveIconDeleteProcessor extends QueueProcessor {
  static const _entries = {
    'mipmap-mdpi-v26': Size(width: 108, height: 108),
    'mipmap-hdpi-v26': Size(width: 162, height: 162),
    'mipmap-xhdpi-v26': Size(width: 216, height: 216),
    'mipmap-xxhdpi-v26': Size(width: 324, height: 324),
    'mipmap-xxxhdpi-v26': Size(width: 432, height: 432),
  };

  String flavorName;

  AndroidAdaptiveIconDeleteProcessor(
    this.flavorName, {
    required Flavorizr config,
  }) : super(
          _entries.map(
            (folder, size) {
              return MapEntry(
                folder,
                QueueProcessor([
                  DeletePathProcessor(
                      sprintf(
                        '${K.androidAppPath}/src/%s/res/%s/',
                        [flavorName, folder],
                      ),
                      config: config)
                ], config: config),
              );
            },
          ).values,
          config: config,
        );

  @override
  String toString() => 'AndroidAdaptiveIconDeleteProcessor';
}
