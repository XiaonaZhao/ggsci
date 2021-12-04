function p = aaas(m)
if nargin < 1
    m = size(get(gcf, 'colormap'), 1); 
end

% https://github.com/nanxstats/ggsci/blob/master/data-raw/data-generator.R
cmap_mat = [
    0.2314    0.2863    0.5725 % "Chambray" = "#3B4992"
    0.9333         0         0 % "Red" = "#EE0000"
         0    0.5451    0.2706 % "FunGreen" = "#008B45"
    0.3882    0.0941    0.4745 % "HoneyFlower" = "#631879"
         0    0.5098    0.5020 % "Teal" = "#008280"
    0.7333         0    0.1294 % "Monza" = "#BB0021"
    0.3725    0.3333    0.6078 % "ButterflyBush" = "#5F559B"
    0.6353         0    0.3373 % "FreshEggplant" = "#A20056"
    0.5020    0.5059    0.5020 % "Stack" = "#808180"
    0.1059    0.0980    0.0980 % "CodGray" = "#1B1919"
    ];

if m > 1 && m <= size(cmap_mat, 1)
    p = cmap_mat(1:m, :);
end


if m > size(cmap_mat, 1)
    xin = linspace(0, 1, m)';
    xorg = linspace(0, 1, size(cmap_mat, 1));
    p(:, 1) = interp1(xorg, cmap_mat(:,1), xin, 'linear');
    p(:, 2) = interp1(xorg, cmap_mat(:,2), xin, 'linear');
    p(:, 3) = interp1(xorg, cmap_mat(:,3), xin, 'linear');
end


end