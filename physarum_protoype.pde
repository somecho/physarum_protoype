trailmap t;
particle[] p;

int numParticles = 20000;

void setup(){

  size(600,400);
  
  t = new trailmap();
  p = new particle[numParticles];

  for(int i = 0; i < numParticles; i++){
    //spawn particles in circle
    float x = width/2 + random(100) * cos(radians(random(360)));
    float y = height/2 + random(100) * sin(radians(random(360)));
    p[i] = new particle(x,y);
    //initialize trailmap
    p[i].deposit(t);
  }
  
}

void draw(){
  background(0);

  for(int i = 0; i < numParticles; i++){
    //1. SENSE
    p[i].sense(t);
    //2. MOVE
    p[i].move();
    //3. DEPOSIT
    p[i].deposit(t);
  }

  //4.DIFFUSE TRAILMAP
  t.diffuse();

  //5.DECAY TRAILMAP
  t.decay();

  //6.RENDER TRAILMAP
  t.draw();

  if(frameCount%30 == 0){
    println(floor(frameRate));
  }
 
  if(mousePressed){

    for(int i = 0; i < numParticles; i++){
      p[i].reset();
    }
  }


}

