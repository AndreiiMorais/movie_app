import 'package:dio/dio.dart';
import 'package:movieapp/services/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/', //meu token é versao 3
        headers: {
          'contente-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjI1YmM0YjAyMGY0YzQxNzUzYTM1NDQ3OTlhOWJiNyIsInN1YiI6IjYxZGEyNmQxNmM4NDkyMDA0MWJhNmNhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kBK_b7CcuOuWcq1DwIqrUOM4yE79XmO7pShfbpZ4o3Q'
        },
      ),
    );
  }
}
