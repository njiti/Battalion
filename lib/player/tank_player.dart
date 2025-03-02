import 'package:bonfire/bonfire.dart';
import '../components/globals.dart';
import '../components/sprites/sprite_animations.dart';

class PlayerTank extends SimplePlayer {
  static const _size = Globals.tileSize * 1.5;

  PlayerTank({required super.position})
      : super(
    size: Vector2.all(_size),
    animation: SimpleDirectionAnimation(
        idleRight: SpriteAnimations.tankIdle,
        runRight: SpriteAnimations.tankWalk,
    ),
  );
}