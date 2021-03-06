﻿package model {

	import starling.core.Starling;
	import starling.events.Event;
	import starling.display.Stage;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import starling.display.Image;
	import flash.utils.setTimeout;
	import view.*;
	import starling.display.MovieClip;

	public class Player extends Sprite {

		public static var infected: Boolean;
		public static var gender:String;
		public var hit:Boolean=false;
		public var playerAnimation:MovieClip;
		public var animHeight:int = 24;
		public var animWidth:int = 24;

		public function Player(){
			trace("player constructor", GameScreen.direction);
			gender = MainMenuScreen.saveDataObject.data.gender;
			if(gender=="male"){
				playerAnimation = new MovieClip(Main.assets.getTextures("boy-front0000"),24);			
			}
			else{
				playerAnimation = new MovieClip(Main.assets.getTextures("girl-front0000"),24);

			}
			addChild(playerAnimation);
			Starling.juggler.add(playerAnimation);
			playerAnimation.height=animHeight;
			playerAnimation.width=animWidth;
			playerAnimation.loop=false;
			playerAnimation.play();
			addEventListener(Event.ENTER_FRAME, updateAnimation);
		}
		
		
		function updateAnimation(event:Event){
			if(playerAnimation.isComplete){
				if(GameScreen.direction=="left"){
					playerAnimation.stop();
					removeChild(playerAnimation);
					Starling.juggler.remove(playerAnimation);
					if(gender=="male"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-infected"),24);							
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-left"),24);
						}
					}
					if(gender=="female"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-infected"),24);						
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-left"),24);
						}
					}
				}
				if(GameScreen.direction=="right"){
					playerAnimation.stop();
					removeChild(playerAnimation);
					Starling.juggler.remove(playerAnimation);
					if(gender=="male"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-infected"),24);						
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-right"),24);
						}
					}
					if(gender=="female"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-infected"),24);						
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-right"),24);
						}
					}
				}
				if(GameScreen.direction=="up"){
					playerAnimation.stop();
					removeChild(playerAnimation);
					Starling.juggler.remove(playerAnimation);
					if(gender=="male"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-infected"),24);
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-back"),24);
						}
					}
					if(gender=="female"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-infected"),24);							
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-back"),24);
						}
					}
				}
				if(GameScreen.direction=="down"){
					playerAnimation.stop();
					removeChild(playerAnimation);
					Starling.juggler.remove(playerAnimation);
					if(gender=="male"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-infected"),24);						
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-front"),24);
						}
					}
					if(gender=="female"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-infected"),24);						
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-front"),24);
						}
					}
				}
				else if(GameScreen.direction==""){
					playerAnimation.stop();
					removeChild(playerAnimation);
					Starling.juggler.remove(playerAnimation);
					if(gender=="male"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-infected"),24);						
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("boy-front0000"),24);
						}
					}
					if(gender=="female"){
						if(infected){
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-infected"),24);					
						}
						else{
							playerAnimation = new MovieClip(Main.assets.getTextures("girl-front0000"),24);
						}
					}
				
				}
					addChild(playerAnimation);
					Starling.juggler.add(playerAnimation);
					playerAnimation.height=animHeight;
					playerAnimation.width=animWidth;
					playerAnimation.loop=false;
					playerAnimation.play();
				}
		}
		
		
		public function hitEnemy(){
			if(!hit){
				hit=true;
				infect();
			}
		}
		
		
		public function unHit(){
			if(hit){
				hit=false;
			}
		}
		
		
		public function infect(){
			if(!infected){
				infected=true;
				GameScreen.playerSpeed = 1;
			}
		}


		public function unInfect(){
			if(infected){
				infected=false;
				GameScreen.playerSpeed = 0.5;
			}
		}
	}
}