
load depth_out_oneimg.mat
[rows, cols, ~] = size(depth_out);

% P = zeros(3,rows*cols,'double');
P = zeros(3,10,'double');
P0 = zeros(3,1,'double');
index = 0;
index_0 = 0;
for x = 1:1:rows
    for y = 1:1:cols
        if depth_out(x,y) ~= 0
            
        index = index + 1;
        P(1,index) = x;
        P(2,index) = -y;
        P(3,index) = depth_out(x,y);
        else
        index0 = index + 1;
        P0(1,index0) = x;
        P0(2,index0) = -y;
        P0(3,index0) = depth_out(x,y);
        end
    end
end        

figure(1);hold on; grid on;

xlabel('x');
ylabel('y');
zlabel('z');

f_scenepnt(P,['r.']);
f_scenepnt(P0,['b.']);
view(-83,-10);

figure;
PP =P';
pcshow([PP(:,1),-PP(:,2), PP(:,3)] );
view([90,90]);

