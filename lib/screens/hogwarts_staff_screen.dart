import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/hogwarts_staff_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HogwartsStaffScreen extends HookConsumerWidget {
  const HogwartsStaffScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffAsync = ref.watch(hogwartsStaffProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Hogwarts Staff')),
      body: staffAsync.when(
        data:
            (staff) => ListView.builder(
              itemCount: staff.length,
              itemBuilder: (context, index) {
                final character = staff[index];
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
