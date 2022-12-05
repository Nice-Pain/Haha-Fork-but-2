package android.flixel;

import android.flixel.FlxButton;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxDestroyUtil;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.group.FlxSpriteGroup;
import openfl.utils.Assets;
import PlayState;

enum Mode {
	NORMAL;
	BLOCK;
}

/**
 * A zone with 5 or 4 buttons (A hitbox).
 * It's easy to customize the layout.
 *
 * @author: Saw (M.A. Jigsaw) <-- thank you for space button
 */

//Dunno how to do switches
class FlxHitbox extends FlxSpriteGroup
{
        private var NOW:String = 'Arrows';
        private var KYS = 5;

	public var buttonLeft:FlxButton = new FlxButton(0, 0);
	public var buttonDown:FlxButton = new FlxButton(0, 0);
	public var buttonUp:FlxButton = new FlxButton(0, 0);
	public var buttonRight:FlxButton = new FlxButton(0, 0);
	public var buttonSpaceLeft:FlxButton = new FlxButton(0, 0);
        public var buttonSpace:FlxButton = new FlxButton(0, 0);
        public var buttonSpaceRight:FlxButton = new FlxButton(0, 0);

	/**
	 * Create the zone.
	 */

        @:access(PlayState)
	public function new(mode:Mode)
	{
		super();

		switch (mode)
		{
		        default:
                                NOW = 'ARROWS';

		                add(buttonLeft = createHint(0, 0, 'left', 0xFF00FF, mode));
		                add(buttonDown = createHint(FlxG.width / 4, 0, 'down', 0x00FFFF, mode));
		                add(buttonUp = createHint(FlxG.width / 2, 0, 'up', 0x00FF00, mode));
		                add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), 0, 'right', 0xFF0000, mode));

			case NORMAL:
			        NOW = 'ARROWS';

		                add(buttonLeft = createHint(0, 0, 'left', 0xFF00FF, mode));
		                add(buttonDown = createHint(FlxG.width / 4, 0, 'down', 0x00FFFF, mode));
		                add(buttonUp = createHint(FlxG.width / 2, 0, 'up', 0x00FF00, mode));
		                add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), 0, 'right', 0xFF0000, mode));

			case BLOCK:
                                NOW = 'ARROWS';

                               if (ClientPrefs.topBoxes == true)
                               {
                                     add(buttonLeft = createHint(0, Std.int(FlxG.height / 4), 'left', 0xFF00FF, mode));
		                     add(buttonDown = createHint(FlxG.width / 4, Std.int(FlxG.height / 4), 'down', 0x00FFFF, mode));
		                     add(buttonUp = createHint(FlxG.width / 2, Std.int(FlxG.height / 4), 'up', 0x00FF00, mode));
		                     add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), Std.int(FlxG.height / 4), 'right', 0xFF0000, mode));
                               }
                               else
                               {
                                     add(buttonLeft = createHint(0, 0, 'left', 0xFF00FF, mode));
		                     add(buttonDown = createHint(FlxG.width / 4, 0, 'down', 0x00FFFF, mode));
	                             add(buttonUp = createHint(FlxG.width / 2, 0, 'up', 0x00FF00, mode));
		                     add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), 0, 'right', 0xFF0000, mode));
                               }

                               NOW = 'BLOCK';

                               if (ClientPrefs.topBoxes == true)
                               {
                                     add(buttonSpaceLeft = createHint(0, 0, 'block', 0x6DC9E3, mode));
		                     add(buttonSpace = createHint(FlxG.width / 3, 0, 'block', 0x6DC9E3, mode));
		                     add(buttonSpaceRight = createHint((FlxG.width / 3) * 2, 0, 'block', 0x6DC9E3, mode));
                               }
                               else
                               {
                                     add(buttonSpaceLeft = createHint(0, Std.int(FlxG.height / 4) * 3, 'block', 0x6DC9E3, mode));
		                     add(buttonSpace = createHint(FlxG.width / 3, Std.int(FlxG.height / 4) * 3, 'block', 0x6DC9E3, mode));
		                     add(buttonSpaceRight = createHint((FlxG.width / 3) * 2, Std.int(FlxG.height / 4) * 3, 'block', 0x6DC9E3, mode));
                               }
		}
		scrollFactor.set();
	}

	/**
	 * Clean up memory.
	 */
	override function destroy()
	{
		super.destroy();

		buttonLeft = null;
		buttonDown = null;
		buttonUp = null;
		buttonRight = null;
                buttonSpaceLeft = null;
                buttonSpace = null;
                buttonSpaceRight = null;
	}

	private function createHint(X:Float, Y:Float, Graphic:String, Color:Int = 0xFFFFFF, mode:Mode):FlxButton
	{
		var hintTween:FlxTween = null;
		var hint:FlxButton = new FlxButton(X, Y);
    
		switch (mode)
		{
			default:
			        hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox.png'),
			               Assets.getText('assets/android/hitbox.xml'))
			               .getByName(Graphic)));
		                hint.setGraphicSize(Std.int(FlxG.width / 4), FlxG.height);

			case NORMAL:
			            hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox.png'),
			                   Assets.getText('assets/android/hitbox.xml'))
			                   .getByName(Graphic)));
		                    hint.setGraphicSize(Std.int(FlxG.width / 4), FlxG.height);

			case BLOCK:
                                   if (NOW == 'BLOCK')
                                   {
                                          hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/Block.png'),
			                  Assets.getText('assets/android/Block.xml'))
			                  .getByName(Graphic)));
		                           hint.setGraphicSize(Std.int(FlxG.width / 3), Std.int(FlxG.height / 4));
                                   }
                                   if (NOW == 'ARROWS')
                                   {
                                          hint.loadGraphic(FlxGraphic.fromFrame(FlxAtlasFrames.fromSparrow(Assets.getBitmapData('assets/android/hitbox2.png'),
			                  Assets.getText('assets/android/hitbox2.xml'))
			                  .getByName(Graphic)));
		                           hint.setGraphicSize(Std.int(FlxG.width / 4), Std.int(FlxG.height / 4) * 3);
                                   }
		}
		hint.updateHitbox();
		hint.solid = false;
		hint.immovable = true;
		hint.scrollFactor.set();
		hint.color = Color;
		hint.alpha = 0.00001;
		hint.onDown.callback = function()
		{
			if (hintTween != null)
				hintTween.cancel();

			hintTween = FlxTween.tween(hint, {alpha: AndroidControls.getOpacity()}, 0.001, {ease: FlxEase.circInOut, onComplete: function(twn:FlxTween)
			{
				hintTween = null;
			}});
		}
		hint.onUp.callback = function()
		{
			if (hintTween != null)
				hintTween.cancel();

			hintTween = FlxTween.tween(hint, {alpha: 0.00001}, 0.001, {ease: FlxEase.circInOut,	onComplete: function(twn:FlxTween)
			{
				hintTween = null;
			}});
		}
		hint.onOver.callback = hint.onDown.callback;
		hint.onOut.callback = hint.onUp.callback;
		#if FLX_DEBUG
		hint.ignoreDrawDebug = true;
		#end
		return hint;
	}
}
