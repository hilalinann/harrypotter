import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/house_characters_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HouseCharactersScreen extends HookConsumerWidget {
  final String house;
  const HouseCharactersScreen({super.key, required this.house});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseCharactersAsync = ref.watch(houseCharactersProvider(house));
    return Scaffold(
      appBar: AppBar(title: Text('$house Characters')),
      body: houseCharactersAsync.when(
        data:
            (characters) => ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      character.image,
                    ),
                    onBackgroundImageError: (_, __) {},
                    child:
                        character.image.isEmpty
                            ? const Icon(Icons.person)
                            : null,
                  ),
                  title: Text(character.name),
                  subtitle: Text(character.house),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
