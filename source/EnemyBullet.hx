package;

import openfl.Assets;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
using flixel.util.FlxSpriteUtil;
import flixel.FlxState;
import flixel.util.FlxColor;

class EnemyBullet extends FlxSprite
{
  private static inline var RADIUS:Int = 5;
  private var state : PlayState;

  public function new(_state:PlayState)
  {
    super(0, 0);
    state = _state;

    this.makeGraphic(RADIUS*2, RADIUS*2, FlxColor.TRANSPARENT);
    this.drawCircle(RADIUS, RADIUS, RADIUS, FlxColor.WHITE);
  }

  override public function update(elapsed:Float):Void
  {
    super.update(elapsed);

    if (!isOnScreen())
      this.kill();
  }


}
