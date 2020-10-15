import processing.serial.*; // imports library for serial communication

Serial myPort; // defines Object Serial

String data="0" ;

float temp;

void setup(){

 size(1000, 400);
 myPort = new Serial(this,"COM3", 9600); // starts the serial communication
 myPort.bufferUntil('\n');
 

}


void draw()
{
//fill background in gray
 fill (227,227,227);
 smooth();

 //build thermostat
 rectMode(CORNER);
 rect (50, 50, 20, 200);
 ellipse (60, 270, 40, 40);

 //build quicksilver reservoir
 fill(255, 0, 0);
 ellipse (60, 270, 20, 20);

 // quicksilver
 // rect(57, 57, 6, 200);
 try{
   
temp=Float.parseFloat(data);
println(temp);
if(temp>40.0){
  temp=0.0;
   }
}
catch(Exception e){
temp=0;
}
 //quicksilver
 float thermometer_value = map(temp,0,40,200,0);
 rect(57, 57 + thermometer_value, 6, (200 - thermometer_value));
 
 //draw font
// text ( "Temperature ", 35, 330);
 text (  temp , 35, 330);

 //define stroke
 stroke (255,0,0);
 strokeWeight(2);
 

}
void serialEvent(Serial myPort)
{
   data=myPort.readStringUntil('\n');
}
