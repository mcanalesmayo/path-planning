% draw_map variable MAP
% dibuja un mapa MAP existente en memoria
% Obstacle=-1,Target = 0, Robot_inicial=1, libre=2

MAX_X=size(MAP,1);
MAX_Y=size(MAP,2);
MAX_VAL=MAX_X;
axis equal
grid on;
hold on;

[i,j]=find(MAP==-1);
plot(i+.5,j+.5,'ro');  %draw obstacles
plot(xStart+.5,yStart+.5,'bo');  %draw initial position
MAP(xStart,yStart)=1;
plot(xTarget+.5,yTarget+.5,'kd');   % draw target
MAP(xTarget,yTarget)=0;
escena(yStart,xStart)=50;
escena(yTarget,xTarget)=70;
pcolor(escena)

xval=xStart; yval=yStart;