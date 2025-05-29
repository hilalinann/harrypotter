import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/character.dart';
import '../services/api_service.dart';

part 'hogwarts_students_provider.g.dart';

@riverpod
Future<List<Character>> hogwartsStudents(HogwartsStudentsRef ref) async {
  return ref.read(apiServiceProvider).getHogwartsStudents();
}
