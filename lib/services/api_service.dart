import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/character.dart';

part 'api_service.g.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'https://hp-api.onrender.com/api';

  ApiService() : _dio = Dio() {
    _dio.options.baseUrl = _baseUrl;
  }

  Future<List<Character>> getCharacters() async {
    try {
      final response = await _dio.get('/characters');
      return (response.data as List)
          .map((json) => Character.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch characters: ${e.message}');
    }
  }
}

@riverpod
ApiService apiService(ApiServiceRef ref) {
  return ApiService();
}
