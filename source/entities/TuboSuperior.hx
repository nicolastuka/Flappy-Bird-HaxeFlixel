package entities;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.FlxG;

class TuboSuperior extends FlxSprite
{

    public function new(pos:FlxPoint):Void
    {
        super(pos.x, pos.y, "assets/images/tubo1.png");
        immovable = true;
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        velocity.x = -300;
    }
}