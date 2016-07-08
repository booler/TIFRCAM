load op_neumannf.txt
Z1 = op_neumannf(:,3);
z2 = reshape(Z1,[200,200]);

x = linspace(0,1,200);
y = linspace(0,1,200);

figure(1)
surf(x,y,z2,'EdgeColor','none')
colormap gray
light('Position',[1 1 1],'Style','local')
lighting phong
axis([0.1,0.9,0.0,1,-1.5,-0.8])