//varibles 
float speed,gap=400,size=150,gapx=800,dead,groundx,groundx1=1920,score,highscore=113*29;
//bird
float birdx=100,birdy=540,birdsize=100,yspeed,grav;
//block 1
float x1,y1=random(0,1080-gap);
//block 2
float x2,y2=random(0,1080-gap);
//block 3
float x3,y3=random(0,1080-gap);
PImage bird,up,down,ground,background,flappybird;
void setup() {
  fullScreen();
  reset();
  bird = loadImage("eevee.png");
  up = loadImage("up.png");
  down = loadImage("down.png");
  ground = loadImage("ground.png");
  background = loadImage("background.png");
  flappybird = loadImage("logo.png");
}
void draw() {
  imageMode(CORNER);
  rectMode(CORNER);
  image(background,0,0);
  groundx+=speed;
  groundx1+=speed;
  if (groundx+1950<0) groundx=width;
  image(ground,groundx,height-75);
  image(ground,groundx+325,height-75);
  image(ground,groundx+650,height-75);
  image(ground,groundx+975,height-75);
  image(ground,groundx+1300,height-75);
  image(ground,groundx+1625,height-75);
  if (groundx1+1950<0) groundx1=width;
  image(ground,groundx1,height-75);
  image(ground,groundx1+325,height-75);
  image(ground,groundx1+650,height-75);
  image(ground,groundx1+975,height-75);
  image(ground,groundx1+1300,height-75);
  image(ground,groundx1+1625,height-75);
    
  yspeed+=grav;
  birdy+=yspeed;  
  if (dead==0) if (keyPressed) {
    if (keyCode==UP) {
      yspeed=-15;
      grav = 1;
      speed = -5;
      yspeed = -15;
    }
  }
  imageMode(CENTER);
  image(bird,birdx,birdy);  
  //block 1
  x1+=speed;  
  fill(124,252,0);
  rect(x1,y1,size,-9999);
  rect(x1,y1+gap,size,9999);
  if (x1+size<0) {
    x1 = x3 + gapx;
    y1=random(0,1080-gap);
  }
  if (birdx>x1 && birdx<x1+size && birdy<y1 || birdx>x1 && birdx<x1+size && birdy>y1+gap) dead=1;
  if (birdx>x1&&birdx<x1+size&&dead==0) score+=1;  
  //block 2
  x2+=speed;  
  rect(x2,y2,size,-9999);
  rect(x2,y2+gap,size,9999);
  if (x2+size<0) {
    x2 = x1 + gapx;
    y2=random(0,1080-gap);
  }
  if (birdx>x2 && birdx<x2+size && birdy<y2 || birdx>x2 && birdx<x2+size && birdy>y2+gap) dead=1;
  if (birdx>x2&&birdx<x2+size&&dead==0) score+=1;  
  //block 3
  x3+=speed;  
  rect(x3,y3,size,-9999);
  rect(x3,y3+gap,size,9999);
  if (x3+size<0) {
    x3 = x2 + gapx;
    y3=random(0,1080-gap);
  }
  if (birdx>x3 && birdx<x3+size && birdy<y3 || birdx>x3 && birdx<x3+size && birdy>y3+gap) dead=1;
  if (birdx>x3&&birdx<x3+size&&dead==0) score+=1; 
  if (birdy>height-50) dead = 1;
  textAlign(CENTER);
  textSize(100);
  fill(255);
  if (dead==0) text(floor(score/29),width/2,100);    
  if (dead==1) {
    if (score>highscore)highscore=score;
    speed=0;
    if (birdy>height*2) {
      reset();
      grav = 0;
      textSize(30);
      rectMode(CENTER);
      fill(255,245,220);
      rect(width/2,height/2,320,170);
      fill(255,140,0);
      rect(width/2,height/2+350,200,100); 
      fill(0);
      text("Tu puntuación:   "+floor(score/29),width/2,height/2-50);
      text("Mejor puntuación:   "+floor(highscore/29),width/2,height/2+50);
      textSize(40);
      text("Restart",width/2,height/2+360);
      if (mouseX>width/2-100&&mouseX<width/2+100&&mouseY>height/2+300&&mouseY<height/2+400&&mousePressed) {
        reset();
        birdy=540;
        yspeed=0;
        dead=0;
        score=0;
      }
      image(flappybird,width/2,200,800,200);           
    }
  }  
}
void reset() {
  x1=width;
  x2=x1+gapx;
  x3=x2+gapx;
  grav = 0;
  speed=0;
}
