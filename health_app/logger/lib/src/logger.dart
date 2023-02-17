import 'package:logger/src/logger_impl.dart';

enum LogLevel {
  all,
  info,
  warning,
  error,
}

abstract class Log {
  void info(Object? message, [Object? error, StackTrace? stackTrace]);
  void warning(Object? message, [Object? error, StackTrace? stackTrace]);
  void error(Object? message, [Object? error, StackTrace? stackTrace]);
  void setLevel(LogLevel level);
}

Map<String, Log> _loggers = <String, Log>{
  '': LoggerImpl(),
};

Log getLogger({String logName = ''}) {
  var logger = _loggers[logName];
  if (logger == null) {
    logger = LoggerImpl(name: logName);
    _loggers[logName] = logger;
  }

  return logger;
}
