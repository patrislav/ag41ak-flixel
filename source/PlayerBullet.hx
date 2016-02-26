package;

import openfl.Assets;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
using flixel.util.FlxSpriteUtil;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayerBullet extends FlxSprite
{
  private static inline var RADIUS:Int = 5;
  private static inline var SPEED:Int = 400;
  private var state : PlayState;

  public function new(_state:PlayState)
  {
    super(0, 0);
    state = _state;

    velocity.y = -SPEED;

    this.makeGraphic(RADIUS*2, RADIUS*2, FlxColor.TRANSPARENT);
    this.drawCircle(RADIUS, RADIUS, RADIUS, FlxColor.WHITE);
  }

  public override function setPosition(_x:Float = 0, _y:Float = 0) {
    super.setPosition(_x-RADIUS, _y-RADIUS);
  }

  override public function update(elapsed:Float):Void
  {
    super.update(elapsed);

    if (!isOnScreen())
      this.kill();
  }


}
