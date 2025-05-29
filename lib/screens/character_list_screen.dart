import 'package:flutter/material.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter'),
        backgroundColor: const Color(0xFF740001),
        foregroundColor: Colors.amber,
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        children: [
          _MenuButton(
            title: 'All Characters',
            onTap: () {
              Navigator.pushNamed(context, '/all-characters');
            },
          ),
          const SizedBox(height: 16),
          _MenuButton(
            title: 'Hogwarts Students',
            onTap: () {
              Navigator.pushNamed(context, '/hogwarts-students');
            },
          ),
          const SizedBox(height: 16),
          _MenuButton(
            title: 'Hogwarts Staff',
            onTap: () {
              Navigator.pushNamed(context, '/hogwarts-staff');
            },
          ),
          const SizedBox(height: 16),
          _MenuButton(
            title: 'Characters in a House',
            onTap: () {
              Navigator.pushNamed(context, '/house-select');
            },
          ),
          const SizedBox(height: 16),
          _MenuButton(
            title: 'All Spells',
            onTap: () {
              Navigator.pushNamed(context, '/all-spells');
            },
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _MenuButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
