clear all
obj = VideoReader('E:\课程\光子学\blood.mp4');
numFrames = obj.NumberOfFrames;
r = []; 
g = [];
b = [];
for i = 1 : numFrames 
    frame = read(obj, i);
    image_r=frame(:,:,1);
    image_g=frame(:,:,2); 
    image_b=frame(:,:,3);
    R=mean(image_r(:)); 
    G=mean(image_g(:));
    B=mean(image_b(:));
    r(i)=R;
    g(i)=G;
    b(i)=B;
    imwrite(frame,strcat('E:\课程\光子学\blood.mp4',num2str(i),'.jpg'),'jpg');
end
y1=r./g;
y2=r./b;
plot(1:numFrames,y1,'r', 1:numFrames,y2,'g');
 