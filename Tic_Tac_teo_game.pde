int score = 0;
boolean start = false;
int nClicks = 0;
boolean[] checked = new boolean[9];
boolean odd = true;
char[] image = new char[9];
boolean win = false;

boolean againstPC = true;

void setup() {
  size(500, 800);
  keyPressed();
}

void draw() {
  if (!start) reset();
  else {
    background(0);
    strokeWeight(1);
    stroke(100);
    fill(50);
    rect(10, 30, width - 20, height - 40, 50);
    fill(255);
    textSize(20);
    text("Wins: " + score, 10, 22);
    stroke(255);
    line(175, 150, 175, 650);
    line(325, 150, 325, 650);
    line(20, 325, 480, 325);
    line(20, 475, 480, 475);
    for (int i = 0; i < 9; i++) {
      if (checked[i]) {
        switch(i) {
        case 0:  
          if (image[0] == 'X') cross(0);
          else circle(0);
          break;
        case 1:  
          if (image[1] == 'X') cross(1);
          else circle(1);
          break;
        case 2:  
          if (image[2] == 'X') cross(2);
          else circle(2);
          break;
        case 3:  
          if (image[3] == 'X') cross(3);
          else circle(3);
          break;
        case 4:  
          if (image[4] == 'X') cross(4);
          else circle(4);
          break;
        case 5:  
          if (image[5] == 'X') cross(5);
          else circle(5);
          break;
        case 6:  
          if (image[6] == 'X') cross(6);
          else circle(6);
          break;
        case 7:  
          if (image[7] == 'X') cross(7);
          else circle(7);
          break;
        case 8:  
          if (image[8] == 'X') cross(8);
          else circle(8);
          break;
        }
      }
    }
    if (nClicks == 9 || win) {
      stroke(255);
      strokeWeight(1);
      text("Game Ended! Press ENTER to continue", 75, 100);
    }
    winCheck();
    if (againstPC && !win && !odd) computePlay();
  }
}

void keyPressed() {
  if (keyCode == ENTER) start = !start;

  if (!start) {
    if (keyCode == LEFT) {
      againstPC = true;
      start = true;
    }
    if (keyCode == RIGHT) 
    {
      againstPC = false;
      start = true;
    }
  }
}

void reset() {
  background(0);
  strokeWeight(1);
  stroke(100);
  fill(50);
  rect(10, 30, width - 20, height - 40, 50);
  fill(255);
  textSize(20);
  text("Wins: " + score, 10, 22);
  text("(Select desired option)", width / 2 - 110, 150);
  text("Computer", 80, 400);
  text("(PRESS LEFT)", 70, 420);
  text("Other Player", 320, 400);
  text("(PRESS RIGHT)", 310, 420);
  textSize(40);
  text("Play against:", width / 2 - 120, 120);
  textSize(15);
  text("Press ENTER to continue with last selecion", 100, height - 100);

  for (int i = 0; i < 9; i++) {
    checked[i] = false;
    image[i] = ' ';
  }
  if (win) {
    win = false;
    if (againstPC && !odd) score ++;
  }
  odd = true;
  nClicks = 0;
}

