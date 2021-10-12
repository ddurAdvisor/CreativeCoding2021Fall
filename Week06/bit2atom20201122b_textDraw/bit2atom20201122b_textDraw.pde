float x = 0, y = 0;
float stepSize = 5.0;
String[] fontList;//read out fonts installed in the system
int fontIndex=0;//the index of font in fontList
String selectedFile;
String selectedFileName;
String[] rawtext;//declare a String for txt file loaded
String letters;
int fontSizeMin = 20;
float angleDistortion = 0.0;
int imgColor;
int counter = 0;
PFont myFont=createFont("微软雅黑",24);

void setup() {
  size(1280, 720);
  background(255);
  selectInput("Select a file to process:", "loadFile");
  //String loadPath = selectInput(); //load txt file as source
  //String loadPath = loadStrings("textbrush.txt");

  fontList=PFont.list();//read out fonts in system

  x = mouseX;
  y = mouseY;

  cursor(CROSS);
}

void loadFile(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {  
    selectedFile = selection.getAbsolutePath();
    selectedFileName = selection.getName();
    rawtext = loadStrings(selectedFile);
    letters=join(rawtext, "");
  }
}

void draw() {
  fill(255);//background color
  //background color pallette
  stroke(255);
  rectMode(CENTER);
  rect(width-150,70,100,100);
  fill(102);//front color
  //front color pallette
  noStroke();
  rectMode(CENTER);
  rect(width-150,70,50,50);
  
//draw text-strings brushs
  if (mousePressed) {
    float pressure=(abs(mouseX-pmouseX)+abs(mouseY-pmouseY))/2;
    float d = dist(x,y, mouseX,mouseY);
    textFont(myFont,fontSizeMin+pressure);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x); 

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      
//text-strings brushs color
      fill(0);
      textAlign(LEFT);
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize; 
    }
  }
}

//void draw() {
//  myFont1=createFont(fontList[fontIndex], 160, true);//processing 1.5 is still has bug in support font antialias, 
//  //so preset the font size with a large size can keep the font 
//  //to be displayed with good look.
//  myFont2=createFont("微软雅黑", 12, true);

//  //draw text-strings brushs
//  if (mousePressed) {
//    //float pressure= 100*tablet.getPressure();
//    float pressure=(abs(mouseX-pmouseX)+abs(mouseY-pmouseY))/2;
//    float d = dist(x, y, mouseX, mouseY);
//    textFont(myFont1, pressure);
//    char newLetter = letters.charAt(counter);
//    stepSize = textWidth(newLetter);

//    //getImageColor();
//    //displayImage();

//    if (d > stepSize) {
//      float angle = atan2(mouseY-y, mouseX-x); 

//      pushMatrix();
//      translate(x, y);
//      rotate(angle + random(angleDistortion));

//      //text-strings brushs color
//      //fill(myColorR,myColorG,myColorB,myColorA);
//      fill(0, 50);
//      textAlign(LEFT);
//      text(newLetter, 2, 2);

//      fill(imgColor);
//      textAlign(LEFT);
//      text(newLetter, 0, 0);
//      popMatrix();

//      counter++;
//      if (counter > letters.length()-1) counter = 0;

//      x = x + cos(angle) * stepSize;
//      y = y + sin(angle) * stepSize;
//    }
//  }
//}
