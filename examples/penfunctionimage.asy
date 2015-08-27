import palette;

size(200);

real fracpart(real x) {return (x-floor(x));}

pair pws(pair z) {
  pair w=(z+exp(pi*I/5)/0.9)/(1+z/0.9*exp(-pi*I/5));
  return exp(w)*(w^3-0.5*I);
}

int N=1024;

pair a=(-1,-1);
pair b=(0.5,0.5);
real dx=(b-a).x/N;
real dy=(b-a).y/N;

int maxdepth=5;
int mandel(pair c, int depth=5) {
  pair z=c;
  for(int i=0; i<depth; ++i) {
    if(abs(z) >= 2) return i;
    z = z^2 + c;
  }
  return depth;
}

pen f(real u, real v) {

  return hsv(0,0,sqrt(modulus));
}

image(f,N,N,(0,0),(300,300),antialias=true);
