import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;
  const CharacterCard({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        color: const Color(0xFF232323),
        elevation: 4,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(character.image),
              onBackgroundImageError: (_, __) {},
              child: character.image.isEmpty ? const Icon(Icons.person) : null,
            ),
            title: Text(
              character.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              character.house,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
