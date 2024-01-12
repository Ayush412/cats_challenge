import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class Module {
  @lazySingleton
  Logger get logger =>
      Logger(printer: PrettyPrinter(lineLength: 80, methodCount: 1));

  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://catfact.ninja/',
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      );
}
