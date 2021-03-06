int BrushSize = 50 ;
color BrushColor = color(0, 0, 0);
color BackgroundColor  = color(255, 255, 255) ;
int mouseWasX = 0 ;
int mouseWasY = 0 ;
boolean WasFocused = false;
boolean WasWasFocused = false ;
boolean WasPressed=false;
boolean DraggingBrushSize=false;
boolean DraggingColors=false;
boolean DraggingPaintBrush=false;

void setup() {
  size(700, 700);
  smooth();
  //noStroke();
  background(BackgroundColor);
}

void keyPressed()
{
  if (key == '1') {
    BrushSize = 10 ;
  } else if (key == '2') {
    BrushSize = 40 ;
  } else if (key == '3') {
    BrushSize = 60;
  } else if (key == '4') {
    BrushSize = 80;
  } else if (key == '5') {
    BrushSize = 100;
  } else if (key == 'q') {
    BrushColor = color(156, 4, 9 );
  } else if (key== 'w') {
    BrushColor = color(232, 154, 28 );
  } else if (key== 'e') {
    BrushColor = color(255, 215, 50);
  } else if (key== 'r') {
    BrushColor = color(142, 209, 19 );
  } else if (key == 's') {
    saveFrame("clemDoodle saves/betterthanphotoshop-######.png");
  } else if (key== 'd') {
    BrushColor = BackgroundColor  ;
  }
}

void draw() {   
//constants  
  float infosize=40;
  int rainbowheight= 60;

  if (mousePressed==false) {
    DraggingBrushSize=false;
    DraggingColors=false;
    DraggingPaintBrush=false;
  }
  //print(focused + " " + mouseX + " " + mouseY + "\n");
  
  boolean infoHovered=false;
  if ( mouseX>= width-infosize-infosize/2 && mouseX<= width-infosize/2 
    && mouseY >= height-infosize-infosize/2 && mouseY <= height-infosize/2) {
    infoHovered=true;
  }
  
  if (mousePressed && WasFocused == true && focused == true && 
    WasWasFocused == true && DraggingBrushSize==false &&  infoHovered==false && DraggingColors ==false&&
    mouseY> rainbowheight) {
    stroke(BrushColor);
    strokeWeight(BrushSize);
    line(mouseWasX, mouseWasY, mouseX, mouseY);
    if (WasPressed==false) {
      DraggingPaintBrush=true;
    }
    //ellipse(mouseX, mouseY, BrushSize, BrushSize);
  }



  //rainbow
  noStroke();
  int brushselectorwidth= 100;
  float numcolors = 255;
  colorMode(HSB, numcolors, 100, 100);
  float rectwidth = (width-brushselectorwidth)/numcolors ;
  int i = 0 ;
  while (i < numcolors) {
    color c = color(i, 99, 99);
    //if mousePressed && mouseX ==
    fill(c);                   
    rect(rectwidth*i, 0, rectwidth, rainbowheight );
    if (mouseX >= rectwidth*i && mouseX <= rectwidth*i + rectwidth && 
      mouseY >= 0 && mouseY <= rainbowheight && mousePressed && 
      DraggingBrushSize==false && DraggingPaintBrush==false) {
      BrushColor = c ;
      if ( WasPressed == false) {
        DraggingColors=true;
      }
    }
    i=i+1 ;
  }
  if ( mousePressed && mouseX > (width - brushselectorwidth) &&
    mouseX < width && mouseY < rainbowheight) 
  { 
    if ( WasPressed == false) {
      DraggingBrushSize= true;
    }
  }

  if ( DraggingBrushSize==true) {
    float Xm=mouseX ;
    float Xc=width - brushselectorwidth/2;
    float Ym=mouseY;
    float Yc=rainbowheight/2;

    float a= abs(Xm-Xc);
    float b= abs(Ym-Yc);
    float c= sqrt(a*a+b*b);

    BrushSize =  round(2*c) ;
  }

  // brush sample
  fill(0, 0, 99); //white in hsb
  rect(width - brushselectorwidth, 0, brushselectorwidth, rainbowheight);
  clip(width - brushselectorwidth, 0, brushselectorwidth, rainbowheight);
  fill(BrushColor);
  ellipse(width - brushselectorwidth/2, rainbowheight/2, BrushSize, BrushSize);
  noClip();

  colorMode(RGB, 255);

stroke(0);
  strokeWeight(2);
  fill(255);
//circle hittest
  if ( infoHovered==true ) {
    strokeWeight(6);
    if(WasPressed==false && mousePressed==true){
      //print("hi");
      javax.swing.JOptionPane.showMessageDialog(null, "Thanks for purchasing #betterthanphotoshop!"); 
    }
  }
  ellipse( height-infosize, height-infosize, infosize, infosize);
  
  
  
  mouseWasX = mouseX ;
  mouseWasY = mouseY ;
  WasWasFocused = WasFocused ;
  WasFocused = focused ;
  WasPressed = mousePressed;
  //saveFrame("betterthanphotoshop-######.png");

  
}

