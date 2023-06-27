import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:tmdb/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NGUzMmVlZWI0Zjk0ODM5ZDI5NGI2MGQxOGQxMGFjZiIsInN1YiI6IjVhYjJmNWY0YzNhMzY4NjNkOTAwMTRhMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UUykQ_5b43OZS8GmxOi9x0Xzj00FjTTzln2HJ7KeLMw',
        },
      ),
    );
  }
}
