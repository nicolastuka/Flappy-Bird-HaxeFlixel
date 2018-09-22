package entities;

import flixel.FlxSprite;
import flixel.math.FlxPoint;

class ControlPasaTubo extends FlxSprite
{
	
	public function new(pos:FlxPoint):Void
	{
		super(pos.x, pos.y, "assets/images/transparente.png");
		velocity.x = -300;
	}	

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}