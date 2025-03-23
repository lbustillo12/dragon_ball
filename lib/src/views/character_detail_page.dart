import 'package:flutter/material.dart';
import 'package:dragon_ball/src/models/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final String id;
  final Character character;

  const CharacterDetailPage({
    super.key,
    required this.id,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del personaje'),
        backgroundColor: Color.fromRGBO(255, 228, 25, 0.922),
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 71, 71, 71),
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del personaje
            Center(
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    character.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Nombre:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold, // Negrita para "Nombre:"
              ),
            ),
            const SizedBox(height: 5),
            Text(
              character.name, // Valor del nombre
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Raza:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold, // Negrita para "Raza:"
              ),
            ),
            const SizedBox(height: 5),
            Text(
              character.race, // Valor de la raza
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Género:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold, // Negrita para "Género:"
              ),
            ),
            const SizedBox(height: 5),
            Text(
              character.gender, // Valor del género
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Afiliación:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold, // Negrita para "Afiliación:"
              ),
            ),
            const SizedBox(height: 5),
            Text(
              character.affiliation, // Valor de la afiliación
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Descripción:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold, // Negrita para "Descripción"
              ),
            ),
            const SizedBox(height: 5),
            Text(
              character.description,
              textAlign: TextAlign.justify, // Alineación justificada
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
