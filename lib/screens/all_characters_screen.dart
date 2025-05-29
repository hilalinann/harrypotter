import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../providers/character_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'character_detail_screen.dart';

class AllCharactersScreen extends HookConsumerWidget {
  const AllCharactersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(charactersProvider);
    final selectedGender = useState('male');

    return Scaffold(
      appBar: AppBar(title: const Text('All Characters')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedGender.value == 'male'
                              ? Colors.deepPurple
                              : Colors.deepPurple.shade50,
                      foregroundColor:
                          selectedGender.value == 'male'
                              ? Colors.white
                              : Colors.deepPurple,
                    ),
                    onPressed: () => selectedGender.value = 'male',
                    child: const Text('Boys'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedGender.value == 'female'
                              ? Colors.deepPurple
                              : Colors.deepPurple.shade50,
                      foregroundColor:
                          selectedGender.value == 'female'
                              ? Colors.white
                              : Colors.deepPurple,
                    ),
                    onPressed: () => selectedGender.value = 'female',
                    child: const Text('Girls'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: charactersAsync.when(
              data: (characters) {
                final filtered =
                    characters
                        .where(
                          (c) => c.gender.toLowerCase() == selectedGender.value,
                        )
                        .toList();
                if (filtered.isEmpty) {
                  return const Center(child: Text('No characters found.'));
                }
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final character = filtered[index];
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    CharacterDetailScreen(character: character),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (error, stackTrace) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
