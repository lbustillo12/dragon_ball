import 'package:flutter/material.dart';
import 'package:dragon_ball/src/models/character.dart';

class ItemList extends StatelessWidget {
  final Character character;

  const ItemList({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(character.image),
        title: Text(character.name),
        subtitle: Text(character.race),
        onTap: () {});
  }
}
