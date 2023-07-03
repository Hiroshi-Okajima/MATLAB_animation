%%%%%%%%%%%%%%%%% ÉNÉåÅ[ÉìÇÃêUÇÍé~Çﬂ %%%%%%%%%%%%%%%%%% 2022/7/15 â™ìá
function lyapunov

vid = VideoWriter('Lyapunov_movie.mp4','MPEG-4');
vid.Quality = 100;

T = 0:0.01:4;

global A;
%A = [0 1;-7.1 -3.4]
A = [-0.1 1; -1 -0.1]
eig(A)

for i = 1:20
x0=[1*sin(2*pi*i/20),1*cos(2*pi*i/20)];
switch i
    case 1
[t,x1]=ode45(@function01,T,x0);
    case 2 
[t,x2]=ode45(@function01,T,x0);
    case 3
[t,x3]=ode45(@function01,T,x0);
    case 4 
[t,x4]=ode45(@function01,T,x0);
    case 5
[t,x5]=ode45(@function01,T,x0);
    case 6 
[t,x6]=ode45(@function01,T,x0);
    case 7
[t,x7]=ode45(@function01,T,x0);
    case 8 
[t,x8]=ode45(@function01,T,x0);
    case 9
[t,x9]=ode45(@function01,T,x0);
    case 10 
[t,x10]=ode45(@function01,T,x0);
    case 11
[t,x11]=ode45(@function01,T,x0);
    case 12
[t,x12]=ode45(@function01,T,x0);
    case 13
[t,x13]=ode45(@function01,T,x0);
    case 14
[t,x14]=ode45(@function01,T,x0);
    case 15
[t,x15]=ode45(@function01,T,x0);
    case 16
[t,x16]=ode45(@function01,T,x0); 
    case 17
[t,x17]=ode45(@function01,T,x0);
    case 18
[t,x18]=ode45(@function01,T,x0);
    case 19
[t,x19]=ode45(@function01,T,x0);
    case 20
[t,x20]=ode45(@function01,T,x0);
    otherwise
end
end 



open(vid);
%open(vid2);
n = 1;
for i=1:50;
figure(3)
plot(x1(n,1),x1(n,2),'ko')
hold on
plot(x2(n,1),x2(n,2),'ko')
hold on
plot(x3(n,1),x3(n,2),'ko')
hold on
plot(x4(n,1),x4(n,2),'ko')
hold on
plot(x5(n,1),x5(n,2),'ko')
hold on
plot(x6(n,1),x6(n,2),'ko')
hold on
plot(x7(n,1),x7(n,2),'ko')
hold on
plot(x8(n,1),x8(n,2),'ko')
hold on
plot(x9(n,1),x9(n,2),'ko')
hold on
plot(x10(n,1),x10(n,2),'ko')
hold on
plot(x11(n,1),x11(n,2),'ko')
hold on
plot(x12(n,1),x12(n,2),'ko')
hold on
plot(x13(n,1),x13(n,2),'ko')
hold on
plot(x14(n,1),x14(n,2),'ko')
hold on
plot(x15(n,1),x15(n,2),'ko')
hold on
plot(x16(n,1),x16(n,2),'ko')
hold on
plot(x17(n,1),x17(n,2),'ko')
hold on
plot(x18(n,1),x18(n,2),'ko')
hold on
plot(x19(n,1),x19(n,2),'ko')
hold on
plot(x20(n,1),x20(n,2),'ko')
hold on
axis([-1.5 1.5 -1.5 1.5])
axis equal
hold off

     M = getframe(gcf);
writeVideo(vid,M);
end


%figure(2)
%subplot(2,1,1)
Td=round(length(T));
hold off
for n=1:Td;
figure(3)
plot(x1(:,1),x1(:,2),'b--')
hold on
plot(x1(n,1),x1(n,2),'ko')
hold on
plot(x2(:,1),x2(:,2),'b--')
hold on
plot(x2(n,1),x2(n,2),'ko')
hold on
plot(x3(:,1),x3(:,2),'b--')
hold on
plot(x3(n,1),x3(n,2),'ko')
hold on
plot(x4(:,1),x4(:,2),'b--')
hold on
plot(x4(n,1),x4(n,2),'ko')
hold on
plot(x5(:,1),x5(:,2),'b--')
hold on
plot(x5(n,1),x5(n,2),'ko')
hold on
plot(x6(:,1),x6(:,2),'b--')
hold on
plot(x6(n,1),x6(n,2),'ko')
hold on
plot(x7(:,1),x7(:,2),'b--')
hold on
plot(x7(n,1),x7(n,2),'ko')
hold on
plot(x8(:,1),x8(:,2),'b--')
hold on
plot(x8(n,1),x8(n,2),'ko')
hold on
plot(x9(:,1),x9(:,2),'b--')
hold on
plot(x9(n,1),x9(n,2),'ko')
hold on
plot(x10(:,1),x10(:,2),'b--')
hold on
plot(x10(n,1),x10(n,2),'ko')
hold on
plot(x11(:,1),x11(:,2),'b--')
hold on
plot(x11(n,1),x11(n,2),'ko')
hold on
plot(x12(:,1),x12(:,2),'b--')
hold on
plot(x12(n,1),x12(n,2),'ko')
hold on
plot(x13(:,1),x13(:,2),'b--')
hold on
plot(x13(n,1),x13(n,2),'ko')
hold on
plot(x14(:,1),x14(:,2),'b--')
hold on
plot(x14(n,1),x14(n,2),'ko')
hold on
plot(x15(:,1),x15(:,2),'b--')
hold on
plot(x15(n,1),x15(n,2),'ko')
hold on
plot(x16(:,1),x16(:,2),'b--')
hold on
plot(x16(n,1),x16(n,2),'ko')
hold on
plot(x17(:,1),x17(:,2),'b--')
hold on
plot(x17(n,1),x17(n,2),'ko')
hold on
plot(x18(:,1),x18(:,2),'b--')
hold on
plot(x18(n,1),x18(n,2),'ko')
hold on
plot(x19(:,1),x19(:,2),'b--')
hold on
plot(x19(n,1),x19(n,2),'ko')
hold on
plot(x20(:,1),x20(:,2),'b--')
hold on
plot(x20(n,1),x20(n,2),'ko')
hold on
axis([-1.5 1.5 -1.5 1.5])
axis equal
hold off

     M = getframe(gcf);
writeVideo(vid,M);
end

Q = eye(2)
P=lyap(A',Q)
[X1,X2] = meshgrid(-2:0.02:2);
Z = P(1,1)*X1.^2 + P(2,2)*X2.^2 + 2*P(1,2)*X1.*X2;


n = 1;
for i=1:50;
figure(3)
contour(X1,X2,Z,50);
hold on
plot(x1(n,1),x1(n,2),'ko')
hold on
plot(x2(n,1),x2(n,2),'ko')
hold on
plot(x3(n,1),x3(n,2),'ko')
hold on
plot(x4(n,1),x4(n,2),'ko')
hold on
plot(x5(n,1),x5(n,2),'ko')
hold on
plot(x6(n,1),x6(n,2),'ko')
hold on
plot(x7(n,1),x7(n,2),'ko')
hold on
plot(x8(n,1),x8(n,2),'ko')
hold on
plot(x9(n,1),x9(n,2),'ko')
hold on
plot(x10(n,1),x10(n,2),'ko')
hold on
plot(x11(n,1),x11(n,2),'ko')
hold on
plot(x12(n,1),x12(n,2),'ko')
hold on
plot(x13(n,1),x13(n,2),'ko')
hold on
plot(x14(n,1),x14(n,2),'ko')
hold on
plot(x15(n,1),x15(n,2),'ko')
hold on
plot(x16(n,1),x16(n,2),'ko')
hold on
plot(x17(n,1),x17(n,2),'ko')
hold on
plot(x18(n,1),x18(n,2),'ko')
hold on
plot(x19(n,1),x19(n,2),'ko')
hold on
plot(x20(n,1),x20(n,2),'ko')
hold on
axis([-1.5 1.5 -1.5 1.5])
axis equal
hold off

     M = getframe(gcf);
writeVideo(vid,M);
end


%figure(2)
%subplot(2,1,1)
Td=round(length(T));
hold off
for n=1:Td;
figure(3)
contour(X1,X2,Z,50);
hold on
plot(x1(:,1),x1(:,2),'b--')
hold on
plot(x1(n,1),x1(n,2),'ko')
hold on
plot(x2(:,1),x2(:,2),'b--')
hold on
plot(x2(n,1),x2(n,2),'ko')
hold on
plot(x3(:,1),x3(:,2),'b--')
hold on
plot(x3(n,1),x3(n,2),'ko')
hold on
plot(x4(:,1),x4(:,2),'b--')
hold on
plot(x4(n,1),x4(n,2),'ko')
hold on
plot(x5(:,1),x5(:,2),'b--')
hold on
plot(x5(n,1),x5(n,2),'ko')
hold on
plot(x6(:,1),x6(:,2),'b--')
hold on
plot(x6(n,1),x6(n,2),'ko')
hold on
plot(x7(:,1),x7(:,2),'b--')
hold on
plot(x7(n,1),x7(n,2),'ko')
hold on
plot(x8(:,1),x8(:,2),'b--')
hold on
plot(x8(n,1),x8(n,2),'ko')
hold on
plot(x9(:,1),x9(:,2),'b--')
hold on
plot(x9(n,1),x9(n,2),'ko')
hold on
plot(x10(:,1),x10(:,2),'b--')
hold on
plot(x10(n,1),x10(n,2),'ko')
hold on
plot(x11(:,1),x11(:,2),'b--')
hold on
plot(x11(n,1),x11(n,2),'ko')
hold on
plot(x12(:,1),x12(:,2),'b--')
hold on
plot(x12(n,1),x12(n,2),'ko')
hold on
plot(x13(:,1),x13(:,2),'b--')
hold on
plot(x13(n,1),x13(n,2),'ko')
hold on
plot(x14(:,1),x14(:,2),'b--')
hold on
plot(x14(n,1),x14(n,2),'ko')
hold on
plot(x15(:,1),x15(:,2),'b--')
hold on
plot(x15(n,1),x15(n,2),'ko')
hold on
plot(x16(:,1),x16(:,2),'b--')
hold on
plot(x16(n,1),x16(n,2),'ko')
hold on
plot(x17(:,1),x17(:,2),'b--')
hold on
plot(x17(n,1),x17(n,2),'ko')
hold on
plot(x18(:,1),x18(:,2),'b--')
hold on
plot(x18(n,1),x18(n,2),'ko')
hold on
plot(x19(:,1),x19(:,2),'b--')
hold on
plot(x19(n,1),x19(n,2),'ko')
hold on
plot(x20(:,1),x20(:,2),'b--')
hold on
plot(x20(n,1),x20(n,2),'ko')
hold on
axis([-1.5 1.5 -1.5 1.5])
axis equal
hold off

     M = getframe(gcf);
writeVideo(vid,M);
end

close(vid);

end

function dx = function01(~,x)
global A;
dx = zeros(2,1);
dx(1) = A(1,:)*x;
dx(2) = A(2,:)*x;
end