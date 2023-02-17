import 'package:logger/logger.dart';
import 'package:logging/logging.dart';

class LoggerImpl implements Log {
  final String name;
  late final Logger _logger;

  LoggerImpl({this.name = ''}) {
    _logger = Logger(name);
    _logger.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  @override
  void error(Object? message, [Object? error, StackTrace? stackTrace]) {
    _logger.severe(message, error, stackTrace);
  }

  @override
  void info(Object? message, [Object? error, StackTrace? stackTrace]) {
    _logger.info(message, error, stackTrace);
  }

  @override
  void warning(Object? message, [Object? error, StackTrace? stackTrace]) {
    _logger.warning(message, error, stackTrace);
  }

  @override
  void setLevel(LogLevel level) {
    Level loggingLevel = Level.ALL;
    switch (level) {
      case LogLevel.info:
        loggingLevel = Level.INFO;
        break;
      case LogLevel.warning:
        loggingLevel = Level.WARNING;
        break;
      case LogLevel.error:
        loggingLevel = Level.SEVERE;
        break;
      default:
        loggingLevel = Level.ALL;
    }
    _logger.level = loggingLevel;
  }
}
