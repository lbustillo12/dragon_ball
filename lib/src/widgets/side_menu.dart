import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final PageController pageController; // Recibe el PageController

  const SideMenu({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 228, 25, 0.922),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 61, 61, 61),
                    child: Text(
                      'L',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(255, 228, 25, 0.922)),
                    )),
                SizedBox(height: 10),
                Text(
                  'Lizy Bustillo',
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 61, 61),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'lizy.bustillo@unah.hn',
                  style: TextStyle(
                    color: Color.fromARGB(179, 76, 76, 76),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              pageController.jumpToPage(0); // Navegar a la página de personajes
              Navigator.pop(context); // Cerrar el menú
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favoritos'),
            onTap: () {
              pageController.jumpToPage(1); // Navegar a la página de favoritos
              Navigator.pop(context); // Cerrar el menú
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              pageController.jumpToPage(2); // Navegar a la página de perfil
              Navigator.pop(context); // Cerrar el menú
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              // Navegar a la página de configuración (si la tienes)
            },
          ),
        ],
      ),
    );
  }
}
