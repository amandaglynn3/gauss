esp0= 8.85*10^-12; k=1/(4*pi*esp0);
q1=9*10^-9;
syms x y z;
qx=0;
qy=0;
qz=0;
E=@(x,y,z) k*q1/((x-qx)^2 +(y-qy)^2 +(z-qz)^2)^(3/2)*[x-qx, y-qy, z-qz];
I=[1,0,0]; J=[0,1,0]; K=[0,0,1];
Eup=dot(K, E(x,y,1));
Edown= dot (-K, E(x,y,-1));
Eleft= dot (-J, E(x,-1,z));
Eright= dot (J, E(x,1,z));
Efront= dot(I, E(1,y,z));
Eback= dot( -I, E(-1,y,z));
PIup=int(int(Eup,x,-1,1),y,-1,1);
PIdown=int(int(Edown, x, -1,1),y,-1,1);
PIleft=int(int(Eleft, x, -1,1),z,-1,1);
PIright=int(int(Eright, x, -1,1),z,-1,1);
PIfront=int(int(Efront, y, -1,1),z,-1,1);
PIback=int(int(Eback, y, -1,1),z,-1,1);
disp('Up');
vpa(PIup,10)
disp('Down');
vpa(PIdown,10)
disp('Left');
vpa(PIleft,10)
disp('Right');
vpa(PIright,10)
disp('Front');
vpa(PIfront,10)
disp('Back');
vpa(PIback,10)
All_PI=PIup+PIdown+PIleft+PIright+PIfront+PIback;
disp('All');
vpa(All_PI,10)
disp('Charge');
vpa(esp0*All_PI,5)