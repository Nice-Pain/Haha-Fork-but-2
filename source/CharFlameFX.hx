package;

import flixel.FlxSprite;
import Boyfriend;

using StringTools;

class BF
{
     var Heat = new FlxSprite(0, 0);
     Heat.loadGraphic(Paths.image('BFHeat'));
     Heat.animation.addByPrefix('idle', 'BF Flame Idle', 24);
     Heat.animation.addByPrefix('singLEFT', 'BF Flame Sing Left0', 24);
     Heat.animation.addByPrefix('singDOWN', 'BF Flame Sing Down0', 24);
     Heat.animation.addByPrefix('singUP', 'BF Flame Sing Up0', 24);
     Heat.animation.addByPrefix('singRIGHT', 'BF Flame Sing Right0', 24);
     Heat.animation.addByPrefix('XD', 'BF Flame Sing Up XD', 24);

     Heat.animation.addByPrefix('Hit', 'BF Flame hit0', 24);
     Heat.animation.addByPrefix('Hit Crit', 'BF Flame hit 0', 24);
     Heat.animation.addByPrefix('click', 'BF Flame Click', 24);
     Heat.animation.addByPrefix('Powerup v2', 'BF Flame Heated Powerup0', 24);

     function update()
     {
         if (contains(Boyfriend.animation.curAnim.name, MISS))
         {
             remove(Heat);
         }
         else
         {
             Heat.animation.curAnim.curFrame = Boyfriend.animation.curAnim.curFrame;
         }
     }

     public static function new(X:Float, Y:Float)
     {
         add(Heat);
         Heat.x = X;
         Heat.y = Y;
     }

     public static function removes()
     {
         remove(Heat);
     }
}
