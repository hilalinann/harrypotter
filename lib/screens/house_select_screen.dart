import 'package:flutter/material.dart';
import 'house_characters_screen.dart';

class HouseSelectScreen extends StatelessWidget {
  const HouseSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final houses = ['Gryffindor', 'Slytherin', 'Hufflepuff', 'Ravenclaw'];
    return Scaffold(
      appBar: AppBar(title: const Text('Select a House')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: houses.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final house = houses[index];
          return Material(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HouseCharactersScreen(house: house),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Text(
                  house,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
