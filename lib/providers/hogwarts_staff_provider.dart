import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/character.dart';
import '../services/api_service.dart';

part 'hogwarts_staff_provider.g.dart';

@riverpod
Future<List<Character>> hogwartsStaff(HogwartsStaffRef ref) async {
  return ref.read(apiServiceProvider).getHogwartsStaff();
}
