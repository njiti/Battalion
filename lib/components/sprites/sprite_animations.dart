import 'package:bonfire/bonfire.dart';
import 'package:battalion/components/globals.dart';


class SpriteAnimations {
  SpriteAnimations._();

  static const _tankIdle = 'tank/idle';
  static const _tankWalk = 'tank/walk';

  static const _tankIdleCount = 8;
  static const _tankWalkCount = 8;

  static Future<SpriteAnimation> get tankIdle async => _spriteAnimation(
      count: _tankIdleCount,
      path: _tankIdle,
  );

  static Future<SpriteAnimation> get tankWalk async => _spriteAnimation(
    count: _tankWalkCount,
    path: _tankWalk,
  );

  static Future<SpriteAnimation> _spriteAnimation ({
    required int count,
    required String path,
})async{
    final sprites = <Sprite>[];
    for (int i = 0; i < count; i++){
      final sprite = await Sprite.load('$path/$i.png');
      sprites.add(sprite);
    }
    return SpriteAnimation.spriteList(sprites, stepTime: Globals.spriteStepTime);
  }
}