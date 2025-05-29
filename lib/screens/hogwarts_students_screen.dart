import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/hogwarts_students_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HogwartsStudentsScreen extends HookConsumerWidget {
  const HogwartsStudentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(hogwartsStudentsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Hogwarts Students')),
      body: studentsAsync.when(
        data:
            (students) => ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final character = students[index];
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
