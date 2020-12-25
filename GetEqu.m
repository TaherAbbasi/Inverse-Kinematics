function equ=GetEqu(Xt,Yt,t_Mat,t1)%t1 is the t we want to interpolate
XEqu=inline(Xt)
YEqu=inline(Yt)
X=XEqu(t_Mat)'
Y=YEqu(t_Mat)'
x=XEqu(t1)
XY=[X Y]
bwNewton(XY,x);
end