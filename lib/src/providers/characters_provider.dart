import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dragon_ball/src/models/character.dart';

class CharactersProvider with ChangeNotifier {
  final String _baseUrl = 'https://dragonball-api.com/api';
  final List<Character> _characters = [];
  bool _isLoading = false;
  int _currentPage = 1;
  bool _hasMore = true;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> loadCharacters() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse('$_baseUrl/characters?page=$_currentPage&limit=10');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Character> newCharacters = (data['items'] as List)
            .map((item) => Character.fromJson(item))
            .toList();

        _characters.addAll(newCharacters);
        _currentPage++;

        // Verificar si hay más páginas
        _hasMore = data['meta']['currentPage'] < data['meta']['totalPages'];
      } else {
        throw Exception('Failed to load characters: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the API: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshCharacters() async {
    _characters.clear();
    _currentPage = 1;
    _hasMore = true;
    await loadCharacters();
  }

  // Método para filtrar personajes por categoría
  List<Character> filterCharactersByCategory(String category) {
    if (category == 'Todos') {
      return _characters;
    } else {
      return _characters
          .where((character) => character.race == category)
          .toList();
    }
  }
}