void computePlay() {
  if (image[0] == 'X') {
    if (image[1] == 'X' && !checked[2]) {
      cross(2);
      nClicks++;
      checked[2] = true;
      image[2] = 'X';
      odd = !odd;
      return;
    }
    if (image[2] == 'X' && !checked[1]) {
      cross(1);
      nClicks++;
      checked[1] = true;
      image[1] = 'X';
      odd = !odd;
      return;
    }
    if (image[4] == 'X' && !checked[8]) {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
    if (image[8] == 'X' && !checked[4]) {
      cross(4);
      nClicks++;
      checked[4] = true;
      image[4] = 'X';
      odd = !odd;
      return;
    }
    if (image[3] == 'X' && !checked[6]) {
      cross(6);
      nClicks++;
      checked[6] = true;
      image[6] = 'X';
      odd = !odd;
      return;
    }
    if (image[6] == 'X' && !checked[3]) {
      cross(3);
      nClicks++;
      checked[3] = true;
      image[3] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[1] == 'X') {
    if (image[2] == 'X' && !checked[0]) {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
    if (image[4] == 'X' && !checked[7]) {
      cross(7);
      nClicks++;
      checked[7] = true;
      image[7] = 'X';
      odd = !odd;
      return;
    }
    if (image[7] == 'X' && !checked[4]) {
      cross(4);
      nClicks++;
      checked[4] = true;
      image[4] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[2] == 'X') {
    if (image[4] == 'X' && !checked[6]) {
      cross(6);
      nClicks++;
      checked[6] = true;
      image[6] = 'X';
      odd = !odd;
      return;
    }
    if (image[6] == 'X' && !checked[4]) {
      cross(4);
      nClicks++;
      checked[4] = true;
      image[4] = 'X';
      odd = !odd;
      return;
    }
    if (image[5] == 'X' && !checked[8]) {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
    if (image[8] == 'X' && !checked[5]) {
      cross(5);
      nClicks++;
      checked[5] = true;
      image[5] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[3] == 'X') {
    if (image[4] == 'X' && !checked[5]) {
      cross(5);
      nClicks++;
      checked[5] = true;
      image[5] = 'X';
      odd = !odd;
      return;
    }
    if (image[5] == 'X' && !checked[4]) {
      cross(4);
      nClicks++;
      checked[4] = true;
      image[4] = 'X';
      odd = !odd;
      return;
    }
    if (image[6] == 'X' && !checked[0]) {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[4] == 'X') {
    if (image[5] == 'X' && !checked[3]) {
      cross(3);
      nClicks++;
      checked[3] = true;
      image[3] = 'X';
      odd = !odd;
      return;
    }
    if (image[6] == 'X' && !checked[2]) {
      cross(2);
      nClicks++;
      checked[2] = true;
      image[2] = 'X';
      odd = !odd;
      return;
    }
    if (image[7] == 'X' && !checked[1]) {
      cross(1);
      nClicks++;
      checked[1] = true;
      image[1] = 'X';
      odd = !odd;
      return;
    }
    if (image[8] == 'X' && !checked[0]) {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[5] == 'X') {
    if (image[8] == 'X' && !checked[2]) {
      cross(2);
      nClicks++;
      checked[2] = true;
      image[2] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[6] == 'X') {
    if (image[7] == 'X' && !checked[8]) {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
    if (image[8] == 'X' && !checked[7]) {
      cross(7);
      nClicks++;
      checked[7] = true;
      image[7] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[7] == 'X') {
    if (image[8] == 'X' && !checked[6]) {
      cross(6);
      nClicks++;
      checked[6] = true;
      image[6] = 'X';
      odd = !odd;
      return;
    }
  }

  if (image[0] == 'O') {
    if (image[1] == 'O' && !checked[2]) {
      cross(2);
      nClicks++;
      checked[2] = true;
      image[2] = 'X';
      odd = !odd;
      return;
    }
    if (image[2] == 'O' && !checked[1]) {
      cross(1);
      nClicks++;
      checked[1] = true;
      image[1] = 'X';
      odd = !odd;
      return;
    }
    if (image[4] == 'O' && !checked[8]) {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
    if (image[8] == 'O' && !checked[4]) {
      cross(4);
      nClicks++;
      checked[4] = true;
      image[4] = 'X';
      odd = !odd;
      return;
    }
    if (image[3] == 'O' && !checked[6]) {
      cross(6);
      nClicks++;
      checked[6] = true;
      image[6] = 'X';
      odd = !odd;
      return;
    }
    if (image[6] == 'O' && !checked[3]) {
      cross(3);
      nClicks++;
      checked[3] = true;
      image[3] = 'X';
      odd = !odd;
      return;
    }
  }

  if (image[1] == 'O') {
    if (image[2] == 'O' && !checked[0]) {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
    if (image[4] == 'O' && !checked[7]) {
      cross(7);
      nClicks++;
      checked[7] = true;
      image[7] = 'X';
      odd = !odd;
      return;
    }
    if (image[7] == 'O' && !checked[4]) {
      cross(4);
      nClicks++;
      checked[4] = true;
      image[4] = 'X';
      odd = !odd;
      return;
    }
  }

  if (image[2] == 'O') {
    if (image[4] == 'O' && !checked[6]) {
      cross(6);
      nClicks++;
      checked[6] = true;
      image[6] = 'X';
      odd = !odd;
      return;
    }
    if (image[6] == 'O' && !checked[4]) {
      cross(4);
      nClicks++;
      checked[4] = true;
      image[4] = 'X';
      odd = !odd;
      return;
    }
    if (image[5] == 'O' && !checked[8]) {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
    if (image[8] == 'O' && !checked[5]) {
      cross(5);
      nClicks++;
      checked[5] = true;
      image[5] = 'X';
      odd = !odd;
      return;
    }
  }

  if (image[3] == 'O') {
    if (image[4] == 'O' && !checked[5]) {
      cross(5);
      nClicks++;
      checked[5] = true;
      image[5] = 'X';
      odd = !odd;
      return;
    }
    if (image[5] == 'O' && !checked[4]) {
      cross(4);
      nClicks++;
      checked[4] = true;
      image[4] = 'X';
      odd = !odd;
      return;
    }
    if (image[6] == 'O' && !checked[0]) {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
  }

  if (image[4] == 'O') {
    if (image[5] == 'O' && !checked[3]) {
      cross(3);
      nClicks++;
      checked[3] = true;
      image[3] = 'X';
      odd = !odd;
      return;
    }
    if (image[6] == 'O' && !checked[2]) {
      cross(2);
      nClicks++;
      checked[2] = true;
      image[2] = 'X';
      odd = !odd;
      return;
    }
    if (image[7] == 'O' && !checked[1]) {
      cross(1);
      nClicks++;
      checked[1] = true;
      image[1] = 'X';
      odd = !odd;
      return;
    }
    if (image[8] == 'O' && !checked[0]) {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
  }

  if (image[5] == 'O') {
    if (image[8] == 'O' && !checked[2]) {
      cross(2);
      nClicks++;
      checked[2] = true;
      image[2] = 'X';
      odd = !odd;
      return;
    }
  }

  if (image[6] == 'O') {
    if (image[7] == 'O' && !checked[8]) {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
    if (image[8] == 'O' && !checked[7]) {
      cross(7);
      nClicks++;
      checked[7] = true;
      image[7] = 'X';
      odd = !odd;
      return;
    }
  }

  if (image[7] == 'O') {
    if (image[8] == 'O' && !checked[6]) {
      cross(6);
      nClicks++;
      checked[6] = true;
      image[6] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[0] == 'X') {
    if(!checked[1] && !checked[2]) {
      cross(2);
      nClicks++;
      checked[2] = true;
      image[2] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[3] && !checked[6]) {
      cross(6);
      nClicks++;
      checked[6] = true;
      image[6] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[4] && !checked[8]) {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[2] == 'X') {
    if(!checked[0] && !checked[1]) {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[4] && !checked[6]) {
      cross(6);
      nClicks++;
      checked[6] = true;
      image[6] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[5] && !checked[8]) {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[6] == 'X') {
    if(!checked[0] && !checked[3]) {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[2] && !checked[4]) {
      cross(2);
      nClicks++;
      checked[2] = true;
      image[2] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[7] && !checked[8]) {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[8] == 'X') {
    if(!checked[0] && !checked[4]) {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[2] && !checked[5]) {
      cross(2);
      nClicks++;
      checked[2] = true;
      image[2] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[6] && !checked[7]) {
      cross(6);
      nClicks++;
      checked[6] = true;
      image[6] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if (!checked[4]) {
    cross(4);
    nClicks++;
    checked[4] = true;
    image[4] = 'X';
    odd = !odd;
    return;
  }
  
  if(image[0] == 'O') {
    if(!checked[5] && !checked[6] && image[7] == 'O') {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
  }
  
  if(image[2] == 'O') {
    if(!checked[5] && !checked[8] && image[7] == 'O') {
      cross(8);
      nClicks++;
      checked[8] = true;
      image[8] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[0] && !checked[1] && image[3] == 'O') {
      cross(0);
      nClicks++;
      checked[0] = true;
      image[0] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[0] && !checked[1]) {
      cross(1);
      nClicks++;
      checked[1] = true;
      image[1] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[5] && !checked[8]) {
      cross(5);
      nClicks++;
      checked[5] = true;
      image[5] = 'X';
      odd = !odd;
      return;
    }
    if(!checked[4] && !checked[6]) {
      cross(4);
      nClicks++;
      checked[4] = true;
      image[4] = 'X';
      odd = !odd;
      return;
    }
  }

  for (int i = 0; i < 8; i++) {
    if (!checked[i]) {
      cross(i);
      nClicks++;
      checked[i] = true;
      image[i] = 'X';
      odd = !odd;
      return;
    }
  }
}

void winCheck() {
  if ( (image[0] == 'X' && image[1] == 'X' && image[2] == 'X') ||
    (image[0] == 'X' && image[4] == 'X' && image[8] == 'X') ||
    (image[0] == 'X' && image[3] == 'X' && image[6] == 'X') ||
    (image[1] == 'X' && image[4] == 'X' && image[7] == 'X') ||
    (image[2] == 'X' && image[4] == 'X' && image[6] == 'X') ||
    (image[2] == 'X' && image[5] == 'X' && image[8] == 'X') ||
    (image[3] == 'X' && image[4] == 'X' && image[5] == 'X') ||
    (image[6] == 'X' && image[7] == 'X' && image[8] == 'X') ||

    (image[0] == 'O' && image[1] == 'O' && image[2] == 'O') ||
    (image[0] == 'O' && image[4] == 'O' && image[8] == 'O') ||
    (image[0] == 'O' && image[3] == 'O' && image[6] == 'O') ||
    (image[1] == 'O' && image[4] == 'O' && image[7] == 'O') ||
    (image[2] == 'O' && image[4] == 'O' && image[6] == 'O') ||
    (image[2] == 'O' && image[5] == 'O' && image[8] == 'O') ||
    (image[3] == 'O' && image[4] == 'O' && image[5] == 'O') ||
    (image[6] == 'O' && image[7] == 'O' && image[8] == 'O')) win = true;
}

void circle(int box) {
  int x1 = 0, x2 = 0, y1 = 0, y2 = 0;
  switch(box) {
  case 0: 
    x1 = 20; 
    y1 = 150; 
    x2 = 175; 
    y2 = 325;
    break;
  case 1: 
    x1 = 175; 
    y1 = 150; 
    x2 = 325; 
    y2 = 325;
    break;
  case 2: 
    x1 = 325; 
    y1 = 150; 
    x2 = 475; 
    y2 = 325;
    break;
  case 3: 
    x1 = 20; 
    y1 =  315; 
    x2 = 175; 
    y2 = 485;
    break;
  case 4: 
    x1 = 175; 
    y1 = 315; 
    x2 = 325; 
    y2 = 485;
    break;
  case 5: 
    x1 = 325; 
    y1 = 315; 
    x2 = 475; 
    y2 = 485;
    break;
  case 6: 
    x1 = 20; 
    y1 = 475; 
    x2 = 175; 
    y2 = 650;
    break;
  case 7: 
    x1 = 175; 
    y1 = 475; 
    x2 = 325; 
    y2 = 650;
    break;
  case 8: 
    x1 = 325; 
    y1 = 475; 
    x2 = 475; 
    y2 = 650;
    break;
  }
  strokeWeight(10);
  stroke(255, 0, 0);
  noFill();
  ellipse(x1 + (x2 - x1) / 2, y1 + (y2 - y1) / 2, 75, 75);
}

void cross(int box) {
  int x1 = 0, x2 = 0, y1 = 0, y2 = 0;
  switch(box) {
  case 0: 
    x1 = 20; 
    y1 = 150; 
    x2 = 175; 
    y2 = 325;
    break;
  case 1: 
    x1 = 175; 
    y1 = 150; 
    x2 = 325; 
    y2 = 325;
    break;
  case 2: 
    x1 = 325; 
    y1 = 150; 
    x2 = 475; 
    y2 = 325;
    break;
  case 3: 
    x1 = 20; 
    y1 =  315; 
    x2 = 175; 
    y2 = 485;
    break;
  case 4: 
    x1 = 175; 
    y1 = 315; 
    x2 = 325; 
    y2 = 485;
    break;
  case 5: 
    x1 = 325; 
    y1 = 315; 
    x2 = 475; 
    y2 = 485;
    break;
  case 6: 
    x1 = 20; 
    y1 = 475; 
    x2 = 175; 
    y2 = 650;
    break;
  case 7: 
    x1 = 175; 
    y1 = 475; 
    x2 = 325; 
    y2 = 650;
    break;
  case 8: 
    x1 = 325; 
    y1 = 475; 
    x2 = 475; 
    y2 = 650;
    break;
  }
  strokeWeight(10);
  stroke(255, 0, 0);
  line(x1 + 50, y1 + 50, x2 - 50, y2 - 50);
  line(x2 - 50, y1 + 50, x1 + 50, y2 - 50);
}

void mouseClicked() {
  if (againstPC) {
    if (start && !win && (nClicks % 2) == 0) {
      if (mouseX > 20 && mouseX < 175) {
        if (mouseY > 150 && mouseY < 325) {
          if (!checked[0]) {
            checked[0] = true;
            if (odd) image[0] = 'O';
            else image[0] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 325 && mouseY < 475) {
          if (!checked[3]) {
            checked[3] = true;
            if (odd) image[3] = 'O';
            else image[3] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 475 && mouseY < 650) {
          if (!checked[6]) {
            checked[6] = true;
            if (odd) image[6] = 'O';
            else image[6] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
      }
      if (mouseX > 175 && mouseX < 325) {
        if (mouseY > 150 && mouseY < 325) {
          if (!checked[1]) {
            checked[1] = true;
            if (odd) image[1] = 'O';
            else image[1] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 325 && mouseY < 475) {
          if (!checked[4]) {
            checked[4] = true;
            if (odd) image[4] = 'O';
            else image[4] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 475 && mouseY < 650) {
          if (!checked[7]) {
            checked[7] = true;
            if (odd) image[7] = 'O';
            else image[7] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
      }
      if (mouseX > 325 && mouseX < 475) {
        if (mouseY > 150 && mouseY < 325) {
          if (!checked[2]) {
            checked[2] = true;
            if (odd) image[2] = 'O';
            else image[2] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 325 && mouseY < 475) {
          if (!checked[5]) {
            checked[5] = true;
            if (odd) image[5] = 'O';
            else image[5] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 475 && mouseY < 650) {
          if (!checked[8]) {
            checked[8] = true;
            if (odd) image[8] = 'O';
            else image[8] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
      }
    }
  } else {
    if (start && !win) {
      if (mouseX > 20 && mouseX < 175) {
        if (mouseY > 150 && mouseY < 325) {
          if (!checked[0]) {
            checked[0] = true;
            if (odd) image[0] = 'O';
            else image[0] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 325 && mouseY < 475) {
          if (!checked[3]) {
            checked[3] = true;
            if (odd) image[3] = 'O';
            else image[3] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 475 && mouseY < 650) {
          if (!checked[6]) {
            checked[6] = true;
            if (odd) image[6] = 'O';
            else image[6] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
      }
      if (mouseX > 175 && mouseX < 325) {
        if (mouseY > 150 && mouseY < 325) {
          if (!checked[1]) {
            checked[1] = true;
            if (odd) image[1] = 'O';
            else image[1] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 325 && mouseY < 475) {
          if (!checked[4]) {
            checked[4] = true;
            if (odd) image[4] = 'O';
            else image[4] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 475 && mouseY < 650) {
          if (!checked[7]) {
            checked[7] = true;
            if (odd) image[7] = 'O';
            else image[7] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
      }
      if (mouseX > 325 && mouseX < 475) {
        if (mouseY > 150 && mouseY < 325) {
          if (!checked[2]) {
            checked[2] = true;
            if (odd) image[2] = 'O';
            else image[2] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 325 && mouseY < 475) {
          if (!checked[5]) {
            checked[5] = true;
            if (odd) image[5] = 'O';
            else image[5] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
        if (mouseY > 475 && mouseY < 650) {
          if (!checked[8]) {
            checked[8] = true;
            if (odd) image[8] = 'O';
            else image[8] = 'X';
            odd = !odd;
            nClicks++;
          }
        }
      }
    }
  }
}
