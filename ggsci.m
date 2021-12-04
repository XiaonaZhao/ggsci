%% examples for ggsci with the NPG theme
% https://nanx.me/ggsci/articles/ggsci.html
% Author: Ms. Xiaona Zhao
% Email: nonazhao@mail.ustc.edu.cn

% %% preinstall the 'diamonds' matrix from R
% % https://bookdown.org/yih_huynh/Guide-to-R-Book/diamonds.html
% exp = cell(10, 10);
% fields = {'carat', 'cut', 'color', 'clarity', 'depth', 'table', 'price', 'x', 'y', 'z'}; % the col number of exp
% diamonds = cell2struct(exp, fields, 2);
% clear exp fields


%% R dataset 'diamods'
% subset 1
figure('color', 'w');
carat = zeros(size(diamonds, 1), 1);
color = zeros(size(diamonds, 1), 1);
depth = zeros(size(diamonds, 1), 1);
price = zeros(size(diamonds, 1), 1);
clarity = zeros(size(diamonds, 1), 1);

for ii = 1:size(diamonds, 1)
    carat(ii, 1) = diamonds(ii).carat;
    color(ii, 1) = diamonds(ii).color;
    price(ii, 1) = diamonds(ii).price;
    clarity(ii, 1) = diamonds(ii).clarity;
end
S = 20; % size of points
scatter(clarity, price, S, color, 'filled', 'MarkerFaceColor', 'flat')
colormap(npg(7));
box off
xlim([0 9])
ylim([-2000 60000])
h = colorbar;
set(get(h, 'label'), 'string', 'Color');
grid on;
xlabel('Clarity');
ylabel('Price of Diamonds');


%% Common plot
figure('color', 'w');
xx = (0:0.1:10)';
kk = length(xx);
linecolors = npg(kk);
for ii = 1:kk
    plot(xx, ii*xx, 'color', linecolors(ii,:));
    hold on;
end


%% bar map
% https://www.mathworks.com/help/matlab/ref/bar.html#d119e66429
% https://www.mathworks.com/matlabcentral/answers/407465-bar-plot-with-color-map
Year = (2010:2021)';
Data = [0.97 1.22 1.4 1.59 1.91 2.14 2.28 2.48 2.65 2.82 2.96 3.09];
figure('color', 'w');
b = bar(Year, Data, 'FaceColor', 'flat', 'EdgeColor',[1 1 1]);
cmap = colormap(npg(50)); % npg fire jet aaas
for ii = 1:length(Data)
    b.CData(ii,:) = cmap(ii, :);
end
grid on;
xlabel('Year');
ylabel('Number of Users (Billions)');
% text(1:length(Data),Year,num2str(Data'),'vert','bottom','horiz','center');
text(Year, Data, num2str(Data'), 'vert', 'bottom', 'horiz', 'center')
box off
set(gca, 'Position', [0.1 0.1 0.87 0.7])

