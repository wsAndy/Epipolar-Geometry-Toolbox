clc;
close all;
% load museum_data.mat

figure(1); hold on; grid on; axis equal;
view([0,-0.5,-1]);
xlabel('x');
ylabel('y');
zlabel('z');

f_3Dwf('b',1);    

color = ['r','g','b'];
cam_num = [9,15];
for i = 1:1:size(cam_num,2)
    
p3d_ = p3d(Vlist(:,cam_num(i)),:)';
f_scenepnt(p3d_,[color(i),'.'],1);
Hd = [cam{cam_num(i),2};0,0,0,1];
f_3Dframe(Hd,color(i),0.5,'_{cam}');
f_3Dcamera(Hd,color(i),0.1);
end
