import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/spell.dart';
import '../services/api_service.dart';

part 'spells_provider.g.dart';

@riverpod
Future<List<Spell>> spells(SpellsRef ref) async {
  return ref.read(apiServiceProvider).getSpells();
}
