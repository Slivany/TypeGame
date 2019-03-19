import ddf.minim.*;
Minim minim;
AudioSample sound1;
AudioSample sound2;

import g4p_controls.*;
TypeClass type = new TypeClass();

boolean P1Over = false;
boolean P2Over = false;
boolean P3Over = false;
boolean P4Over = false;

String chosen = "";
String myText = "";
int chosenx = 0;
int choseny = 0;
int level;
int corrects = 0;
int points = 1;
float multiplier = 2;
float percent = 0.50;
int corTilLevel = 10;
int displayCTL = 10;
boolean newWord = true;
boolean winning = false;
boolean leveling = false;
PImage Skeeper;
PImage Sign;
PImage Shelf;
PImage Brick;


void setup() {
  size(800, 500);
  Skeeper = loadImage("skeeper.png");
  Sign = loadImage("sign.png");
  Shelf = loadImage("shelf.png");
  Brick = loadImage("Brick.jpg");
  textAlign(CENTER, CENTER);
  minim = new Minim(this);
  sound1 = minim.loadSample("sound1.wav");
  sound2 = minim.loadSample("sound2.wav");
  createGUI();
  customGUI();
}

void draw() {
  background(Brick);
  //Her er angivet shelves
  image(Shelf, 425, 300, 240, 67);
  image(Shelf, 425, 400, 240, 67);
  //Her er Shop Keeperen angivet
  image(Skeeper, 650, 200, 148, 306);
  //Her er angivet sign
  image(Sign, 550, 0, 124, 125);
  //UI linje
  line(420, 500, 420, 0);
  //Kalder på lvlUP funktionen
  type.lvlUP();
  //myText
  textSize(30);
  fill(0, 0, 0);
  text(myText, -170, 210, width, height);
  noFill();
  //tekst
  fill(0, 0, 0);
  textSize(16);
  text("Points:", 30, 10); 
  text("Multiplier:", 150, 10);
  text("x", 199, 10); 
  text("Next stage:", 320, 10); 
  noFill();
  //corrects
  fill(0, 0, 0);
  textSize(16);
  text(corrects, 70, 10); 
  noFill();
  //Show points to next stage
  fill(0, 0, 0);
  textSize(16);
  text(displayCTL, 383, 10); 
  noFill();
  //multiplier
  fill(0, 0, 0);
  textSize(16);
  text(multiplier, 233, 10); 
  noFill();
  checkText();
  //level
  text("Level: " + Integer.toString(level), 306, 35);
  //valg af position
  if (newWord) {
    chosenx = int(random(30, 380));
    choseny = int(random(100, 400));
    newWord = false;
  }
  //leveling screen
  if (leveling) {
    textSize(24);
    fill(0);
    text("You have unlocked the next stage!", 208, 200);
  }
  //tegn ordet op
  textSize(20);
  fill(0);
  text(chosen, chosenx, choseny);
  
  //Winning Screen
  if (winning) {
    WinningScreen();
  }
  update(mouseX, mouseY);
  if (P1Over) {
    textSize(14);
    fill(0);
    text("Price: 40 points", 730, 15);
    text("Your income will be", 730, 35);
    text("multiplied!", 730, 50);
  } else if (P2Over) {
    textSize(14);
    fill(0);
    text("Price: 10 points", 730, 15);
    text("Make your multiplier", 730, 35);
    text("even stronger!", 730, 50);
  } else if (P3Over) {
    textSize(14);
    fill(0);
    text("Price: 25 points", 730, 15);
    text("Halve the points", 730, 35);
    text("required to level!", 730, 50);
  } else if (P4Over) {
    textSize(14);
    fill(0);
    text("Price: Unknown", 730, 15);
    text("Feeling rich..?", 730, 35);
  }
}

