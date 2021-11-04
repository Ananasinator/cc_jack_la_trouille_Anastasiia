// starting here

PImage background;
ArrayList<Orb> my_orbs;
long time_counter;
int kills = 0;
PImage score_background;
PFont score_font;
PImage house;
PImage zombie;

class Orb {
  int orb_size, position_x, position_y, orb_color, speed;
  boolean clicked;
  Orb() {
    position_x = 1250;
    orb_size = int(random(80,150));
    int[] lines = {180, 300, 420, 540, 660};
    int line_number = int(random(0, 5));
    position_y = lines[line_number];
    orb_color = color(#fc8803);
    speed = int(random(15,54));
    
  }
  int is_alive(){
    if (position_x < orb_size) {
       return 1; 
     } else { 
       if (clicked){
         return 2;
       } else {
       return 0;
       }
     }
  }
  void display() {
      pushStyle();
      noStroke(); 
      imageMode(CENTER);
      image(zombie, position_x, position_y, orb_size, orb_size);
      popStyle();
    }
  void move(){
    position_x -= 3;
  }
  
  void click(){
    if (mouseX > position_x - orb_size && mouseX < position_x + orb_size && mouseY > position_y - orb_size && mouseY < position_y + orb_size){
      clicked = true;
      kills += 1;
    } else {
      clicked = false;
    }
  }
 
}

void setup() {
  size(1200, 720);
  background = loadImage("C:/Users/anast/Документы/Jack La Trouille/ressources/Images/battle_background.png");
  my_orbs = new ArrayList();
  time_counter = millis();
  score_background = loadImage("C:/Users/anast/Документы/Jack La Trouille/ressources/Images/score_rect.png");
  score_font = createFont("C:/Users/anast/Документы/Jack La Trouille/ressources/Police/halloween_font.ttf", 50);
  textFont(score_font);
  house = loadImage("C:/Users/anast/Документы/Jack La Trouille/ressources/Images/house.png");
  zombie = loadImage("C:/Users/anast/Документы/Jack La Trouille/ressources/Images/zombitrouille.png");
}

void spawn(){
  if (time_counter <= millis()){
   my_orbs.add(new Orb());
   time_counter = millis() + 500;
  }
}

void draw() {
  clear();
  image(background, 0, 0);
  int[] lines = {180, 300, 420, 540, 660};
  for (int i = 0; i < lines.length; i++) {
    image(house, 10, lines[i] - 50);
  }
  spawn();
  for (int i = 0; i < my_orbs.size(); i++) {
     if (my_orbs.get(i).is_alive() == 0){
       my_orbs.get(i).move();
       my_orbs.get(i).display();
   } else {
     my_orbs.remove(i);
     i--; 
    }
  }
  
  image(score_background, 0, 0);
  fill(color(#fc8803));
  textAlign(CENTER);
  text(str(kills), 120, 90);
}

void mousePressed() {
 if (mouseButton == LEFT) {
   for (int i = 0; i < my_orbs.size(); i += 1) {
     my_orbs.get(i).click();
   }
 }
 }
