import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/character.dart';
import '../services/api_service.dart';

part 'character_provider.g.dart';

@riverpod
class Characters extends _$Characters {
  @override
  Future<List<Character>> build() async {
    return ref.read(apiServiceProvider).getCharacters();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(apiServiceProvider).getCharacters(),
    );
  }
}
