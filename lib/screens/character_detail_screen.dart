import 'package:flutter/material.dart';
import '../models/character.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: CachedNetworkImageProvider(
                        character.image,
                      ),
                      onBackgroundImageError: (_, __) {},
                      child:
                          character.image.isEmpty
                              ? const Icon(Icons.person, size: 60)
                              : null,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      character.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (character.house.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Chip(
                          label: Text(character.house),
                          backgroundColor: Colors.deepPurple.shade50,
                        ),
                      ),
                    if (character.actor.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Played by: ${character.actor}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (character.alternateNames.isNotEmpty)
              _InfoSection(
                icon: Icons.alternate_email,
                title: 'Alternate Names',
                content: character.alternateNames.join(", "),
              ),
            _InfoSection(
              icon: Icons.category,
              title: 'Species',
              content: character.species,
            ),
            _InfoSection(
              icon: Icons.person,
              title: 'Gender',
              content: character.gender,
            ),
            if (character.dateOfBirth != null &&
                character.dateOfBirth!.isNotEmpty)
              _InfoSection(
                icon: Icons.cake,
                title: 'Date of Birth',
                content: character.dateOfBirth!,
              ),
            if (character.yearOfBirth != null)
              _InfoSection(
                icon: Icons.calendar_today,
                title: 'Year of Birth',
                content: character.yearOfBirth.toString(),
              ),
            _InfoSection(
              icon: Icons.auto_fix_high,
              title: 'Wizard',
              content: character.wizard ? 'Yes' : 'No',
            ),
            if (character.ancestry.isNotEmpty)
              _InfoSection(
                icon: Icons.family_restroom,
                title: 'Ancestry',
                content: character.ancestry,
              ),
            if (character.eyeColour.isNotEmpty)
              _InfoSection(
                icon: Icons.remove_red_eye,
                title: 'Eye Colour',
                content: character.eyeColour,
              ),
            if (character.hairColour.isNotEmpty)
              _InfoSection(
                icon: Icons.face,
                title: 'Hair Colour',
                content: character.hairColour,
              ),
            _WandSection(wand: character.wand),
            if (character.patronus.isNotEmpty)
              _InfoSection(
                icon: Icons.shield,
                title: 'Patronus',
                content: character.patronus,
              ),
            _InfoSection(
              icon: Icons.school,
              title: 'Hogwarts Student',
              content: character.hogwartsStudent ? 'Yes' : 'No',
            ),
            _InfoSection(
              icon: Icons.work,
              title: 'Hogwarts Staff',
              content: character.hogwartsStaff ? 'Yes' : 'No',
            ),
            if (character.alternateActors.isNotEmpty)
              _InfoSection(
                icon: Icons.people,
                title: 'Alternate Actors',
                content: character.alternateActors.join(", "),
              ),
            _InfoSection(
              icon: Icons.favorite,
              title: 'Alive',
              content: character.alive ? 'Yes' : 'No',
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  const _InfoSection({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.deepPurple, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(content, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WandSection extends StatelessWidget {
  final Wand wand;
  const _WandSection({required this.wand});

  @override
  Widget build(BuildContext context) {
    if (wand.wood.isEmpty && wand.core.isEmpty && wand.length == null) {
      return const SizedBox.shrink();
    }
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.deepPurple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.auto_fix_high, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text('Wand', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 6),
            if (wand.wood.isNotEmpty)
              Text('Wood: ${wand.wood}', style: const TextStyle(fontSize: 16)),
            if (wand.core.isNotEmpty)
              Text('Core: ${wand.core}', style: const TextStyle(fontSize: 16)),
            if (wand.length != null)
              Text(
                'Length: ${wand.length}',
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
