import 'package:flutter_flavorizr/src/parser/models/flavorizr.dart';
import 'package:flutter_flavorizr/src/processors/commons/abstract_path_processor.dart';

class DeletePathProcessor extends AbstractPathProcessor {
  final String _source;

  DeletePathProcessor(
    this._source, {
    required Flavorizr config,
  }) : super(
          _source,
          config: config,
        );

  @override
  void execute() {
    if (directory.existsSync()) {
      directory.deleteSync(recursive: true);
    }
  }

  @override
  String toString() => 'Deleting path (if existed) from $_source';
}
