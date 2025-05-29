import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../providers/character_provider.dart';

class CharacterListScreen extends HookConsumerWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(charactersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter Characters'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: charactersAsync.when(
        data:
            (characters) => RefreshIndicator(
              onRefresh: () => ref.read(charactersProvider.notifier).refresh(),
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
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
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // TODO: Implement character detail screen
                      },
                    ),
                  );
                },
              ),
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${error.toString()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.refresh(charactersProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
