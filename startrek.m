function p = startrek(m)
if nargin < 1
    m = size(get(gcf, 'colormap'), 1); 
end

% https://github.com/nanxstats/ggsci/blob/master/data-raw/data-generator.R
cmap_mat = [
    0.8000    0.0471         0 % "Engineering" = "#CC0C00"
    0.3608    0.5333    0.8549 % "Sciences" = "#5C88DA"
    0.5176    0.7412         0 % "Senior" = "#84BD00"
    0.3882    0.0941    0.4745 % "Command" = "#FFCD00"
    0.4863    0.5294    0.5569 % "Teal" = "#7C878E"
         0    0.7098    0.8863 % "Cerulean" = "#00B5E2"
         0    0.6863    0.4000 % "Jade" = "#00AF66"
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