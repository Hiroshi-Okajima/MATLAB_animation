%%%%%%%%%%%%%%%%% �N���[���̐U��~�� %%%%%%%%%%%%%%%%%% 2022/7/15 ����
function crane_control_pid

global A B Kp Ki

vid = VideoWriter('crane_movie_pid1.mp4','MPEG-4');
%vid.CompressionRatio = 1;

l = 10;
g = 9.8;
A = [0 0 1 0;0 0 0 1;0 0 0 0;0 -g/l 0 0];
B = [0;0;1;1/l];
C = [1 0 0 0];
C2 = [0 1 0 0];

sys = ss(A,B,C,0);
tfx = tf(sys);
sys2 = ss(A,B,C2,0);
tfth = tf(sys2);

tfthx = minreal(tfth/tfx);

[K, info] = pidtune(sys, 'PID');

G1 = feedback(tfx*K, 1);
G2 = feedback(tfx*K, 1)*tfthx;


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
text(-2,6,'�ڕW�ʒu')
text(3,6,'�����ʒu')
text(-12,12,'�N���[���̐U��~�ߐ���')
text(-12,11,'����ړI�F�U��p��傫�����Ȃ��D�ڕW�ʒu�ɑ������B����')


%text(-12,-10,'�ݒ肵����:')
%text(-8,-10,s1)

%text(-12,-11,'�t�B�[�h�o�b�N�Q�C��F:[')
%text(-4.5,-11,s2)
%text(8,-11,']')

%text(-12,-11,'����Ȃ�')


hold off
axis equal;
	 axis([-13 13 -13 13]);
     M = getframe(gcf);
writeVideo(vid,M);
end

close(vid);

end
