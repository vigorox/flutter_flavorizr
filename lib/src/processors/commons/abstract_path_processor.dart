import 'dart:io';

import 'package:flutter_flavorizr/src/parser/models/flavorizr.dart';
import 'package:flutter_flavorizr/src/processors/commons/abstract_processor.dart';

abstract class AbstractPathProcessor extends AbstractProcessor<void> {
  final String path;
  final Directory directory;

  AbstractPathProcessor(
    this.path, {
    required Flavorizr config,
  })  : directory = Directory(path),
        super(config);
}
