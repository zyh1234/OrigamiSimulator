import processing.pdf.*;

float dim = 1000;
float scale = 10;

float angle = PI/3;

void setup(){
  
  size(450, 450);
  
  println(sin(angle));
  println(cos(angle));
  
  float sinAngle = sin(angle);
  float cosAngle = cos(angle);
  
  //tessellation
  beginRecord(PDF, "miura" + int(dim) + "x" + int(dim) + ".pdf"); 
  background(255);
  pushMatrix();
  translate(scale, scale);
  
//  stroke(0);
//  line(0,0,dim*scale, 0);
//  line(0,0,0,dim*scale);
//  line(dim*scale,dim*scale,dim*scale, 0);
//  line(dim*scale,dim*scale,0,dim*scale);
  
  for (int i=0;i<dim;i++){
    for (int j=0;j<dim;j++){
      if (i%2==1) {
        if (j%2==1) stroke(255,0,0);
        else stroke(0,0,255);
      } else {
        if (j%2==0) stroke(255,0,0);
        else stroke(0,0,255);
      }
      
      if (j==0) stroke(0);
      float horizOffset = 0;
      if (j%2==1) horizOffset = cosAngle*scale;
      line(i*scale+horizOffset, j*scale*sinAngle, (i+1)*scale+horizOffset, j*scale*sinAngle);
     
      if (i%2==0) stroke(255,0,0);
      else stroke(0,0,255);
      if (i==0) stroke(0);
      float horizOffsetNext = 0;
      if (j%2==0) horizOffsetNext = cosAngle*scale;
      line(i*scale+horizOffset, j*scale*sinAngle, i*scale+horizOffsetNext, (j+1)*scale*sinAngle);
     
    }
  }
  
  stroke(0);
  float i = dim;
  for (int j=0;j<dim;j++){
    float horizOffset = 0;
    float horizOffsetNext = 0;
    if (j%2==0) horizOffsetNext = cosAngle*scale;
    if (j%2==1) horizOffset = cosAngle*scale;
    line(i*scale+horizOffset, j*scale*sinAngle, i*scale+horizOffsetNext, (j+1)*scale*sinAngle);
  }
  float j = dim;
  for (i=0;i<dim;i++){
    float horizOffset = 0;
    if (j%2==1) horizOffset = cosAngle*scale;
    line(i*scale+horizOffset, j*scale*sinAngle, (i+1)*scale+horizOffset, j*scale*sinAngle);
  }

  endRecord();
  println("Finished.");
  exit();
}

