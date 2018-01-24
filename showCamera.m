close all;
addpath(genpath(cd))
clc;
load cam.mat

scale=1;
BASE = scale*([0 1 0 0 0 0;
               0 0 0 1 0 0;
               0 0 0 0 0 1]);
figure('units','normalized','outerposition',[0 0 1 1])
plot3(BASE(1,:),BASE(3,:),-BASE(2,:),'b-','linewidth',2);
hold on;
axis equal;
rotate3d on;
grid on;

for i=1:8
M=cam{i,2};
R=M(:,1:3);T=M(:,4);

% ShowCam(R,T,scale,'y-');
Hd = [M;0,0,0,1];
f_3Dcamera(Hd,'r',0.1);  % here!!!
f_3Dframe(Hd,'r',0.5,['_{cam}',num2str(i)])

Zc= [0,0,4]';
Zc1 = R*Zc+T;
Oc = [0,0,0]';
Oc1 = R*Oc+T;
plot3([Oc1(1),Zc1(1)],[Oc1(2),Zc1(2)],[Oc1(3),Zc1(3)],'--g')
text(Zc1(1),Zc1(2),Zc1(3),strcat('cam',['_{',num2str(i),'}']) );

end

%%
Hd = [eye(3),[1;0;-0.2];0,0,0,1];
f_3Dcamera(Hd,'g',0.04)




