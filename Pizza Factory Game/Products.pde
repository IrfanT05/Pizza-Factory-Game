class Products
{
  int x,y;
  int dx =5;
  int counter = 0;
  int score = 0;
  boolean PizzaEnd = false;
  
  PImage[] pizzas = new PImage[4]; //arraylist for the pizzas
  
  Products(int x, int y) //constructor method
  {
    this.x = x;
    this.y = y;
    
    for(int i = 0; i < pizzas.length; i++) {
      pizzas[i] = loadImage("pizza"+ (i+1) + ".png" );
    }
    
  }
  
  void MovePizzas() //function to simply move the pizza
  {
    this.x -= dx;
  }
  
  void renderPizzas() //show the pizzas
  {            
      pizzas[counter].resize(200,200);
      image(pizzas[counter],x,y);    
      
  }
  
  void UpdatePizzas()
  {
    MovePizzas();
    renderPizzas();
  }
  
  void pizzaEnd()
  {
   
      if(this.x <=0)
      {
         image(gameover, 0,0);
       
     
      }
    
  }
      
      
    
  
  
  
  
  
  
  
  
  
  
  
  
}
