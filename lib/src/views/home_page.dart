import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:dragon_ball/src/models/character.dart';
import 'package:dragon_ball/src/widgets/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0; // Índice de la categoría seleccionada
  int _currentIndex = 0; // Índice de la página actual
  final PageController _pageController = PageController();

  // Lista de categorías para filtrar
  final List<String> _categories = [
    'Todos',
    'Saiyan',
    'Namekian',
    'Human',
    'Frieza Race',
    'Android',
  ];

  // Lista de personajes
  final List<Character> characters = [
    Character(
      id: 1,
      name: 'Goku',
      race: 'Saiyan',
      image: 'https://dragonball-api.com/characters/goku_normal.webp',
      gender: 'Male',
      affiliation: 'Z Fighter',
      description:
          'El protagonista de la serie, conocido por su gran poder y personalidad amigable.',
    ),
    Character(
      id: 2,
      name: 'Vegeta',
      race: 'Saiyan',
      image: 'https://dragonball-api.com/characters/vegeta_normal.webp',
      gender: 'Male',
      affiliation: 'Z Fighter',
      description:
          'Príncipe de los Saiyans, inicialmente un villano, pero luego se une a los Z Fighters.',
    ),
    Character(
      id: 3,
      name: 'Piccolo',
      race: 'Namekian',
      image: 'https://dragonball-api.com/characters/picolo_normal.webp',
      gender: 'Male',
      affiliation: 'Z Fighter',
      description:
          'Es un namekiano que surgió tras ser creado en los últimos momentos de vida de su padre.',
    ),
    Character(
      id: 4,
      name: 'Bulma',
      race: 'Human',
      image: 'https://dragonball-api.com/characters/bulma.webp',
      gender: 'Female',
      affiliation: 'Z Fighter',
      description:
          'Bulma es la protagonista femenina de la serie manga Dragon Ball y sus adaptaciones al anime.',
    ),
    Character(
      id: 5,
      name: 'Freezer',
      race: 'Frieza Race',
      image: 'https://dragonball-api.com/characters/Freezer.webp',
      gender: 'Male',
      affiliation: 'Army of Frieza',
      description:
          'Freezer es el tirano espacial y el principal antagonista de la saga de Freezer.',
    ),
    Character(
      id: 6,
      name: 'Zarbon',
      race: 'Frieza Race',
      image: 'https://dragonball-api.com/characters/zarbon.webp',
      gender: 'Male',
      affiliation: 'Army of Frieza',
      description:
          'Zarbon es uno de los secuaces de Freezer y un luchador poderoso.',
    ),
    Character(
      id: 7,
      name: 'Dodoria ',
      race: 'Frieza Race',
      image: 'https://dragonball-api.com/characters/dodoria.webp',
      gender: 'Male',
      affiliation: 'Army of Frieza',
      description:
          'Dodoria es otro secuaz de Freezer conocido por su brutalidad.',
    ),
    Character(
      id: 8,
      name: 'Ginyu',
      race: 'Frieza Race',
      image: 'https://dragonball-api.com/characters/ginyu.webp',
      gender: 'Male',
      affiliation: 'Army of Frieza',
      description:
          'Ginyu es el líder del la élite de mercenarios de mayor prestigio del Ejército de Freeza.',
    ),
    Character(
      id: 9,
      name: 'Celula',
      race: 'Android',
      image: 'https://dragonball-api.com/characters/celula.webp',
      gender: 'Male',
      affiliation: 'Freelancer',
      description:
          'Cell conocido como Célula en España, es un bioandroide creado por la computadora del Dr. Gero.',
    ),
    Character(
      id: 10,
      name: 'Gohan',
      race: 'Saiyan',
      image: 'https://dragonball-api.com/characters/gohan.webp',
      gender: 'Male',
      affiliation: 'Z Fighter',
      description:
          'Son Gohanda en su tiempo en España, o simplemente Gohan en Hispanoamérica, es uno de los personajes principales.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 46, 46, 46),
        ),
        title: const Text('Dragon Ball App'),
        backgroundColor: Color.fromRGBO(255, 228, 25, 0.922),
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 71, 71, 71),
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawer:
          SideMenu(pageController: _pageController), // Pasa el PageController
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildPersonajesPage(), // Página de personajes
          _buildFavoritesPage(), // Página de favoritos
          _buildProfilePage(), // Página de perfil
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        selectedItemColor: Color.fromARGB(255, 71, 71, 71),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  // Página de personajes
  Widget _buildPersonajesPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),

          // Lista horizontal de categorías
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(_categories[index]),
                    selected: _selectedCategoryIndex == index,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    selectedColor: Color.fromRGBO(255, 228, 25, 0.922),
                    labelStyle: TextStyle(
                      color: _selectedCategoryIndex == index
                          ? const Color.fromARGB(255, 60, 59, 59)
                          : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),

          // Lista de personajes en formato de cuadrícula
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: _filtrarPersonajesPorCategoria().length,
              itemBuilder: (context, index) {
                final character = _filtrarPersonajesPorCategoria()[index];
                return ItemGrid(character: character);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Método para filtrar personajes por categoría
  List<Character> _filtrarPersonajesPorCategoria() {
    if (_selectedCategoryIndex == 0) {
      return characters;
    } else {
      final categoriaSeleccionada = _categories[_selectedCategoryIndex];
      return characters
          .where((character) => character.race == categoriaSeleccionada)
          .toList();
    }
  }

  // Página de favoritos
  Widget _buildFavoritesPage() {
    return Container(
      color: const Color.fromARGB(255, 250, 250, 250),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mis Personajes Favoritos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 71, 71, 71),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: character.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      character.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      character.race,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: const Icon(Icons.favorite, color: Colors.red),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Página de perfil
  Widget _buildProfilePage() {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromRGBO(255, 228, 25, 0.922),
                child: Text(
                  'L',
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 71, 71, 71)),
                )),
            SizedBox(height: 20),
            Text(
              'Lizy Bustillo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 71, 71, 71),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'lizy.bustillo@unah.hn',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 87, 87, 87),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Editar Perfil',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget de personajes en formato de cuadrícula
class ItemGrid extends StatelessWidget {
  final Character character;

  const ItemGrid({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Sombra
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          context.goNamed(
            'character-detail',
            pathParameters: {'characterId': character.id.toString()},
            extra: character,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del personaje
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: character.image,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            // Nombre del personaje
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                character.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Raza del personaje
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                character.race,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
