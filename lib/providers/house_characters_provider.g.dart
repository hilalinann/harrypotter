// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_characters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$houseCharactersHash() => r'dc9cc1a645fc80aa6c6565a5dd878be3fb09b1ee';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [houseCharacters].
@ProviderFor(houseCharacters)
const houseCharactersProvider = HouseCharactersFamily();

/// See also [houseCharacters].
class HouseCharactersFamily extends Family<AsyncValue<List<Character>>> {
  /// See also [houseCharacters].
  const HouseCharactersFamily();

  /// See also [houseCharacters].
  HouseCharactersProvider call(String house) {
    return HouseCharactersProvider(house);
  }

  @override
  HouseCharactersProvider getProviderOverride(
    covariant HouseCharactersProvider provider,
  ) {
    return call(provider.house);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'houseCharactersProvider';
}

/// See also [houseCharacters].
class HouseCharactersProvider
    extends AutoDisposeFutureProvider<List<Character>> {
  /// See also [houseCharacters].
  HouseCharactersProvider(String house)
    : this._internal(
        (ref) => houseCharacters(ref as HouseCharactersRef, house),
        from: houseCharactersProvider,
        name: r'houseCharactersProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$houseCharactersHash,
        dependencies: HouseCharactersFamily._dependencies,
        allTransitiveDependencies:
            HouseCharactersFamily._allTransitiveDependencies,
        house: house,
      );

  HouseCharactersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.house,
  }) : super.internal();

  final String house;

  @override
  Override overrideWith(
    FutureOr<List<Character>> Function(HouseCharactersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HouseCharactersProvider._internal(
        (ref) => create(ref as HouseCharactersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        house: house,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Character>> createElement() {
    return _HouseCharactersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HouseCharactersProvider && other.house == house;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, house.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HouseCharactersRef on AutoDisposeFutureProviderRef<List<Character>> {
  /// The parameter `house` of this provider.
  String get house;
}

class _HouseCharactersProviderElement
    extends AutoDisposeFutureProviderElement<List<Character>>
    with HouseCharactersRef {
  _HouseCharactersProviderElement(super.provider);

  @override
  String get house => (origin as HouseCharactersProvider).house;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
