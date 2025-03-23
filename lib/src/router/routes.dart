import 'package:go_router/go_router.dart';
import 'package:dragon_ball/src/models/character.dart';
import 'package:dragon_ball/src/views/character_detail_page.dart';
import 'package:dragon_ball/src/views/home_page.dart';

final router = GoRouter(
  initialLocation: '/characters',
  routes: [
    GoRoute(
      path: '/characters',
      name: 'characters',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: ':characterId',
          name: 'character-detail',
          builder: (context, state) {
            final id = state.pathParameters['characterId'];
            final character = state.extra as Character;
            return CharacterDetailPage(
              id: id!,
              character: character,
            );
          },
        ),
      ],
    ),
  ],
);
