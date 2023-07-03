%%%%%%%%%%%%%%%%% •sˆÀ’è—ë“_ %%%%%%%%%%%%%%%%%% 2023/7/3 ‰ª“‡
function nmp_zero

vid = VideoWriter('nmp_sys.mp4','MPEG-4');
vid.Quality = 100;

T = 0:0.01:2;

P = tf([-1 1],[0.1 1])*tf(1,[0.1 1])

open(vid);
%open(vid2);
for n = 1:10;

J1 = 2*rand;
J2 = 2*rand;
G = tf([J2 1],[J1 1]);

[y,t] = step(P*G,T)
for i=1:length(T);
figure(3)
plot(T(i),y(i),'ko');
hold on
plot(T,y);
hold on
axis([-0.1 2 -4 2]);
%axis equal
hold on

M = getframe(gcf);
writeVideo(vid,M);
end
end

close(vid);

end