void checkText() {
  if (myText == "") return;
  StringList t = new StringList();
  boolean c = false;
  switch(type.lvl) {
   
    case 0:
          t.append("have");
          t.append("that");
          t.append("with");
          t.append("good");
          t.append("great");
          t.append("point");
          t.append("world");
          t.append("thing");
          t.append("would");
          t.append("there");
          t.append("number");
          t.append("other");
          t.append("they");
          t.append("group");
          t.append("year");
          c = true;
          level = 1;
    break;
    
    case 1:
          t.append("beneath");
          t.append("company");
          t.append("government");
          t.append("important");
          t.append("young");
          t.append("different");
          t.append("problem");
          t.append("because");
          t.append("something");
          t.append("everything");
          t.append("happened");
          t.append("remember");
          t.append("probable");
          t.append("business");
          t.append("tomorrow");
        c = true;
        level = 2;
        corTilLevel = 50;
        displayCTL = 50;
    break;
    
        case 2:
          t.append("Victoria");
          t.append("Operation");
          t.append("Lieutenant");
          t.append("Thanksgiving");
          t.append("Physical");
          t.append("Disappeared");
          t.append("Explanation");
          t.append("Circumstances");
          t.append("Threatened");
          t.append("Pretending");
          t.append("Guarantee");
          t.append("Uncomfortable");
          t.append("Honeymoon");
          t.append("Neighborhood");
          t.append("Concentrate");
        c = true;
        level = 3;
        corTilLevel = 200;
        displayCTL = 200;
    break;
    
    case 3:
          t.append("Withdrawal");
          t.append("Two-thirds");
          t.append("Sustainable");
          t.append("Worldwide");
          t.append("Youngster");
          t.append("Middle-class");
          t.append("Willingness");
          t.append("Sovereignty");
          t.append("Consecutive");
          t.append("Republicanism");
          t.append("Devastating");
          t.append("Substantially");
          t.append("Accountability");
          t.append("Availability");
          t.append("Authorize");
        c = true; 
        level = 4;
        corTilLevel = 500;
        displayCTL = 500;
    break;
    
    case 4:
          t.append("Aggrandize");
          t.append("Advocate");
          t.append("Camaraderie");
          t.append("Disaffected");
          t.append("Enfranchise");
          t.append("Forbearance");
          t.append("Gratuitous");
          t.append("Iconoclast");
          t.append("Linchpin");
          t.append("Munificent");
          t.append("Negligent");
          t.append("Officious");
          t.append("Partisan");
          t.append("Quixotic");
          t.append("Relegate");
        c = true;
        level = 5;
        corTilLevel = 1000;
        displayCTL = 1000;
    break;
    
    case 5:
          t.append("Surreptitious");
          t.append("Ubiquitous");
          t.append("Abnegation");
          t.append("Anachronistic");
          t.append("Circumlocution");
          t.append("Commensurate");
          t.append("Intransigent");
          t.append("Multifarious");
          t.append("Obstreperous");
          t.append("Sanctimonious");
          t.append("Preponderance");
          t.append("Philanthropic");
          t.append("Irreverence");
          t.append("Intransigent");
          t.append("Inveterate");
        c = true;
        level = 6;
        corTilLevel = 999*999;
        displayCTL = 999*999;
        winning = true;
    break;
  }
  
  if (chosen.equals("")) {
      newWord = true;
      int idx = int(random(0, t.size()));
      chosen = t.get(idx);
  }
  
  if (c) {
    if(t.hasValue(myText) && chosen.equals(myText)) {
      corrects += points;
      //displayCTL -= points;
      myText = "";
      
      newWord = true;
      int idx = int(random(0, t.size()));
      chosen = t.get(idx);
    }
  }
}

//skriver på skærmen
void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (myText.length() > 0) {
      myText = myText.substring(0, myText.length()-1);
    }
  } else if (keyCode == DELETE) {
    myText = "";
  } else if (keyCode == ENTER) {
  }
  else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    myText = myText + key;
    leveling = false;
  }
}

//mus
void update(int x, int y) {
  if( P1Over(460, 265, 60) ) {
    P1Over = true;
    P2Over = false;
    P3Over = false;
    P4Over = false;
  } else if ( P2Over(590, 265, 60) ) {
    P2Over = true;
    P1Over = false;
    P3Over = false;
    P4Over = false;
  } else if ( P3Over(460, 365, 50) ) {
    P3Over = true;
    P1Over = false;
    P2Over = false;
    P4Over = false;
  } else if ( P3Over(590, 365, 50) ) {
    P4Over = true;
    P1Over = false;
    P2Over = false;
    P3Over = false;
  } else {
    P1Over = P2Over = P3Over = P4Over = false;
  }
}

boolean P1Over(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean P2Over(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean P3Over(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean P4Over(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}