import 'package:flutter_flavorizr/src/parser/models/flavorizr.dart';
import 'package:flutter_flavorizr/src/processors/android/icons/android_generate_iclauncher_xml_processor.dart';
import 'package:flutter_flavorizr/src/processors/commons/copy_file_processor.dart';
import 'package:flutter_flavorizr/src/processors/commons/new_file_string_processor.dart';
import 'package:flutter_flavorizr/src/processors/commons/queue_processor.dart';
import 'package:flutter_flavorizr/src/utils/constants.dart';
import 'package:sprintf/sprintf.dart';

class AndroidAdaptiveIconXmlProcessor extends QueueProcessor {
  AndroidAdaptiveIconXmlProcessor(
    String? flavorName,
    String? folder, {
    required Flavorizr config,
  }) : super(
          [
            NewFileStringProcessor(
              sprintf(K.androidAdaptiveIconXmlPath, [flavorName, folder]),
              AndroidGenerateIclauncherXmlProcessor(config: config),
              config: config,
            ),
          ],
          config: config,
        );

  @override
  String toString() => 'AndroidAdaptiveIconXmlProcessor';
}
