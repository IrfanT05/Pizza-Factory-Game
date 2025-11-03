class Components
{
  int x,y;
  int shelfWidth = 500*2;
  int shelfHeight = 500;
  int dx = 2;
  int counter = 0;
  int score = 0;
  
 
  
  PImage[] toppings = new PImage[4]; //arraylist for toppings
  
  Components(int x, int y) //constructor method for the toppings
  {
    this.x = x;
    this.y = y;
    
    for(int counter = 0; counter < toppings.length; counter++) {
     toppings[counter] = loadImage("toppings"+ (counter+1) + ".png" );
    }
    
  }
  
  void renderToppings() //displays all the toppings
  {
     toppings[counter].resize(200,200);
      image(toppings[counter],x,y);    
  }
      
  
  void DrawShelf() //draws the shelf
  {
    
    rect(0, 0, shelfWidth, shelfHeight);
    fill(200);
    strokeWeight(3);
    line(250,0,250,shelfHeight / 2);
    
  }
  void mouseDrag() //dragging with mouse 

  { 

    if (mousePressed)  

    { 

      if  (dist(mouseX ,mouseY, this.x + 50,this.y + 50) <90 ) //mouse close to top corner? 

      { 

        this.x=mouseX - 100; 

        this.y=mouseY - 50; 

      } 

    }  

  } 
   boolean crash(Products product) //crash function to check if toppings and pizza have collided
  { 
   
    return abs(this.x-product.x) < toppings[counter].width && abs(this.y - product.y) < toppings[counter].height;
  }
  
  
  
  
}
