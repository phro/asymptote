import graph3;
import solids;

currentlight=White;
defaultrender.merge=true;

size(10cm,0);

pair k=(1,0.2);
real r=abs(k);
real theta=angle(k);

real x(real t) { return r^t*cos(t*theta); }
real y(real t) { return r^t*sin(t*theta); }
real z(real t) { return 0; }

real s(real t) { return 2/(x(t)^2+y(t)^2+1); }

real u(real t) { return x(t)*s(t); }
real v(real t) { return y(t)*s(t); }
real w(real t) { return 1-s(t); }

real nb=3;
for (int i=0; i<12; ++i) draw((0,0,0)--nb*(Cos(i*30),Sin(i*30),0),yellow);
for (int i=0; i<=nb; ++i) draw(circle((0,0,0),i),lightgreen+white);


path3 p=graph(x,y,z,-200,40,operator ..);
path3 q=graph(u,v,w,-200,40,operator ..);

//revolution sph=sphere((0,0,0),15);
//draw(surface(sph),green+white+opacity(0.5));
draw(unitsphere,green+white+opacity(0.5));

draw(p,1bp+heavyred);
draw(q,1bp+heavyblue);

triple
	A=(0,0,1),
	B=(u(40),v(40),w(40)),
	C=(x(40),y(40),z(40));

path3 L=A--C;
draw(L,1bp+black);

pen p=fontsize(8pt);

dot("$(0,0,1)$",A,N,p);
dot("$(u,v,w)$",B,E,p);
dot("$(x,y,0)$",C,E,p);
