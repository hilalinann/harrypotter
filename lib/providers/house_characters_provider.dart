import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/character.dart';
import '../services/api_service.dart';

part 'house_characters_provider.g.dart';

@riverpod
Future<List<Character>> houseCharacters(
  HouseCharactersRef ref,
  String house,
) async {
  return ref.read(apiServiceProvider).getCharactersInHouse(house);
}
