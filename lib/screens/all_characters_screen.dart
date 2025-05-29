import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/character_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AllCharactersScreen extends HookConsumerWidget {
  const AllCharactersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(charactersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('All Characters')),
      body: charactersAsync.when(
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
