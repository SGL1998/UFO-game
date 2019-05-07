PImage img;
PImage img2;
int score;
float x =0, speedx=0.5;
float y =400, speedy=0;
int counter;
float shipx1, shipx2, shipx3, shipx4, shipx5, upshipx6;
float shipy1, shipy2, shipy3, shipy4, shipy5, upshipy6;
int Screenstate;
boolean ship1 = true;
boolean ship2 = true;
boolean ship3 = true;
boolean ship4 = true;
boolean ship5 = true;
boolean ship6 = true;
float body6;
PFont titleFont;
int bigshipDamage;
int timer;
PFont font2;
PFont titlefont2;

void setup() {
  size(800, 800);
  img = loadImage("Humid-Summer-Night.jpg");
  img2 = loadImage("STOCK UFO.jpg");
  smooth();
  frameRate(60);
  shipy1 = 60;
  shipy2 = 90;
  shipy3 = 100;
  shipy4 = 300;
  shipy5 = 550;
  upshipy6 = 600;
  body6 = 0;
  counter = 0;
  timer = 0;
  shipx1= 0;
  shipx2= 0;
  shipx3= 0;
  shipx4= 0;
  shipx5= 0;
  upshipx6 = 0;
  upshipy6 =0;
  Screenstate = 0;
  score = 0;
  bigshipDamage =0;
  titlefont2 = loadFont("Superclarendon-BoldItalic-56.vlw");
  font2 = loadFont("Candara-Bold-32.vlw");
  titleFont = loadFont("CenturyGothic-BoldItalic-16.vlw");
  textFont(titleFont);
}
void draw() {

  switch(Screenstate) {
  case 0:
    image(img2, 0, 0);
    fill(255, 255, 255);
    rect(0, 600, 800, 400);
    textFont(titlefont2);
    text( "UFO HUNT", 200, 100);
    textFont(titleFont);
    text( "Welcome to my game, UFO Hunt!  To play, move your mouse over any invading spacecraft and click!", 0, 400);
    textFont(font2);
    text( "Press p to start the game!", 200, 470);
    text("V1.0", 20, 580);
    break;
  case 1: // game on!
    textFont(font2);
    if ( Screenstate == 1) {
      image(img, 0, 0);
      fill(255, 255, 255);
      if ( score == 5) {
        Screenstate = 2;
      }
      //ship1
      //ship1 
      if ( ship1 == true) {
        if ( (int) random(0, 2) ==0) {
          fill(244, 89, 66); 
          rect(shipx1-5, shipy1-13, 10, 27);
        } else {
          fill(244, 137, 66); 
          rect(shipx1-5, shipy1-13, 10, 27);
        }
        //ship1 body
        fill(100);
        ellipse(shipx1, shipy1, 70, 20);

        // UFO1 Blinking lights 
        ellipse(shipx1, shipy1, 5, 5);
        if (counter < 300) {
          fill(255, 0, 0);
          ellipse(shipx1-10, shipy1, 5, 5);
        }
        if (counter>= 500) {
          fill(255, 255, 0);
          ellipse(shipx1+10, shipy1, 5, 5);
        } else {
          fill(125);
        }
        if (counter >= 300 && counter < 500) {
          fill(0, 255, 0);
          ellipse(shipx1+10, shipy1, 5, 5);
        } else {
          fill(125);
        }
      }
      //ship 2
      if ( ship2 == true) {
        rect(shipx2, shipy2, 100, 50);
      }
      //ship 3
      if (ship3 == true) {
        //ship3
        fill(44, 96, 193); 
        rect(shipx3, shipy3, 20, 40); 
        ellipse(shipx3+10, shipy3+4, 20, 15); 

        fill(244, 247, 64); 
        rect(shipx3+1, shipy3+1, 15, 10); 
        ellipse(shipx3+10, shipy3-8, 3, 3);
      }
      //ship4
      if (ship4 == true) {
        if (counter<200) {
          fill(87, 181, 16);
          ellipse(shipx4, shipy4, 35, 35);
        }
        if (counter>=200) {
          fill(211, 134, 25);
          ellipse(shipx4, shipy4, 35, 35);
        }
        if (counter>=400 && counter<=600) {
          fill(219, 30, 62);
          ellipse(shipx4, shipy4, 35, 35);
        }
        fill(100);
        rect(shipx4-30, shipy4-13, 60, 25);

        if (counter<200) {
          fill(35, 118, 234);
          ellipse(shipx4+15, shipy4, 5, 5);
          ellipse(shipx4-15, shipy4, 5, 5);
        }
        if (counter>=200) {
          fill(227, 35, 234);
          ellipse(shipx4+15, shipy4, 5, 5);
          ellipse(shipx4-15, shipy4, 5, 5);
        } 
        if (counter>=400 && counter<=600) {
          fill(234, 45, 35);
          ellipse(shipx4+15, shipy4, 5, 5);
          ellipse(shipx4-15, shipy4, 5, 5);
        }
        //Ship 5
      }
      if (ship5 == true) {
        fill(100);
        rect(shipx5, shipy5, 300, 100);
        triangle(shipx5+100, shipy5, shipx5+20, shipy5-60, shipx5+20, shipy5);
        triangle(shipx5+300, shipy5, shipx5+150, shipy5-40, shipx5+150, shipy5);
      }

      //spaceship thrust
      shipx1 +=0.5; 
      shipx2 +=0.8; 
      shipx3 +=4; 
      shipx4 +=3; 
      shipx5 +=1.5;

      // teleportation
      if (shipx1 > 1100 ) {
        shipy1 = 60;
        shipx1 = -300;
      }
      if (shipx2 > 1100 ) {
        shipy2 = 100;
        shipx2 = -300;
      }
      if (shipx3 > 1100) {
        shipy3 = 200;
        shipx3 = -300;
      }
      if (shipx4 > 1100 ) {
        shipy4 = 400;
        shipx4 = -300;
      }
      if (shipx5 > 1100) {
        shipy5 = 550;
        shipx5 = -300;
      }

      if (counter>=800) {
        fill(200); 
        line(x, y, x+10, y);
      }
      if (counter == 800) {
        counter = 0;
      }
      counter++; 
      x+=speedx; 
      y+=speedy; 
      counter++;

      if (counter == 600) {
        counter = 0;
      }
      //cross hairs  
      fill(255, 255, 255);
      line(mouseX-30, mouseY, mouseX-2, mouseY);
      line(mouseX+30, mouseY, mouseX+2, mouseY);
      line(mouseX, mouseY-30, mouseX, mouseY-2);
      line(mouseX, mouseY+30, mouseX, mouseY+2);
      noFill();
      ellipse(mouseX, mouseY, 30, 30);

      //raygun
      fill(100);
      quad(mouseX-10, mouseY+20, mouseX-40, mouseY+200, mouseX+40, mouseY+200, mouseX+10, mouseY+20);

      fill(255, 255, 255);
      rect(0, 650, 800, 200);
      fill(50);
      textFont(font2);
      text("Score:" + score, 50, 750); 
      text("Big Ship Damage:" + bigshipDamage, 500, 750);
      textFont(titleFont);
      text("Hint: Target the front and rear of the biggest ship to destroy it! Make sure Big Ship Damage = 2", 50, 700);
      if (Screenstate == 2) {
        bigshipDamage = 0;
        score = 0;
        ship1 = true;
        ship2 = true;
        ship3 = true;
        ship4 = true;
        ship5 = true;
      }
    }


    break;
  case 2:
    background(255, 255, 255);
    fill(50);
    textFont(font2);
    text("Level 2: Press p to begin", 300, 400);
    break;

  case 3: // Level 2

    image(img, 0, 0);
    fill(255, 255, 255);

    if ( score == 6) {
      Screenstate = 4;
    }

    //ship1
    //ship1 
    if ( ship1 == true) {
      if ( (int) random(0, 2) ==0) {
        fill(244, 89, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      } else {
        fill(244, 137, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      }
      //ship1 body
      fill(100);
      ellipse(shipx1, shipy1, 70, 20);

      // UFO1 Blinking lights 
      ellipse(shipx1, shipy1, 5, 5);
      if (counter < 300) {
        fill(255, 0, 0);
        ellipse(shipx1-10, shipy1, 5, 5);
      }
      if (counter>= 500) {
        fill(255, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }
      if (counter >= 300 && counter < 500) {
        fill(0, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }
    }
    if ( ship2 == true) {
      rect(shipx2, shipy2, 100, 50);
    }
    if (ship3 == true) {
      //ship3
      fill(44, 96, 193); 
      rect(shipx3, shipy3, 20, 40); 
      ellipse(shipx3+10, shipy3+4, 20, 15); 

      fill(244, 247, 64); 
      rect(shipx3+1, shipy3+1, 15, 10); 
      ellipse(shipx3+10, shipy3-8, 3, 3);
    }
    if (ship4 == true) {
      //ship4

      if (counter<200) {
        fill(87, 181, 16);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=200) {
        fill(211, 134, 25);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=400 && counter<=600) {
        fill(219, 30, 62);
        ellipse(shipx4, shipy4, 35, 35);
      }
      fill(100);
      rect(shipx4-30, shipy4-13, 60, 25);

      if (counter<200) {
        fill(35, 118, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
      if (counter>=200) {
        fill(227, 35, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      } 
      if (counter>=400 && counter<=600) {
        fill(234, 45, 35);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
    }
    if (ship5 == true) {
      fill(100);
      rect(shipx5, shipy5, 300, 100);
      triangle(shipx5+100, shipy5, shipx5+20, shipy5-60, shipx5+20, shipy5);
      triangle(shipx5+300, shipy5, shipx5+150, shipy5-40, shipx5+150, shipy5);
    }
    //Ship 6
    if (ship6 == true) {
      if (body6 > 1) {
        fill(50);
        ellipse(upshipx6, upshipy6, 35, 35);
        ellipse(upshipx6, upshipy6, 100, 25);
      } else {
        fill(140);
        rect(upshipx6, upshipy6, 40, 15);
      }
    }
    //spaceship thrust
    shipx1 +=2; 
    shipx2 +=2; 
    shipx3 +=5; 
    shipx4 +=3; 
    shipx5 +=3;
    upshipx6 +=2;
    upshipy6 -=0.4;

    // teleportation
    if (shipx1 > 1100 ) {
      shipy1 = 60;
      shipx1 = -300;
    }
    if (shipx2 > 1100 ) {
      shipy2 = 100;
      shipx2 = -300;
    }
    if (shipx3 > 1100) {
      shipy3 = 200;
      shipx3 = -300;
    }
    if (shipx4 > 1100 ) {
      shipy4 = 400;
      shipx4 = -300;
    }
    if (shipx5 > 1100) {
      shipy5 = 550;
      shipx5 = -300;
    }
    if (upshipx6 > 900) {
      upshipy6 =  random(50, 520);
      upshipx6 = -100;
      body6 = random(0, 2);
    }
    if (counter>=800) {
      fill(200); 
      line(x, y, x+10, y);
    }
    if (counter == 800) {
      counter = 0;
    }
    counter++; 
    x+=speedx; 
    y+=speedy; 
    counter++;
    if (counter == 600) {
      counter = 0;
    }
    //cross hairs  
    fill(255, 255, 255);
    line(mouseX-30, mouseY, mouseX-2, mouseY);
    line(mouseX+30, mouseY, mouseX+2, mouseY);
    line(mouseX, mouseY-30, mouseX, mouseY-2);
    line(mouseX, mouseY+30, mouseX, mouseY+2);
    noFill();
    ellipse(mouseX, mouseY, 30, 30);

    //raygun
    fill(100);
    quad(mouseX-10, mouseY+20, mouseX-40, mouseY+200, mouseX+40, mouseY+200, mouseX+10, mouseY+20);
    fill(255, 255, 255);
    rect(0, 650, 800, 200);
    fill(50);
    textFont(font2);
    text("Score:" + score, 50, 750); 
    text("Big Ship Damage:" + bigshipDamage, 500, 750);
    textFont(titleFont);
    text("Hint: Target the front and rear of the biggest ship to destroy it! Make sure Big Ship Damage = 2", 50, 700);

    if (score == 6) {
      score = 0;
      bigshipDamage = 0;
      ship1 = true;
      ship2 = true;
      ship3 = true;
      ship4 = true;
      ship5 = true;
      ship6 = true;
    }
    break;
  case 4:
    background(255, 255, 255);
    textFont(font2);
    fill(50);
    text("Level 3: Press p to continue", 250, 400);
    text("Things are about to speed up ;)", 250, 360);
    break;
  case 5:
    image(img, 0, 0);
    fill(255, 255, 255);
    if ( score == 6) {
      Screenstate = 6;
    }
    //ship1
    //ship1 
    if ( ship1 == true) {
      if ( (int) random(0, 2) ==0) {
        fill(244, 89, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      } else {
        fill(244, 137, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      }
      //ship1 body
      fill(100);
      ellipse(shipx1, shipy1, 70, 20);

      // UFO1 Blinking lights 
      ellipse(shipx1, shipy1, 5, 5);
      if (counter < 300) {
        fill(255, 0, 0);
        ellipse(shipx1-10, shipy1, 5, 5);
      }
      if (counter>= 500) {
        fill(255, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }
      if (counter >= 300 && counter < 500) {
        fill(0, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }
    }

    if ( ship2 == true) {
      rect(shipx2, shipy2, 100, 50);
    }

    if (ship3 == true) {
      //ship3
      fill(44, 96, 193); 
      rect(shipx3, shipy3, 20, 40); 
      ellipse(shipx3+10, shipy3+4, 20, 15); 

      fill(244, 247, 64); 
      rect(shipx3+1, shipy3+1, 15, 10); 
      ellipse(shipx3+10, shipy3-8, 3, 3);
    }

    if (ship4 == true) {
      //ship4

      if (counter<200) {
        fill(87, 181, 16);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=200) {
        fill(211, 134, 25);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=400 && counter<=600) {
        fill(219, 30, 62);
        ellipse(shipx4, shipy4, 35, 35);
      }
      fill(100);
      rect(shipx4-30, shipy4-13, 60, 25);

      if (counter<200) {
        fill(35, 118, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
      if (counter>=200) {
        fill(227, 35, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      } 
      if (counter>=400 && counter<=600) {
        fill(234, 45, 35);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
    }
    if (ship5 == true) {
      fill(100);
      rect(shipx5, shipy5, 300, 100);
      triangle(shipx5+100, shipy5, shipx5+20, shipy5-60, shipx5+20, shipy5);
      triangle(shipx5+300, shipy5, shipx5+150, shipy5-40, shipx5+150, shipy5);
    }
//Ship 6
    if (ship6 == true) {
      if (body6 > 1) {
        fill(50);
        ellipse(upshipx6, upshipy6, 35, 35);
        ellipse(upshipx6, upshipy6, 100, 25);
      } else {
        fill(140);
        rect(upshipx6, upshipy6, 40, 15);
      }
    }
    //spaceship thrust
    shipx1 +=4; 
    shipx2 +=4; 
    shipx3 +=5; 
    shipx4 +=5; 
    shipx5 +=5;
    upshipx6 +=2;
    upshipy6 -=0.4;
    
    // teleportation
    if (shipx1 > 1100 ) {
      shipy1 = 60;
      shipx1 = -300;
    }
    if (shipx2 > 1100 ) {
      shipy2 = 100;
      shipx2 = -300;
    }
    if (shipx3 > 1100) {
      shipy3 = 200;
      shipx3 = -300;
    }
    if (shipx4 > 1100 ) {
      shipy4 = 400;
      shipx4 = -300;
    }
    if (shipx5 > 1100) {
      shipy5 = 550;
      shipx5 = -300;
    }
    if (upshipx6 > 900) {
      upshipy6 =  random(50, 520);
      upshipx6 = -100;
      body6 = random(0, 2);
    }
    if (counter>=800) {
      fill(200); 
      line(x, y, x+10, y);
    }
    if (counter == 800) {
      counter = 0;
    }
    counter++; 
    x+=speedx; 
    y+=speedy; 
    counter++;
    if (counter == 600) {
      counter = 0;
    }
    //cross hairs  
    fill(255, 255, 255);
    line(mouseX-30, mouseY, mouseX-2, mouseY);
    line(mouseX+30, mouseY, mouseX+2, mouseY);
    line(mouseX, mouseY-30, mouseX, mouseY-2);
    line(mouseX, mouseY+30, mouseX, mouseY+2);
    noFill();
    ellipse(mouseX, mouseY, 30, 30);

    //raygun
    fill(100);
    quad(mouseX-10, mouseY+20, mouseX-40, mouseY+200, mouseX+40, mouseY+200, mouseX+10, mouseY+20);

    fill(255, 255, 255);
    rect(0, 650, 800, 200);
    fill(50);
    textFont(font2);
    text("Score:" + score, 50, 750); 
    text("Big Ship Damage:" + bigshipDamage, 500, 750);
    textFont(titleFont);
    text("Hint: Target the front and rear of the biggest ship to destroy it! Make sure Big Ship Damage = 2", 50, 700);

    if (Screenstate == 7) {
      timer++;
    }
    if (Screenstate == 6) {
      bigshipDamage = 0;
      score = 0;
      ship1 = true;
      ship2 = true;
      ship3 = true;
      ship4 = true;
      ship5 = true;
      ship6 = true;
    }
    break;
  case 6:
    background(255, 255, 255);
    textFont(font2);
    fill(50);
    text(" Level 4: Timed event 1", 220, 350);
    textFont(titleFont);
    text("You have until the timer reaches 600 to destroy all the UFOs!", 150, 380);
    textFont(font2);
    text("Press p to begin.", 250, 440);
    break;
  case 7:
    image(img, 0, 0);
    fill(255, 255, 255);

    if ( score == 6) {
      Screenstate = 9;
    }
    if (timer == 600 && (ship1 == true || ship2 == true || ship3 == true ||ship4 == true || ship5 == true ||ship6 ==true)) {
      Screenstate = 8;
    }
    //ship1
    //ship1 
    if ( ship1 == true) {
      if ( (int) random(0, 2) ==0) {
        fill(244, 89, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      } else {
        fill(244, 137, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      }
      //ship1 body
      fill(100);
      ellipse(shipx1, shipy1, 70, 20);

      // UFO1 Blinking lights 
      ellipse(shipx1, shipy1, 5, 5);
      if (counter < 300) {
        fill(255, 0, 0);
        ellipse(shipx1-10, shipy1, 5, 5);
      }
      if (counter>= 500) {
        fill(255, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }
      if (counter >= 300 && counter < 500) {
        fill(0, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }
    }
    if ( ship2 == true) {
      rect(shipx2, shipy2, 100, 50);
    }

    if (ship3 == true) {
      //ship3
      fill(44, 96, 193); 
      rect(shipx3, shipy3, 20, 40); 
      ellipse(shipx3+10, shipy3+4, 20, 15); 

      fill(244, 247, 64); 
      rect(shipx3+1, shipy3+1, 15, 10); 
      ellipse(shipx3+10, shipy3-8, 3, 3);
    }

    if (ship4 == true) {
      //ship4

      if (counter<200) {
        fill(87, 181, 16);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=200) {
        fill(211, 134, 25);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=400 && counter<=600) {
        fill(219, 30, 62);
        ellipse(shipx4, shipy4, 35, 35);
      }
      fill(100);
      rect(shipx4-30, shipy4-13, 60, 25);

      if (counter<200) {
        fill(35, 118, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
      if (counter>=200) {
        fill(227, 35, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      } 
      if (counter>=400 && counter<=600) {
        fill(234, 45, 35);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
    }
    if (ship5 == true) {
      fill(100);
      rect(shipx5, shipy5, 300, 100);
      triangle(shipx5+100, shipy5, shipx5+20, shipy5-60, shipx5+20, shipy5);
      triangle(shipx5+300, shipy5, shipx5+150, shipy5-40, shipx5+150, shipy5);
    }
//Ship 6
    if (ship6 == true) {
      if (body6 > 1) {
        fill(50);
        ellipse(upshipx6, upshipy6, 35, 35);
        ellipse(upshipx6, upshipy6, 100, 25);
      } else {
        fill(140);
        rect(upshipx6, upshipy6, 40, 15);
      }
    }
    //spaceship thrust
    shipx1 +=4; 
    shipx2 +=4; 
    shipx3 +=6; 
    shipx4 +=6; 
    shipx5 +=6;
    upshipx6 +=2;
    upshipy6 -=0.4;
    timer +=1;

    // teleportation
    if (shipx1 > 1100 ) {
      shipy1 = 60;
      shipx1 = -300;
    }
    if (shipx2 > 1100 ) {
      shipy2 = 100;
      shipx2 = -300;
    }
    if (shipx3 > 1100) {
      shipy3 = 200;
      shipx3 = -300;
    }
    if (shipx4 > 1100 ) {
      shipy4 = 400;
      shipx4 = -300;
    }
    if (shipx5 > 1100) {
      shipy5 = 550;
      shipx5 = -300;
    }
    if (upshipx6 > 900) {
      upshipy6 =  random(50, 520);
      upshipx6 = -100;
      body6 = random(0, 2);
    }
    if (counter>=800) {
      fill(200); 
      line(x, y, x+10, y);
    }
    if (counter == 800) {
      counter = 0;
    }
    counter++; 
    x+=speedx; 
    y+=speedy; 
    counter++;
    if (counter == 600) {
      counter = 0;
    }
    //cross hairs  
    fill(255, 255, 255);
    line(mouseX-30, mouseY, mouseX-2, mouseY);
    line(mouseX+30, mouseY, mouseX+2, mouseY);
    line(mouseX, mouseY-30, mouseX, mouseY-2);
    line(mouseX, mouseY+30, mouseX, mouseY+2);
    noFill();
    ellipse(mouseX, mouseY, 30, 30);

    //raygun
    fill(100);
    quad(mouseX-10, mouseY+20, mouseX-40, mouseY+200, mouseX+40, mouseY+200, mouseX+10, mouseY+20);

    fill(255, 255, 255);
    rect(0, 650, 800, 200);
    fill(50);
    textFont(font2);
    text("Score:" + score, 50, 780); 
    text("Big Ship Damage:" + bigshipDamage, 500, 780);
    fill(255, 100, 150);
    text("Time:" + timer, 50, 700);
    fill(50);

    if (Screenstate == 9 || Screenstate == 8) {
      bigshipDamage = 0;
      timer = 0;
      score = 0;
      ship1 = true;
      ship2 = true;
      ship3 = true;
      ship4 = true;
      ship5 = true;
      ship6 = true;
    }
    break;
  case 8:
    background(255, 255, 255);
    fill(50);
    text("GAME OVER", 300, 400);
    text("Game Developer: Stefan LeClair", 200, 500);
    text("Written in Java with Processing", 200, 540);
    text("Press r to return to main menu", 200, 750);
    break;
  case 9:
    background(255, 255, 255);
    fill(50);
    textFont(font2);
    text("Now your getting the hang of it! ", 150, 360);
    text("Lets shorten the clock to 400!", 150, 400);
    text("Level 5: Press p to begin", 180, 500);
    break;
  case 10:


    image(img, 0, 0);
    fill(255, 255, 255);

    if ( score == 6) {
      Screenstate = 11;
    }
    if (timer == 400 && (ship1 == true || ship2 == true || ship3 == true ||ship4 == true || ship5 == true || ship6 == true)) {
      Screenstate = 8;
    }



    //ship1
    //ship1 
    if ( ship1 == true) {
      if ( (int) random(0, 2) ==0) {
        fill(244, 89, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      } else {
        fill(244, 137, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      }
      //ship1 body
      fill(100);
      ellipse(shipx1, shipy1, 70, 20);

      // UFO1 Blinking lights 
      ellipse(shipx1, shipy1, 5, 5);
      if (counter < 300) {
        fill(255, 0, 0);
        ellipse(shipx1-10, shipy1, 5, 5);
      }


      if (counter>= 500) {
        fill(255, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }


      if (counter >= 300 && counter < 500) {
        fill(0, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }
    }

    if ( ship2 == true) {
      rect(shipx2, shipy2, 100, 50);
    }

    if (ship3 == true) {
      //ship3
      fill(44, 96, 193); 
      rect(shipx3, shipy3, 20, 40); 
      ellipse(shipx3+10, shipy3+4, 20, 15); 

      fill(244, 247, 64); 
      rect(shipx3+1, shipy3+1, 15, 10); 
      ellipse(shipx3+10, shipy3-8, 3, 3);
    }

    if (ship4 == true) {
      //ship4

      if (counter<200) {
        fill(87, 181, 16);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=200) {
        fill(211, 134, 25);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=400 && counter<=600) {
        fill(219, 30, 62);
        ellipse(shipx4, shipy4, 35, 35);
      }
      fill(100);
      rect(shipx4-30, shipy4-13, 60, 25);

      if (counter<200) {
        fill(35, 118, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
      if (counter>=200) {
        fill(227, 35, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      } 
      if (counter>=400 && counter<=600) {
        fill(234, 45, 35);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
    }
    if (ship5 == true) {
      fill(100);
      rect(shipx5, shipy5, 300, 100);
      triangle(shipx5+100, shipy5, shipx5+20, shipy5-60, shipx5+20, shipy5);
      triangle(shipx5+300, shipy5, shipx5+150, shipy5-40, shipx5+150, shipy5);
    }
//Ship 6
    if (ship6 == true) {
      if (body6 > 1) {
        fill(50);
        ellipse(upshipx6, upshipy6, 35, 35);
        ellipse(upshipx6, upshipy6, 100, 25);
      } else {
        fill(140);
        rect(upshipx6, upshipy6, 40, 15);
      }
    }
    //spaceship thrust
    shipx1 +=5; 
    shipx2 +=5; 
    shipx3 +=5; 
    shipx4 +=6; 
    shipx5 +=6;
    upshipx6 +=3;
    upshipy6 -=0.4;
    timer +=1;

    // teleportation
    if (shipx1 > 1100 ) {
      shipy1 = 60;
      shipx1 = -300;
    }
    if (shipx2 > 1100 ) {
      shipy2 = 100;
      shipx2 = -300;
    }
    if (shipx3 > 1100) {
      shipy3 = 200;
      shipx3 = -300;
    }
    if (shipx4 > 1100 ) {
      shipy4 = 400;
      shipx4 = -300;
    }
    if (shipx5 > 1100) {
      shipy5 = 550;
      shipx5 = -300;
    }
if (upshipx6 > 900) {
      upshipy6 =  random(50, 520);
      upshipx6 = -100;
      body6 = random(0, 2);
    }
    if (counter>=800) {
      fill(200); 
      line(x, y, x+10, y);
    }
    if (counter == 800) {
      counter = 0;
    }
    counter++; 
    x+=speedx; 
    y+=speedy; 

    counter++;
    if (counter == 600) {
      counter = 0;
    }
    //cross hairs  
    fill(255, 255, 255);
    line(mouseX-30, mouseY, mouseX-2, mouseY);
    line(mouseX+30, mouseY, mouseX+2, mouseY);
    line(mouseX, mouseY-30, mouseX, mouseY-2);
    line(mouseX, mouseY+30, mouseX, mouseY+2);
    noFill();
    ellipse(mouseX, mouseY, 30, 30);

    //raygun
    fill(100);
    quad(mouseX-10, mouseY+20, mouseX-40, mouseY+200, mouseX+40, mouseY+200, mouseX+10, mouseY+20);

    fill(255, 255, 255);
    rect(0, 650, 800, 200);
    fill(50);
    text("Time:" + timer, 50, 700);  
    text("Score:" + score, 50, 750); 
    text("Big Ship Damage:" + bigshipDamage, 500, 750);
    if (Screenstate == 9) {
      bigshipDamage = 0;
      score = 0;
      ship1 = true;
      ship2 = true;
      ship3 = true;
      ship4 = true;
      ship5 = true;
      ship6 = true;
    }
    
    break;
  case 11:
    background(255, 255, 255);
    textFont(font2);
    fill(50);
    text("Final Level: Timer is set to 400. Good luck! >:D", 100, 400);
    text(" Press p to continue", 190, 460);
    break;
    case 12:
    image(img, 0, 0);
    fill(255, 255, 255);

    if ( score == 6) {
      Screenstate = 11;
    }
    if (timer == 400 && (ship1 == true || ship2 == true || ship3 == true ||ship4 == true || ship5 == true || ship6 == true)) {
      Screenstate = 8;
    }



    //ship1
    //ship1 
    if ( ship1 == true) {
      if ( (int) random(0, 2) ==0) {
        fill(244, 89, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      } else {
        fill(244, 137, 66); 
        rect(shipx1-5, shipy1-13, 10, 27);
      }
      //ship1 body
      fill(100);
      ellipse(shipx1, shipy1, 70, 20);

      // UFO1 Blinking lights 
      ellipse(shipx1, shipy1, 5, 5);
      if (counter < 300) {
        fill(255, 0, 0);
        ellipse(shipx1-10, shipy1, 5, 5);
      }


      if (counter>= 500) {
        fill(255, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }


      if (counter >= 300 && counter < 500) {
        fill(0, 255, 0);
        ellipse(shipx1+10, shipy1, 5, 5);
      } else {
        fill(125);
      }
    }

    if ( ship2 == true) {
      rect(shipx2, shipy2, 100, 50);
    }

    if (ship3 == true) {
      //ship3
      fill(44, 96, 193); 
      rect(shipx3, shipy3, 20, 40); 
      ellipse(shipx3+10, shipy3+4, 20, 15); 

      fill(244, 247, 64); 
      rect(shipx3+1, shipy3+1, 15, 10); 
      ellipse(shipx3+10, shipy3-8, 3, 3);
    }

    if (ship4 == true) {
      //ship4

      if (counter<200) {
        fill(87, 181, 16);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=200) {
        fill(211, 134, 25);
        ellipse(shipx4, shipy4, 35, 35);
      }
      if (counter>=400 && counter<=600) {
        fill(219, 30, 62);
        ellipse(shipx4, shipy4, 35, 35);
      }
      fill(100);
      rect(shipx4-30, shipy4-13, 60, 25);

      if (counter<200) {
        fill(35, 118, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
      if (counter>=200) {
        fill(227, 35, 234);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      } 
      if (counter>=400 && counter<=600) {
        fill(234, 45, 35);
        ellipse(shipx4+15, shipy4, 5, 5);
        ellipse(shipx4-15, shipy4, 5, 5);
      }
    }
    if (ship5 == true) {
      fill(100);
      rect(shipx5, shipy5, 300, 100);
      triangle(shipx5+100, shipy5, shipx5+20, shipy5-60, shipx5+20, shipy5);
      triangle(shipx5+300, shipy5, shipx5+150, shipy5-40, shipx5+150, shipy5);
    }
//Ship 6
    if (ship6 == true) {
      if (body6 > 1) {
        fill(50);
        ellipse(upshipx6, upshipy6, 35, 35);
        ellipse(upshipx6, upshipy6, 100, 25);
      } else {
        fill(140);
        rect(upshipx6, upshipy6, 40, 15);
      }
    }
    //spaceship thrust
    shipx1 +=5; 
    shipx2 +=5; 
    shipx3 +=6; 
    shipx4 +=6; 
    shipx5 +=6;
    upshipx6 +=5;
    upshipy6 -=0.4;
    timer +=1;

    // teleportation
    if (shipx1 > 1100 ) {
      shipy1 = 60;
      shipx1 = -300;
    }
    if (shipx2 > 1100 ) {
      shipy2 = 100;
      shipx2 = -300;
    }
    if (shipx3 > 1100) {
      shipy3 = 200;
      shipx3 = -300;
    }
    if (shipx4 > 1100 ) {
      shipy4 = 400;
      shipx4 = -300;
    }
    if (shipx5 > 1100) {
      shipy5 = 550;
      shipx5 = -300;
    }
if (upshipx6 > 900) {
      upshipy6 =  random(50, 520);
      upshipx6 = -100;
      body6 = random(0, 2);
    }
    if (counter>=800) {
      fill(200); 
      line(x, y, x+10, y);
    }
    if (counter == 800) {
      counter = 0;
    }
    counter++; 
    x+=speedx; 
    y+=speedy; 

    counter++;
    if (counter == 600) {
      counter = 0;
    }
    //cross hairs  
    fill(255, 255, 255);
    line(mouseX-30, mouseY, mouseX-2, mouseY);
    line(mouseX+30, mouseY, mouseX+2, mouseY);
    line(mouseX, mouseY-30, mouseX, mouseY-2);
    line(mouseX, mouseY+30, mouseX, mouseY+2);
    noFill();
    ellipse(mouseX, mouseY, 30, 30);

    //raygun
    fill(100);
    quad(mouseX-10, mouseY+20, mouseX-40, mouseY+200, mouseX+40, mouseY+200, mouseX+10, mouseY+20);

    fill(255, 255, 255);
    rect(0, 650, 800, 200);
    fill(50);
    text("Time:" + timer, 50, 700);  
    text("Score:" + score, 50, 750); 
    text("Big Ship Damage:" + bigshipDamage, 500, 750);
    if (Screenstate == 11 || Screenstate == 13) {
      bigshipDamage = 0;
      score = 0;
      timer = 0;
      ship1 = true;
      ship2 = true;
      ship3 = true;
      ship4 = true;
      ship5 = true;
      ship6 = true;
    }
  break;
  case 13:
  background(255,255,255);
  textFont(font2);
  text("Thanks for playing! Press r to return to main menu", 20,400);
  text("Game Developer: Stefan LeClair", 200, 500);
    text("Written in Java with Processing", 200, 540);
}
  
}

void keyPressed() {
  if (Screenstate == 0 && key == 'p') {
    Screenstate = 1;
  } else if (Screenstate == 1 && key == ' ') {
  } else if (Screenstate == 2 && key == 'p') {
    Screenstate = 3;
  }
  if (Screenstate == 4 && key == 'p') {
    Screenstate = 5;
  }
  if (Screenstate == 6 && key == 'p') {
    Screenstate = 7;
  }
  if (Screenstate == 11 && key == 'p') {
    Screenstate = 12;
  }
  
  
  // End game screen
  if ((Screenstate == 8|| Screenstate == 13) && key == 'r') {
    Screenstate = 0;
    score = 0;
    bigshipDamage = 0;
    ship1 = true;
    ship2 = true;
    ship3 = true;
    ship4 = true;
    ship5 = true;
    ship6 = true;
  }

  if (Screenstate == 9 && key == 'p') {
    Screenstate = 10;
  }
}

void mousePressed () {
  //Hit detection
  if (Screenstate == 1 || Screenstate == 3 ||Screenstate ==5 || Screenstate == 7 || Screenstate == 10 || Screenstate == 12) {
    if (ship1 == true) {
      if (mouseX<=shipx1+25 && mouseX>=shipx1-25
        && mouseY<=shipy1+25 && mouseY>=shipy1-25) {
        fill(255, 0, 0);
        text("hit!", shipx1, shipy1);
        ship1 = false;
        score++;
        fill(46, 123, 247);
        ellipse(shipx1, shipy1, 100, 100);
      }
    }
    if ( ship2 == true) {
      if (mouseX<=shipx2+100 && mouseX>=shipx2
        && mouseY<=shipy2+50 && mouseY>=shipy2) {
        ship2 = false;
        score++;
        //explosion! 
        fill(46, 123, 247);
        ellipse(shipx2, shipy2, 100, 100);
      }
    } 
    if (ship3 == true) {
      if (mouseX<=shipx3+25 && mouseX>=shipx3-25
        && mouseY<=shipy3+25 && mouseY>=shipy3-25) {
        ship3 =false;
        score++;
        fill(46, 123, 247);
        ellipse(shipx3, shipy3, 100, 100);
      }
    }
    if (ship4 == true) {
      if (mouseX<=shipx4+25 && mouseX>=shipx4-25
        && mouseY<=shipy4+25 && mouseY>=shipy4-25) {
        ship4 = false;
        score++;
        fill(46, 123, 247);
        ellipse(shipx4, shipy4, 100, 100);
      }
    }
    if (ship5 == true) {
      if (mouseX<=shipx5+150 && mouseX>=shipx5 && mouseY<=shipy5+100 && mouseY>=shipy5) {
        bigshipDamage++;
      }
      if (mouseX>=shipx5+150 && mouseX<=shipx5+300 && mouseY<=shipy5+100 && mouseY>=shipy5) {
        bigshipDamage++;
      }
      if (bigshipDamage == 2) {
        ship5 = false;
        score++;
        fill(46, 123, 247);
        ellipse(shipx5, shipy5, 100, 100);
      }
    }
    if (ship6 ==true) {

      if (mouseX <=upshipx6+50 && mouseX>=upshipx6-50 && mouseY<=upshipy6+25 && mouseY>= upshipy6) {
        score++;
        ship6 = false;
        fill(46, 123, 247);
        ellipse(upshipx6, upshipy6, 100, 100);
      }
    }
  }
}
