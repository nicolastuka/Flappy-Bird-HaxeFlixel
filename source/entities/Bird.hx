package entities;

import flixel.FlxSprite;
import flixel.FlxG;

class Bird extends FlxSprite
{

    private var sentAngle:Int;
    
    public function new():Void
    {
        super(50, 0, "assets/images/Bird.png");
        loadGraphic("assets/images/Bird.png", true, 33, 19);
        animation.add("fly", [0, 1], 8, true);
        animation.play("fly");
        y = FlxG.height / 2;
        sentAngle = 1;
        velocity.set(0, 300);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        angle += sentAngle;
        if (FlxG.mouse.justPressed)
        {
            angle = 0;
            angle = -15;
            velocity.set(0, -700);
        }
        #if neko
        if (FlxG.mouse.justReleased)
        {
            velocity.set(0, 300);
        }
        #else
        for (touch in FlxG.touches.list)
        {
            if (touch.justPressed)
            {
                velocity.set(0, 300);
            }
        }
        #end
    }
}