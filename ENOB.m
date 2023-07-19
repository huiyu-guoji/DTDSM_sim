x_ticks = 2.^(0:1:15);  % X-axis ticks: 2, 4, 8, 16, and so on
osr = logspace(log10(64), log10(2^15), 1000);  % X-axis range: from 64 to 2^15 logarithmically spaced

snr = zeros(5, length(osr));
enob = zeros(6, length(osr));

for L = 1:1:5
    snr(L, :) = 1.76 + 6.02*2 + 10*log10((2*L+1)/pi^(2*L)) + 10*(2*L+1)*log10(osr);
    enob(L, :) = snr(L, :)/6.02-1.76;
    enob(6, :) = 16;
end

colors = lines(6);  % Predefined color map
figure;
hold on;
for L = 1:1:5
    plot(osr, enob(L, :), 'Color', colors(L, :));
end
plot(osr, enob(6, :), 'Color', 'r', 'LineStyle', '--');
hold off;

legend('L=1', 'L=2', 'L=3', 'L=4', 'L=5', 'ENOB=16');
xlabel('OSR');
ylabel('ENOB');
set(gca, 'XScale', 'log');  % Set X-axis to logarithmic scale
set(gca, 'XTick', x_ticks);  % Set X-axis ticks to 2, 4, 8, 16, and so on
set(gca, 'XTickLabel', x_ticks);  % Set X-axis tick labels to the corresponding values

grid on;  % Display grid
title('1-Bit Quantization');  % Add title
