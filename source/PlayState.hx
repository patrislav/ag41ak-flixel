package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
	private var player : Player;

	public var playerBullets : FlxTypedGroup<PlayerBullet> = new FlxTypedGroup<PlayerBullet>(15);
	public var enemyBullets : FlxTypedGroup<EnemyBullet> = new FlxTypedGroup<EnemyBullet>(100);

	override public function create():Void
	{
		super.create();

		bgColor = 0xDB7937;

		player = new Player(FlxG.width/2, FlxG.height - 100, this);
		add(player);

		for (i in 0...15) {
			var bullet = new PlayerBullet(this);
			bullet.kill();
			playerBullets.add(bullet);
		}
		add(playerBullets);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
