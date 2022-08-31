%%%%%%%%%%%%%%%%% クレーンの振れ止め %%%%%%%%%%%%%%%%%% 2022/7/15 岡島
function crane_control_pid2

global A B Kp Ki

vid = VideoWriter('crane_movie_pid1.mp4','MPEG-4');
%vid.CompressionRatio = 1;

l = 10;
g = 9.8;
A = [0 0 1 0;0 0 0 1;0 0 0 0;0 -g/l 0 0];
B = [0;0;1;1/l];
Cx = [1 0 0 0];
Cth = [0 1 0 0];
Ccon = [1 l 0 0];

sys = ss(A,B,Cx,0);
tfx = tf(sys);
sys2 = ss(A,B,Cth,0);
tfth = tf(sys2);
sysco = ss(A,B,Ccon,0); %位置と角度の和を出力と捉えたシステム
tfc = tf(sysco);

tfx_out = minreal(tfx/tfc);
tfth_out = minreal(tfth/tfc);

[K, info] = pidtune(sys, 'PID');

G1 = feedback(tfc*K, 1)*tfx_out;
G2 = feedback(tfc*K, 1)*tfth_out;

t = 0:0.01:10;

xP = -5*step(G1,t);
xTH = -5*step(G2,t);

figure(1)
plot(t,xP(:,1)+5,'k-','LineWidth',2)
hold on
plot(t,xTH(:,1),'k-.','LineWidth',2)
lgd = legend('x','\theta');
lgd.FontSize = 12;
lgd.FontWeight = 'bold';
hold off

open(vid);

figure(2)
T=round(length(t));
hold off
for n=1:T;
    xp = xP(n,1)+5;
    th = xTH(n,1);

plot(xp-10*sin(th),0.6-10*cos(th),'ob','Color','#7E2F8E')
x1 = [xp+1 xp-1];
x2 = [xp+1 xp+1];
x3 = [xp-1 xp-1];
y1 = [0.1 0.1];
y2 = [1.1 1.1];
y3 = [0.1 1.1];
xbase = [-100 100];
ybase = [0 0];
xl = [xp xp-10*sin(th)];
yl = [0.6 0.6-10*cos(th)];
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


%text(-12,-10,'設定した極:')
%text(-8,-10,s1)

%text(-12,-11,'フィードバックゲインF:[')
%text(-4.5,-11,s2)
%text(8,-11,']')

%text(-12,-11,'制御なし')


hold off
axis equal;
	 axis([-13 13 -13 13]);
     M = getframe(gcf);
writeVideo(vid,M);
end

close(vid);

end
