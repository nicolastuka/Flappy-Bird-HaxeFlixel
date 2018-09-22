package states;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import Estaticas;

class MainState extends FlxState
{
	private var txtPlayGame:FlxText;
	private var txtScore:FlxText;
	private var txtBestScore:FlxText;
	private var background:FlxSprite;

	override public function create():Void
	{
		super.create();
		background = new FlxSprite(0, 0, "assets/images/fondo.png");
		SetTexts();
		add(background);
		add(txtPlayGame);
		if (Estaticas.mejorPuntaje != 0)
		{
			add(txtScore);
		}
		if (Estaticas.mejorPuntaje != 0)
		{
			add(txtBestScore);
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		#if neko
		if (FlxG.mouse.justPressed)
		{
			Estaticas.tubosPasados = 0;
			FlxG.switchState(new states.PlayState());
		}
		#else
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				Estaticas.tubosPasados = 0;
				FlxG.switchState(new states.PlayState());
			}
		}
		#end
	}

	private function SetTexts():Void
	{
		txtPlayGame = new FlxText(0, FlxG.height * .2, FlxG.width, "Touch 2 Play Game!", 20,true);
		txtPlayGame.color = FlxColor.GREEN;
		txtPlayGame.alignment = CENTER;
		txtScore = new FlxText(0, FlxG.height * .6, FlxG.width, "Score: " + Estaticas.tubosPasados, 20,true);
		txtScore.color = FlxColor.WHITE;
		txtScore.alignment = CENTER;
		txtBestScore = new FlxText(0, FlxG.height * .8, FlxG.width, "Best Score: " + Estaticas.mejorPuntaje, 20,true);
		txtBestScore.color = FlxColor.RED;
		txtBestScore.alignment = CENTER;
	}

}
