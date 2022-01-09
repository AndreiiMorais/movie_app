import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:movieapp/services/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',//meu token é versao 3
        headers: {
          'contente-type': 'application/json;charset=utf-8',
          'authorization': 'Bearer c625bc4b020f4c41753a3544799a9bb7'
        },
      ),
    );
  }
}
