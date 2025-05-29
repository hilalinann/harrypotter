import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/spells_provider.dart';

class AllSpellsScreen extends HookConsumerWidget {
  const AllSpellsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spellsAsync = ref.watch(spellsProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFF5ECD6), // Parşömen rengi
      appBar: AppBar(
        backgroundColor: const Color(0xFF740001),
        title: Text(
          'Book of Spells',
          style: GoogleFonts.cinzelDecorative(
            fontSize: 28,
            color: Colors.amber.shade200,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        elevation: 6,
      ),
      body: spellsAsync.when(
        data:
            (spells) => ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              itemCount: spells.length,
              itemBuilder: (context, index) {
                final spell = spells[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF6E3),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.brown.shade300,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          spell.name,
                          style: GoogleFonts.cinzelDecorative(
                            fontSize: 22,
                            color: Colors.brown.shade800,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          spell.description,
                          style: GoogleFonts.medievalSharp(
                            fontSize: 16,
                            color: Colors.brown.shade700,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
