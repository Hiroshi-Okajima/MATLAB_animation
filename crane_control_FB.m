%%%%%%%%%%%%%%%%% �N���[���̐U��~�� %%%%%%%%%%%%%%%%%% 2022/7/15 ����
function crane_control

global A B F

vid = VideoWriter('crane_movie_FB.mp4','MPEG-4');
%vid.CompressionRatio = 1;

l = 10;
g = 9.8;
A = [0 0 1 0;0 0 0 1;0 0 0 0;0 -g/l 0 0];
B = [0;0;1;1/l];
pole = [-0.5+i -0.5-i -5 -7]
%pole = [-3 -2 -2+i -2-i]
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

open(vid);

figure(2)
T=round(length(t));
hold off
for n=1:T;
    xp = x(n,1);
    th = x(n,2);

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


text(-12,-10,'�ݒ肵����:')
text(-8,-10,s1)

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