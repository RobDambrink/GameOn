package model
{
	
	public class Graph
	{
		private var graphPath:Array;
		private var vx:int;
		private var vy:int;
		//variables to perform conversion
		private var v1x:Number;
		private var v1y:Number;
		private var v2x:Number;
		private var v2y:Number;
		private var yAxis:Array;
		private var xAxis:Array;
		//to mange queue
		private var queue:Array; 
		private var front:Number=-1;
		private var rear:Number=-1;
		
		private var sPath:Array;
		private var shortPath:Array;
		private var dirAr:Array;
		private var prevV:Number;
		private var pos:Number=0;
		//reference variable to path class
		private var p:Path;
		/*private var a:Number=275;
		private var b:Number=275;*/
		private var c:Number=275;
		private var d:Number=275;
		public var target:Enemy;
		
		public function Graph(target:Enemy):void
		{
			p=new Path();
			this.target=target;
			graphPath = new Array();
			sPath=new Array();
			shortPath=new Array();
			queue=new Array();
			dirAr=new Array();
			yAxis = new Array(70,135,210,275,310,410,480,545,610);
			xAxis = new Array(35,70,135,205,275,340,410,475,545,580);
			generateGraph();
		}
		
		private function generateGraph():void
		{
			for(var i:Number=0;i<90;i++)
			 {
				graphPath.push(new Array());
				for(var j:Number=0;j<90;j++)
				{
					graphPath[i].push(hasPath(i,j)?1:0);
				}
			 }//end loop
		}//end graph generate
		
		public function getDir():Number
		{
			return dirAr[pos++];
		}
		public function setDir(a:Number, b:Number, e:Number,f:Number):void
		{
			clearArry();
			var s:Number=cordinateToVertic(a,b);
			var v:Number=cordinateToVertic(e,f);
			findPath(s,v);
			pos=0;
			//trace(shortPath);
			//trace(dirAr);
			//trace(dirAr);
			/*pos=0;
			return dirAr[pos++];*/
			//return 0;
		}
		public function setDir2(e:Number,f:Number):void
		{
			
			var s:Number;
			var v:Number=cordinateToVertic(e,f);
			//if(e!=c && f!=d)
			//{
			   c=e;
			   f=d;
			  if(shortPath[pos]<0 || shortPath[pos]==null)
			    s=cordinateToVertic(target.x,target.y);
			  else
			    s=shortPath[pos];
			  clearArry();
			  findPath(s,v);
			  pos=0;
			//}
			//trace(shortPath);
			//trace(dirAr);
			//trace(dirAr);
			/*pos=0;
			return dirAr[pos++];*/
			//return 0;
		}
		
		private function clearArry():void
		{
			sPath.length=0;
			shortPath.length=0;
			dirAr.length=0;
			queue.length=0;
			front=-1;
			rear=-1;
		}
		
		private function findPath(s:Number, d:Number):void
		{
			var v:Number;
			var sPathIndex:Number=0;
			enque(s);
			v=dque();
			try{
			while(v!=-1)
			{
				if(v==-1 || v==d)
				break;
				for(var i:int=0;i<90;i++)
				{
					//trace(v + " " + i + " "+ checkQue(i) );
					if(graphPath[v][i]==1 && checkQue(i) && v!=i)
					{
					  sPath.push(new Array());
					  sPath[sPathIndex].push(i);
					  sPath[sPathIndex++].push(v);	
					  enque(i);
					}
				}
				v=dque();
			}
			}catch(errObject:Error)
			{
				trace("The message is: " + errObject.message);
			}
			findSortPath(s,d);
			directionPath();
		}
		
		
		private function findSortPath(s:Number, v:Number):void
		{
			if(s==v)
			  trace("Path");
			else if(parentOf(v)==-1)
			  trace("No Path Exist");
			else
			   findSortPath(s,parentOf(v));
			shortPath.push(v);
		}
		
		private function directionPath():void
		{
			var temp:int=0;
			var len:int=shortPath.length;
			for(var i:int=0;i<len;i++)
			{
				temp=i;
				if(++temp==len)
				{
			     dirAr.push(dirAr[--i])		
				 break;
				}
				dirAr.push(dir(shortPath[i],shortPath[temp]))
			}
		}
		
		private function dir(s:Number, v:Number):Number
		{
			vx=s<10 ? 0 : s/10;
            vy=v<10 ? 0 : v/10;
			v1x=s<10 ? s : s%10;
            v1y=v<10 ? v : v%10;
			if(vx==vy)
			  return v1x<v1y?2:1;
			else if(v1x==v1y)
			  return vx<vy?4:3;
			return -1;
		}
		
		private function parentOf(v:Number):Number
		{
			var i:int;
			for(i=0;i<sPath.length;i++)
			if(sPath[i][0]==v)
			return sPath[i][1];
			
			return -1;
		}
		
		private function enque(s:Number)
		{
			if(rear>=90)
			 trace("queue overflow");
			else
			 {
				 rear++;
				 queue[rear]=s;
				 if(front==-1)
				  front=0;
			 }
		}
		
		private function dque():Number
		{
			var item:Number;
			if(front<0)
			{
			 item=-1	
			 trace("queue is empty");
			}
			else
			{
				item=queue[front];
				if(front==rear)
				{
					front=-1; rear=-1;
				}
				else
				   front++;
			}
			return item;
		}
		private function checkQue(s:Number):Boolean
		{
			var flag:Boolean=true;
			var i:int=0;
			while(1)
			{
				if(i<queue.length)
					if(queue[i]==s)
					{
					 flag=false;
					 break;
					}
			    if(i<sPath.length)
					if(sPath[i][0]==s)
					{
					  flag=false;
					  break;
					}
				  i++;
				if(i>=queue.length && i>=sPath.length)
				 break;
			}
			verticToCordinate(s);
			return(Path.crossPath(vx,vy)?flag:false);
		}
		
		private function checkCross(s:Number):Boolean
		{
			verticToCordinate(s);
			return(Path.crossPath(vx,vy)); 
		}
		
		private function hasPath(i:Number,j:Number):Boolean
		{
			var flag:Boolean=false
			var temp:Number;
			verticToCordinate(i);
			v1x=vx;
			v1y=vy;
			verticToCordinate(j);
			v2x=vx;
			v2y=vy;
			//trace(v1x+" " + v1y);
			//trace(v2x+" " + v2y);
			if(v1y==v2y)
			{
				if(v1x<v2x)
				temp=v1x;
				else
				{
					temp=v2x;
					v2x=v1x;
				}
				while(temp<=v2x)
				{
					temp+=5;
					if(Path.horizontalPath(temp,v2y,0))
					{
					   //trace(temp);
					   //trace(Path.horizontalPath(temp,v2y,0));
					   if(Path.crossPath(temp,v2y))
					   {  
					     flag=temp==v2x? true : false;
						 break;
					   }
					   //trace(Path.crossPath(temp,v2y));
					   if(flag==true)
					   break;
					}
					else
					{
						flag=false;
						break;
					}
				}
				if(flag==true)
				return true;
			}
			else if(v1x==v2x)
			{
				if(v1y<v2y)
				temp=v1y;
				else
				{
					temp=v2y;
					v2y=v1y;
				}
				while(temp<=v2y)
				{
					temp+=5;
					if(Path.verticalPath(v1x,temp,0))
					{
					   if(Path.crossPath(v1x,temp))
					   {  
					     flag=temp==v2y? true : false;
						 break;
					   }
					   if(flag==true)
					   break;
					}
					else
					{
						flag=false;
						break;
					}
				}
				if(flag==true)
				return true;
			}
			else
			 return false
			 //trace(flag);
			return false;
		}
	
	    private function verticToCordinate(cordinate:Number):void
		{
			vx=cordinate<10 ? cordinate : cordinate%10;
            vy=cordinate<10 ? 0 : cordinate/10;
			vx=xAxis[vx];
			vy=yAxis[vy];
		}
		
		private function cordinateToVertic(X:Number,Y:Number):Number
		{
			var flag:Boolean=false;
			var cordinate:Number=0;
			  for(var i:int=0;i<9;i++)
               {
                   if(yAxis[i]==Y)
                      {
                        cordinate=i;
                        flag=true;
                        break;
                      }
               }
              if(flag==true)
               {
                   flag=false;
                   for(i=0;i<10;i++)
                     {
                       if(xAxis[i]==X)
                         {
                           cordinate*=10;
                           cordinate+=i;
                           flag=true;
                         }
                        if(flag==true)
                           break;
                     }
                }
                 if(flag==true)
                    return cordinate;
                 else
                    trace("Not Found");
				return -1;
		}
		
	}
}