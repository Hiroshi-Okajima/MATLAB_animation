%%%%%%%%%%%%%%%%% シーソー %%%%%%%%%%%%%%%%%% 2021/4/25 岡島
function servo

vid = VideoWriter('newfile.mp4','MPEG-4');
%vid.CompressionRatio = 1;

open(vid);

x0=[1;0.1;0;0];
j=15;
m=5;
dr=5;
dth=10;
g=9.8;
L = 10;
A = [0 0 1 0;0 0 0 1;0 -g -dr/m 0;-m*g/j 0 0 -dth/j];
B = [0;0;0;1/j];
Q = [10 0 0 0;0 20 0 0;0 0 3 0;0 0 0 6];
R = 1
[K,S,e] = lqr(A,B,Q,R)
 
para=[j,m,dr,dth];

options=[];
[t,x]=ode45(@sub,0:0.03:15,x0,options,para,K);

figure(1)
plot(t,x(:,1));
hold on
plot(t,x(:,2));
hold on
plot(t,x(:,3));
hold on
plot(t,x(:,4));
hold off

figure(2)
T=round(length(t));
hold off
for n=1:T;
    plot(0,0,'ob')
    r = x(n,1);
    th = x(n,2);

%    line(a9,b2,'LineWidth',3);
%    hold on
%%%%%%%%%%%%%水位
%    sui1=[x(n,1) x(n,1)];
%    sui2=[x(n,2) x(n,2)];
%    sui3=[x(n,3) x(n,3)];
x1 = [-L*cos(th) L*cos(th)];
y1 = [-L*sin(th) L*sin(th)];
    line(x1,y1,'LineWidth',3);
    hold on
plot(r*cos(th)-0.4*sin(th),r*sin(th)+0.4*cos(th),'ob'); 
%hold on
%    plot(0,0,'ob')
hold off
	 axis([-13 13 -13 13]);
     M = getframe(gcf);
%drawnow;
writeVideo(vid,M);
end

close(vid);


function dx = sub(t,x,para,K);
dx=zeros(4,1);
j=para(1);
m=para(2);
dr=para(3);
dth=para(4);
u=0;
g=9.8
A = [0 0 1 0;0 0 0 1;0 -g -dr/m 0;-m*g/j 0 0 -dth/j];
B = [0;0;0;1/j];
Af = A - B*K;
eig(Af)
m = Af*x;
r=1;
dx(1)=m(1);
dx(2)=m(2);
dx(3)=m(3);
dx(4)=m(4);