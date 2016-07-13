load op_neumannf.txt
Z1 = op_neumannf(:,3);
z2 = reshape(Z1,[300,300]);

x = linspace(0,1,300);
y = linspace(0,1,300);

figure(1)
surf(x,y,z2','EdgeColor','none')

%colormap gray
colormap ([1 1 1]);
%material dull;
material ([0 1 0]);
%set(gca,'visible','off')
grid on;
set(gca,'color','black')
%set(gcf,'color','black')
light('Position',[0 0 100],'Style','local')
lighting phong
axis equal tight;

axis([0,1,0,1,-2,0]);