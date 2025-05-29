// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Spell _$SpellFromJson(Map<String, dynamic> json) {
  return _Spell.fromJson(json);
}

/// @nodoc
mixin _$Spell {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Spell to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpellCopyWith<Spell> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpellCopyWith<$Res> {
  factory $SpellCopyWith(Spell value, $Res Function(Spell) then) =
      _$SpellCopyWithImpl<$Res, Spell>;
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class _$SpellCopyWithImpl<$Res, $Val extends Spell>
    implements $SpellCopyWith<$Res> {
  _$SpellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? description = null}) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpellImplCopyWith<$Res> implements $SpellCopyWith<$Res> {
  factory _$$SpellImplCopyWith(
    _$SpellImpl value,
    $Res Function(_$SpellImpl) then,
  ) = __$$SpellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class __$$SpellImplCopyWithImpl<$Res>
    extends _$SpellCopyWithImpl<$Res, _$SpellImpl>
    implements _$$SpellImplCopyWith<$Res> {
  __$$SpellImplCopyWithImpl(
    _$SpellImpl _value,
    $Res Function(_$SpellImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? description = null}) {
    return _then(
      _$SpellImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpellImpl implements _Spell {
  const _$SpellImpl({required this.name, required this.description});

  factory _$SpellImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpellImplFromJson(json);

  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'Spell(name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpellImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpellImplCopyWith<_$SpellImpl> get copyWith =>
      __$$SpellImplCopyWithImpl<_$SpellImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpellImplToJson(this);
  }
}

abstract class _Spell implements Spell {
  const factory _Spell({
    required final String name,
    required final String description,
  }) = _$SpellImpl;

  factory _Spell.fromJson(Map<String, dynamic> json) = _$SpellImpl.fromJson;

  @override
  String get name;
  @override
  String get description;

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpellImplCopyWith<_$SpellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
