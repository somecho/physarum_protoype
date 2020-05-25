trailmap t;

particle[] p;
int numParticles = 25000;

void setup(){

  size(600,400);
  
  t = new trailmap();

  p = new particle[numParticles];
  for(int i = 0; i < numParticles; i++){
    p[i] = new particle();
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
 


}
