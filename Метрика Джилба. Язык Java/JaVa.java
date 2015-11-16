import food.Apple; 
import food.Cheese; 
import food.Coffee; 
import food.Food; 

public class MainApplication { 
    public static void main(String[] args){ 
 String [] argsFake = new String[]{"food.Cheese","food.Apple/5","food.Apple/10","food.Coffee/насыщенный","food.Coffee/восточный"}; 
 Food[] breakfast = new Food[20]; 
 int[] types = new int[3]; 
 int itemsSoFar = 0; 
 for (String arg: argsFake) { 
 String[] parts = arg.split("/"); 
 if (parts[0].equals("food.Cheese")) 
 {
 breakfast[itemsSoFar] = new Cheese(); 
 types[0] = types[0]+1; 
 } else 
 if (parts[0].equals("food.Apple")) 
 { 
 breakfast[itemsSoFar] = new Apple(parts[1]); 
 types[1] = types[1]+1; 
 } 
 if (parts[0].equals("food.Coffee")) 
 { 
 breakfast[itemsSoFar] = new Coffee(parts[1]); 
 types[2] = types[2]+1; 
 } 

 itemsSoFar++; 
 } 
 for (Food item: breakfast) 
 if (item!=null)	 
 item.consume(); 
 else 
 break; 
 System.out.println("Вы сьели "+types[0]+" сыр(а)(ов)"); 
 System.out.println("Вы сьели "+types[1]+" яблок(а)(о)"); 
 System.out.println("Вы выпили "+types[1]+" кофе"); 
 System.out.println("Всего хорошего!"); 
 } 
} 



if () 
{
	if ()
	{
	    if ()
		//if ()
		//{
        //   asdf
		//};
        else
        {
			asfsad
			/*if ()
			   asfsa
		    else
			{
				
			};
			*/
		};			
	}
};
else
{
	if ()
	{
		if ()
			asd;
	}
}


package food; 

public abstract class Food implements Consumable { 
 private String name; 

 public Food(String name) { 
this.name = name; 
 } 

 public boolean equals(Object arg0) { 
 if (!(arg0 instanceof Food)) return false; 
 if (name==null || ((Food)arg0).name==null) return false; 
 return name.equals(((Food)arg0).name); 
 } 

 public String toString() { 
 return name; 
 } 

 public String getName() { 
 return name; 
 } 

 public void setName(String name) { 
this.name = name; 
 } 
} 




package food; 

public interface Consumable { 
 void consume(); 
} 




package food; 

public class Coffee extends Food { 
 String aroma; 

 public Coffee(String aroma) { 
 super("Кофе"); 
 this.aroma = aroma; 
 } 

 public void consume() { 
 System.out.println(this + " выпито"); 
 } 


 @Override 
 public String toString() { 
 return super.toString() + " аромата '" + aroma + "'"; 
 } 
} 





package food; 

public class Apple extends Food { 
 private String size; 
 public Apple(String size) { 
 super("Яблоко"); 
 this.size = size; 
 } 
 public void consume() { 
 System.out.println(this + " съедено"); 
 } 

 public String getSize() { 
 return size; 
 } 

 public void setSize(String size) { 
 this.size = size; 
 } 

 public boolean equals(Object arg0) { 
 if (super.equals(arg0)) 
 { 
 if (!(arg0 instanceof Apple)) return false; 
 return size.equals(((Apple)arg0).size); 
 } else 
 return false; 
 } 

 public String toString() { 
 return super.toString() + " размера '" + size + "'"; 
 } 
}