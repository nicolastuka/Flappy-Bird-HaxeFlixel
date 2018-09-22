package entities;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;

class SueloSuperior extends FlxSprite
{

    public function new(px:Int):Void
    {
        super(px, FlxG.height - 40, "assets/images/piso1.png");
        immovable = true;
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        velocity.x = -300;
        if (x < 0 - width)
        {
            x = 390;
        }
    }
}