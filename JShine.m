function mycolor = JShine(m)
%JSHINE   JShine colormap.
%   JSHINE(M) returns an M-by-3 matrix containing the JShine colormap, a
%   variant of the jet colormap that is more perceptually uniform.
%   https://uigradients.com/#JShine
%
%   See also JET, COLORMAP.

if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

mycolorpoint = [
    18,194,233;
    85,164,235;
    143,137,236;
    191,116,237;
    206,107,208;
    219,97,167;
    233,89,130;
    246,80,91;
    ];
mycolorposition=[1 12 23 31 39 48 56 64];
mycolormap_r=interp1(mycolorposition,mycolorpoint(:,1),1:64,'linear','extrap');
mycolormap_g=interp1(mycolorposition,mycolorpoint(:,2),1:64,'linear','extrap');
mycolormap_b=interp1(mycolorposition,mycolorpoint(:,3),1:64,'linear','extrap');
mycolor=[mycolormap_r',mycolormap_g',mycolormap_b']/256;
mycolor = round(mycolor*10^4)/10^4; %保留4位小数

P = size(mycolor,1);
mycolor = interp1(1:P, mycolor, linspace(1,P,m), 'linear');
end