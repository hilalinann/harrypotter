import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../providers/hogwarts_staff_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'character_detail_screen.dart';
import 'character_card.dart';

class HogwartsStaffScreen extends HookConsumerWidget {
  const HogwartsStaffScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffAsync = ref.watch(hogwartsStaffProvider);
    final selectedGender = useState('male');

    return Scaffold(
      appBar: AppBar(title: const Text('Hogwarts Staff')),
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
                              ? Colors.black
                              : Colors.grey.shade300,
                      foregroundColor:
                          selectedGender.value == 'male'
                              ? Colors.amber
                              : Colors.black,
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
                              ? Colors.black
                              : Colors.grey.shade300,
                      foregroundColor:
                          selectedGender.value == 'female'
                              ? Colors.amber
                              : Colors.black,
                    ),
                    onPressed: () => selectedGender.value = 'female',
                    child: const Text('Girls'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: staffAsync.when(
              data: (staff) {
                final filtered =
                    staff
                        .where(
                          (c) => c.gender.toLowerCase() == selectedGender.value,
                        )
                        .toList();
                if (filtered.isEmpty) {
                  return const Center(child: Text('No staff found.'));
                }
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final character = filtered[index];
                    return CharacterCard(
                      character: character,
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
