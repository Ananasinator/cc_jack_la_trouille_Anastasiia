// starting here

class Orb {
  int orb_size, position_x, position_y, orb_color, speed;
  Orb() {
    position_x = 1250;
    orb_size = int(random(25,50));
    int[] lines = {180, 300, 420, 540, 660};
    int line_number = int(random(0, 5));
    position_y = lines[line_number];
    orb_color = color(#fc8803);
    speed = int(random(2, 5));
    
  }
  void display() {
      pushStyle();
      fill(orb_color); 
      noStroke(); 
      circle(position_x, position_y, 50); 
      popStyle();
    }
  void move(){
    position_x -= 10;
  }
}

PImage background;
ArrayList<Orb> my_orbs;
long time_counter;


void setup() {
  size(1200, 720);
  background = loadImage("C:/Users/anast/Документы/Jack La Trouille/ressources/Images/training_background.png");
  my_orbs = new ArrayList();
  time_counter = millis();
}

void spawn(){
  if (time_counter <= millis()){
   my_orbs.add(new Orb());
   time_counter = millis() + 100;
}
}

void draw() {
  clear();
  image(background, 0, 0);
  spawn();
  for (int i = 0; i < my_orbs.size(); i++) {
    my_orbs.get(i).move();
    my_orbs.get(i).display();
  }
}
