import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/character.dart';
import '../models/spell.dart';

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

  Future<List<Character>> getHogwartsStudents() async {
    try {
      final response = await _dio.get('/characters/students');
      return (response.data as List)
          .map((json) => Character.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch students: ${e.message}');
    }
  }

  Future<List<Character>> getHogwartsStaff() async {
    try {
      final response = await _dio.get('/characters/staff');
      return (response.data as List)
          .map((json) => Character.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch staff: ${e.message}');
    }
  }

  Future<List<Character>> getCharactersInHouse(String house) async {
    try {
      final response = await _dio.get(
        '/characters/house/${house.toLowerCase()}',
      );
      return (response.data as List)
          .map((json) => Character.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch house characters: ${e.message}');
    }
  }

  Future<List<Spell>> getSpells() async {
    try {
      final response = await _dio.get('/spells');
      return (response.data as List)
          .map((json) => Spell.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch spells: ${e.message}');
    }
  }
}

@riverpod
ApiService apiService(ApiServiceRef ref) {
  return ApiService();
}
