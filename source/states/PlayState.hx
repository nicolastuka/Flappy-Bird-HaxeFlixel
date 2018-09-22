package states;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import entities.Bird;
import entities.SueloInferior;
import entities.SueloSuperior;
import entities.TuboInferior;
import entities.TuboSuperior;
import entities.ControlPasaTubo;
import Estaticas;

class PlayState extends FlxState
{

	private var sueloInferior:FlxTypedGroup<SueloInferior>;
	private var sueloSuperior:FlxTypedGroup<SueloSuperior>;
	private var player:Bird;
	private var tubosSuperiores:FlxTypedGroup<TuboSuperior>;
	private var tubosInferiores:FlxTypedGroup<TuboInferior>;
	private var gruposPase:FlxTypedGroup<ControlPasaTubo>;
	private var txtScore:FlxText;

	override public function create():Void
	{
		super.create();
		player = new Bird();
		txtScore = new FlxText(0, 0, FlxG.width, "Score: " + Estaticas.tubosPasados, 20, true);
		txtScore.color = FlxColor.WHITE;
		CrearSuelo();
		CrearListasTubos();
		add(new FlxSprite(0, 0, "assets/images/fondo.png"));
		add(tubosSuperiores);
		add(tubosInferiores);
		add(gruposPase);
		add(sueloInferior);
		add(sueloSuperior);
		add(txtScore);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		ControlColsiones();
		ControlTubos();
		txtScore.text = "Score: " + Estaticas.tubosPasados;
	}

	private function CrearListasTubos():Void
	{
		if (tubosSuperiores == null && tubosInferiores == null && gruposPase == null)
		{
			tubosSuperiores = new FlxTypedGroup<TuboSuperior>();
			tubosInferiores = new FlxTypedGroup<TuboInferior>();
			gruposPase = new FlxTypedGroup<ControlPasaTubo>();
			tubosSuperiores.add(new TuboSuperior(new FlxPoint(400, -150)));
			tubosInferiores.add(new TuboInferior(new FlxPoint(400, 400)));
			tubosSuperiores.add(new TuboSuperior(new FlxPoint(650, -250)));
			tubosInferiores.add(new TuboInferior(new FlxPoint(650, 300)));
			gruposPase.add(new ControlPasaTubo(new FlxPoint(435, 0)));
			gruposPase.add(new ControlPasaTubo(new FlxPoint(685, 0)));
		}
	}

	private function ControlColsiones():Void
	{
		if (FlxG.collide(player, sueloSuperior) || (FlxG.collide(player, tubosSuperiores)) || (FlxG.collide(player, tubosInferiores)))
		{
			if (Estaticas.tubosPasados > Estaticas.mejorPuntaje)
			{
				Estaticas.mejorPuntaje = Estaticas.tubosPasados;
			}
			FlxG.switchState(new MainState());
		}
		FlxG.overlap(player, gruposPase, ControlPuntuacion);
	}

	private function ControlPuntuacion(elPalyer:Bird, elPase:ControlPasaTubo):Void
	{
		elPase.kill();
		Estaticas.tubosPasados++;
	}

	private function CrearSuelo():Void
	{
		sueloInferior = new FlxTypedGroup<SueloInferior>();
		sueloSuperior = new FlxTypedGroup<SueloSuperior>();
		sueloInferior.add(new SueloInferior(0));
		sueloInferior.add(new SueloInferior(400));
		sueloSuperior.add(new SueloSuperior(0));
		sueloSuperior.add(new SueloSuperior(400));
	}

	private function ControlTubos():Void
	{
		for (ts in 0...tubosSuperiores.length)
		{
			if (tubosSuperiores.members[ts].x <= 0 - tubosSuperiores.members[ts].width)
			{
				tubosSuperiores.members[ts].x = 400;
				tubosInferiores.members[ts].x = 400;
				tubosSuperiores.members[ts].y = FlxG.random.int(-300, -100);
				tubosInferiores.members[ts].y = tubosSuperiores.members[ts].y + tubosSuperiores.members[ts].height + 200;
				gruposPase.add(new ControlPasaTubo(new FlxPoint(435, 0)));
			}
		}
	}

}
