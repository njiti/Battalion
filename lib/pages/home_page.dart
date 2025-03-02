import 'package:battalion/player/tank_player.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/globals.dart';

class HomePage extends StatefulWidget {
  static bool useJoystick = true;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cameraConfig = CameraConfig(
    initialMapZoomFit: InitialMapZoomFitEnum.none,
    moveOnlyMapArea: true,
    movementWindow: Vector2(50, 50),
    speed: 0.2,
    zoom: 1.0,
    startFollowPlayer: true,
  );
  @override
  Widget build(BuildContext context) {
    PlayerController joystick = Joystick(
      directional: JoystickDirectional(
        spriteBackgroundDirectional: Sprite.load('joystick_background.png'),
        spriteKnobDirectional: Sprite.load('joystick_knob.png'),
        size: 100,
        isFixed: false,
      ),
      actions: [
        JoystickAction(
          actionId: 1,
          sprite: Sprite.load('joystick_atack_range.png'),
          spritePressed: Sprite.load('joystick_atack_range_selected.png'),
          size: 50,
          margin: EdgeInsets.only(bottom: 50, right: 50),
        ),
      ],
    );
    if (!HomePage.useJoystick) {
      joystick = Keyboard(
        config: KeyboardConfig(
          directionalKeys: [KeyboardDirectionalKeys.arrows()],
          acceptedKeys: [LogicalKeyboardKey.space, LogicalKeyboardKey.keyZ],
        ),
      );
    }
    return Material(
      color: Colors.transparent,
      child: BonfireWidget(
        cameraConfig: _cameraConfig,
        playerControllers: [joystick],
        player: PlayerTank(position: Vector2.all(5)),
        map: WorldMapBySpritefusion(
          WorldMapReader.fromAsset(Globals.map),
        ),
      ),
    );
  }
}
