package;

import openfl.Assets;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class Player extends FlxSprite
{
  public var speed : Int = 200;
  public var state : PlayState;

  public var shootCooldown : Float = 0;

  public function new(_x:Null<Float>, _y:Null<Float>, _state:PlayState)
  {
    super(_x, _y);
    loadGraphic("assets/images/Player.png", false);

    x -= origin.x;
    y -= origin.y;

    state = _state;

    drag.set(speed * 8, speed * 8);
    maxVelocity.set(speed, speed);
    acceleration.y = 0;
    acceleration.x = 0;
  }

  public override function update(elapsed:Float) : Void
  {
    acceleration.x = 0;
    acceleration.y = 0;
    shootCooldown -= elapsed;
    if (shootCooldown < 0)
      shootCooldown = 0;

    if (FlxG.keys.anyPressed(["LEFT", "A"])) {
      acceleration.x -= drag.x;
    }
    if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
      acceleration.x += drag.x;
    }
    if (FlxG.keys.anyPressed(["UP", "W"])) {
      acceleration.y -= drag.y;
    }
    if (FlxG.keys.anyPressed(["DOWN", "S"])) {
      acceleration.y += drag.y;
    }
    if (FlxG.keys.anyPressed(["SPACE"])) {
      if (shootCooldown <= 0) {
        var bullet = state.playerBullets.recycle();
        if (bullet != null) {
          bullet.setPosition(x + origin.x, y + origin.y/2);

          shootCooldown = 0.4;
        }
      }
    }

    super.update(elapsed);
  }
}
