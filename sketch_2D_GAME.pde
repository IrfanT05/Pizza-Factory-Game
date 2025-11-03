
// variables to represent state of the game
PImage backGround;
PImage backGround2;
PImage conveyor;
PImage gameover;

int conveyorX= 0;
int shelfWidth = 1000;
int shelfHeight = 500;
boolean isGameStarted = false;
boolean toppingsLeft = true;
ArrayList<Products> pizza = new ArrayList<>();
ArrayList<Components> topping = new ArrayList<>();
boolean crashed = false;




//setting up the background and conveyor belts
void setup()
{
  size(1500,800);
  conveyor = loadImage("conveyor.png");
  conveyor.resize(width,400);
  backGround = loadImage("background.png");
  backGround.resize(width,height);
  backGround2 = loadImage("background2.jpg");
  backGround2.resize(width,height);
  gameover = loadImage("over.png");
  gameover.resize(width,height);
  
  for (int i = 0; i <= 4; i++)
  {
  pizza.add(new Products( conveyor.width -50 , 400));
 
  
  topping.add(new Components( 30,50));
  
  
 }
}


void draw() //draws the entire game and checks if the gmae is running first
{
  displayHomeMenu();
  RunGame();
 
  
  
}

void MoveConveyor()  //simply moves the conveyor belt from right to left
{
  image(backGround2, 0,0);
  image(conveyor, conveyorX, 400);
  image(conveyor, conveyorX+ conveyor.width, 400);
  
  
  conveyorX -= 1;
  if (conveyorX == -conveyor.width)
  {
    conveyorX = 0;
  }
}

void displayHomeMenu() //different text boxes and text to show the start of the game
{
  image(backGround, 0,0);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("Pizza Assembly Game", width / 2, height / 4);
  rectMode(CENTER);
  fill(50);
  rect(width / 2, height / 2, 400, 200); // Start Game button
  fill(0);
  text("Start Game", width / 2, height / 2);
}
void mousePressed() //checks if the mouse button has been clicked 
{
  if (!isGameStarted) 
  {
    // Check if the "Start Game" button is clicked
    if (mouseX > width / 2 - 100 && mouseX < width / 2 + 100 && mouseY > height / 2 - 100 && mouseY < height / 2 + 100) {
      isGameStarted = true;
   }
  
  }
}

void RunGame() //runs the game if the start button has been clicked
{
  if (isGameStarted)
  {
    MoveConveyor(); //moves the conveyor belt
    DrawShelf(); //draws the shelf
   
    renderPizza(); //renders the pizza
   
    
   }
}


void renderPizza() //displays the pizzas and toppings and includes crash detection 
{
  for (int i = pizza.size()-1; i >=0; i--)
  {
    Products newpizza = pizza.get(i);
    newpizza.UpdatePizzas();
   newpizza.pizzaEnd();
    for (int j = 0   ; j <= topping.size() - 1; j++)
     {
       Components newtopping = topping.get(i);
  
       newtopping.renderToppings();
       newtopping.mouseDrag();
    
  
   
    if (newtopping.crash(newpizza))
    {
     
   
      
      pizza.remove(newpizza);
     
      newpizza.UpdatePizzas();
    
    }
    
  }
  
 }
 
}
  


void DrawShelf() //function to draw the shelf
  {
    fill(200);
    rect(0, 0, shelfWidth, shelfHeight);
    
    strokeWeight(3);
    line(250,0,250,shelfHeight / 2);
    
  }


  
  
