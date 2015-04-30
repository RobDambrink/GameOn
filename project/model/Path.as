package model
{
	import starling.display.Stage;
	
	
	class Path{
		
		private static var speed:Number=5;
		private static var myMap:Array = new Array();
		
		public function Path () : void
		{
		   init();
		}
		public static function init():void
		{
            myMap.push(new Array());
            var level1:Array = new Array([70,35,135,275,340,475,580]);
            var level2:Array = new Array([135,35,135,205,275,340,410,475,580]);
            var level3:Array = new Array([210,35,135,205,275,340,410,475,580]);
            var level4:Array = new Array([275,205,275,340,410]);
			var level5:Array = new Array([310,135,205,410,475]);
            var level6:Array = new Array([410,35,135,205,275,340,410,475,580]);
			var level7:Array = new Array([480,35,70,135,205,275,340,410,475,545,580]);
			var level8:Array = new Array([545,35,70,135,205,275,340,410,475,545,580]);
			var level9:Array = new Array([610,35,275,340,580]);
            myMap[0].push(level1, level2, level3, level4, level5,level6, level7, level8, level9);
		}
		
		
		public static function crossPath(X:Number,Y:Number):Boolean
		{
            for (var k in myMap[0]) //This will make the map loop through it's 5 levels or rows, so the following code will run 5 times, once for each row.
               {
	             
				  if(myMap[0][k][0][0]==Y)
				  {
				  for (var i in myMap[0][k][0]) //This will make the map loop through each column, remember this is already in the loop that goes to each row, so at this point every tile in the map will be looped through.
	                 {
		                if(i==0)
						continue;
		                if(myMap[0][k][0][i]==X)
						{
							return true;
							break;
						}
	                  }
				  }
             }
			 
			 return false;
		}//end of cross path
		
		
		
		public static function verticalPath(X:Number, Y:Number , D:Number):Boolean
		{
			var l:Number=0;
			var m:Number=0;
			if(D==4)
			  m=speed;
			else
			  l=speed;
			  
			if(X==35 || X==580)
			{
				if((Y>=(70+l) && Y<=(210-m)) || (Y>=(410+l) && Y<=(480-m)) || (Y>=(545+l) && Y<=(610-m)))
				 return true;
				else
				 return false;
			}
			else if(X==70 || X==545)
			{
				if((Y>=(480+l) && Y<=(545-m)))
				return true;
				else
				 return false;
			}
			else if(X==135 || X==475)
			{
				if((Y>=(70+l) && Y<=(545-m)))
				 return true;
				else
				 return false;
			}
			else if(X==205 || X==410)
			{
				if((Y>=(135+l) && Y<=(210-m)) || (Y>=(275+l) && Y<=(410-m)) || (Y>=(480+l) && Y<=(545-m)))
				 return true;
				else
				 return false;
			}
			else if(X==275 || X==340)
			{
				if((Y>=(70+l) && Y<=(135-m)) || (Y>=(210+l) && Y<=(275-m)) || (Y>=(410+l) && Y<=(480-m)) || (Y>=(545+l) && Y<=(610-m)))
				 return true;
				else
				 return false;
			}
			else 
				return false;
		}//end of vertical path
		
		
		
		public static function horizontalPath(X:Number, Y:Number , D:Number):Boolean
		{
			var l:Number=0;
			var m:Number=0;
			if(D==2)
			  m=speed;
			else
			  l=speed;
			  
			if(Y==610 || Y==135)
			{
				if(X>=(35+l) && X<=(580-m))
				return true;
				else
				 return false;
			}
			else if(Y==545 || Y==210)
			{
				if((X>=(35+l) && X<=(135-m)) || (X>=(205+l) && X<=(275-m)) || (X>=(340+l) && X<=(410-m)) || (X>=(475+l) && X<=(580-m)))
				return true;
				else
				 return false;
			}
			else if(Y==480)
			{
				if((X>=(35+l) && X<=(70-m)) || (X>=(135+l) && X<=(475-m)) || (X>=(545+l) && X<=(580-m)) )
				return true;
				else
				 return false;
			}
			else if(Y==410 || Y==70) //4
			{
				if((X>=(35+l) && X<=(275-m)) || (X>=(340+l) && X<=(580-m)) )
				return true;
				else
				 return false;
			}
			else if(Y==310)//5
			{
				if((X>=(0+l) && X<=(205-m)) || (X>=(410+l) && X<=(610-m)) )
				{
				  return true;
				}
				else
				 return false;
			}
			else if(Y==275)
			{
				if((X>=(205+l) && X<=(275-m)) || (X>=(340+l) && X<=(410-m)) )
				return true;
				else
				 return false;
			}
			else 
			{
				return false;
			}
			
		}// end of horizontal path
		
		
		
	}//end of class
}//end of package