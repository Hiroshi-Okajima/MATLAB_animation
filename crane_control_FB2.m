%%%%%%%%%%%%%%%%% クレーンの振れ止め %%%%%%%%%%%%%%%%%% 2022/7/15 岡島
function crane_control_FB2

global A B F

vid = VideoWriter('crane_movie_FB2.mp4','MPEG-4');
%vid.CompressionRatio = 1;

l = 8;
g = 9.8;
A = [0 0 1 0;0 0 0 1;0 0 0 0;0 -g/l 0 0];
B = [0;0;1;1/l];
C = [1 l 0 0];
sys = ss(A,B,C,0);
tf(sys)
%pole = [-1 -2 -3 -4]
pole = [-3 -2 -2+i -2-i]
F = -acker(A,B,pole)

s1 = num2str(pole);
s2 = num2str(F,3);
%Q = [10 0 0 0;0 20 0 0;0 0 3 0;0 0 0 6];
%R = 1
%[F,S,e] = lqr(A,B,Q,R)


x_syoki =   [5;0;0;0];

[t,x]=ode45(@main,0:0.01:10,x_syoki);

figure(1)
plot(t,x(:,1),'k-','LineWidth',2)
hold on
plot(t,x(:,2),'k-.','LineWidth',2)
lgd = legend('x','\theta');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
hold off

    
max_th = max(-min(x(:,2)),max(x(:,2)))

xf1 = [];


for j = 500:1000 %t_ev = 5秒
    xf1(j) = x(j,1)
end

max_x =  max(-min(xf1),max(xf1))


s3 = num2str(max_th,4);
s4 = num2str(max_x,4);
open(vid);

figure(2)
T=round(length(t));
hold off
for n=1:T;
    xp = x(n,1);
    th = x(n,2);

plot(xp-l*sin(th),0.6-l*cos(th),'ob','Color','#7E2F8E')
x1 = [xp+1 xp-1];
x2 = [xp+1 xp+1];
x3 = [xp-1 xp-1];
y1 = [0.1 0.1];
y2 = [1.1 1.1];
y3 = [0.1 1.1];
xbase = [-100 100];
ybase = [0 0];
xl = [xp xp-l*sin(th)];
yl = [0.6 0.6-l*cos(th)];
    line(x1,y1,'LineWidth',3,'Color','k');
    line(x1,y2,'LineWidth',3,'Color','k');
    line(x2,y3,'LineWidth',3,'Color','k');
    line(x3,y3,'LineWidth',3,'Color','k');
    line(xbase,ybase,'LineWidth',1,'Color','#D95319');
    line(xl,yl,'LineWidth',0.5,'Color','#7E2F8E');
    line([5 5],[0 5],'LineWidth',0.5,'Color','k','LineStyle','--');
    line([0 0],[0 5],'LineWidth',0.5,'Color','k','LineStyle','--');
%    hold on
%plot(r*cos(th)-0.4*sin(th),r*sin(th)+0.4*cos(th),'ob'); 
text(-2,6,'目標位置')
text(3,6,'初期位置')
text(-12,12,'クレーンの振れ止め制御')
text(-12,11,'制御目的：振れ角を大きくしない．目標位置に速く到達する')


text(-12,-10,'設定した極:')
text(-8,-10,s1)

text(-12,-11,'フィードバックゲインF:[')
text(-4.5,-11,s2)
text(8,-11,']')


text(-12,-9,'最大角度:')
text(-8,-9,s3)
text(-12,-8,'5秒時点以降のxの最大誤差:')
text(-1,-8,s4)


%text(-12,-11,'制御なし')


hold off
axis equal;
	 axis([-13 13 -13 13]);
     M = getframe(gcf);
writeVideo(vid,M);
end

close(vid);



end

function xd = main(t,x)
global A B F

u = F*x;
ax = A*x + B*u;
xd=zeros(4,1);
xd(1) = ax(1);
xd(2) = ax(2);
xd(3) = ax(3);
xd(4) = ax(4);
end 