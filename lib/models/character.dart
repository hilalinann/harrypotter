import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required String id,
    required String name,
    required List<String> alternateNames,
    required String species,
    required String gender,
    required String house,
    required String? dateOfBirth,
    required int? yearOfBirth,
    required bool wizard,
    required String ancestry,
    required String eyeColour,
    required String hairColour,
    required Wand wand,
    required String patronus,
    required bool hogwartsStudent,
    required bool hogwartsStaff,
    required String actor,
    required List<String> alternateActors,
    required bool alive,
    required String image,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@freezed
class Wand with _$Wand {
  const factory Wand({
    required String wood,
    required String core,
    required double? length,
  }) = _Wand;

  factory Wand.fromJson(Map<String, dynamic> json) => _$WandFromJson(json);
}
