load op_neumannf.txt
Z1 = op_neumannf(:,3);
z2 = reshape(Z1,[200,200]);

x = linspace(-1.5,1.5,200);
y = linspace(-2,2,200);

figure(1)
%z2 = peaks(300);
surf(x,y,z2,'EdgeColor','none')
%surf(x,y,gray(:,:,1)','EdgeColor','none')
%colormap gray
colormap ([0.5 0.5 0.5]);
material dull;
%material ([0 1 0.1]);
%set(gca,'visible','off')
grid on;
set(gca,'color','black')
%set(gcf,'color','black')
light('Position',[0 0 100],'Style','local')
lighting phong
axis equal tight;
xlabel('x');
ylabel('y');
%zlabel('u(x,y)\rightarrow');
%title('Reconstructed Mozart');

axis([-1.5,1.5,-2,2,-1.7,0]);