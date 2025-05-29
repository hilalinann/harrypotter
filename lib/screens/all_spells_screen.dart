import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/spells_provider.dart';

class AllSpellsScreen extends HookConsumerWidget {
  const AllSpellsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spellsAsync = ref.watch(spellsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('All Spells')),
      body: spellsAsync.when(
        data:
            (spells) => ListView.builder(
              itemCount: spells.length,
              itemBuilder: (context, index) {
                final spell = spells[index];
                return ListTile(
                  title: Text(spell.name),
                  subtitle: Text(spell.description),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
