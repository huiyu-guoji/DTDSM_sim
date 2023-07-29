clear all
figure();
n=21;
load('opamp_new1');
y(:,1)=result(:,2);
load('opamp_new2');
y(:,2)=result(:,2);
y(:,3)=result(:,1);
plot(y(:,3),y(:,1),'-*',y(:,3),y(:,2),'r-o');
xlabel("OP-amp Open Loop Gain[dB]");
ylabel("SQNR[dB]");
legend('Opamp1 with ¦Â=3', 'Opamp2 with ¦Â=1');
load('input_SQNR');
figure();
plot(result(:,1),result(:,2),'-*');
xlabel('Input Amplitude/dBFS');
ylabel('SNDR[dB]');
ylim([0,125]);

x_ticks = 10.^(-15 :1:-10);
load('cap');
figure();
plot(result(:,1),result(:,2),'--*');
xlabel("Sample Capacitance[F]");
ylabel('SNDR[dB]');
set(gca, 'XTick', x_ticks)
set(gca, 'XScale', 'log');  % Set X-axis to logarithmic scale
set(gca, 'XTickLabel', x_ticks);  % Set X-axis tick labels to the corresponding values


x_ticks = 10.^(-12 :1:-6);
load('jitter');
figure();
plot(result(:,1),result(:,2),'-*');
ylabel("SQNR[dB]");
xlabel("Delta of Jitter[s]");
set(gca, 'XTick', x_ticks)
set(gca, 'XScale', 'log');  % Set X-axis to logarithmic scale
set(gca, 'XTickLabel', x_ticks);  % Set X-axis tick labels to the corresponding values

x_ticks = 10.^(1 :1:15);
load('GBW1');
figure();
x1=result(:,1);
y1=result(:,2);
load('GBW2');
y2=result(:,2);
plot(result(:,1),result(:,2),'--*');
plot(x1,y1,'-*',x1,y2,'r-o');
legend('Opamp1 with ¦Â=3', 'Opamp2 with ¦Â=1');
xlabel("GBW[Hz]");
ylabel('SNDR[dB]');
set(gca, 'XTick', x_ticks)
set(gca, 'XScale', 'log');  % Set X-axis to logarithmic scale
set(gca, 'XTickLabel', x_ticks);  % Set X-axis tick labels to the corresponding values


load('out');
y = out.Order1(:);                                          
x = -0.5:0:0.5; 
yy = hist(y,x);
yy = yy/sum(yy);
yy = cumsum(yy);
figure();
hold on
histogram(y,'binwidth',0.005,'FaceColor',[1 0.27 0.0],'EdgeColor',[1 1 1],'FaceAlpha',0.5);

xlabel('Order1 Voltage[V]')
ylabel('Counts')

y = out.Order2(:,1);                                          
x = -2:0:2; 
yy = hist(y,x);
yy = yy/sum(yy);
yy = cumsum(yy);
figure();
hold on
histogram(y,'binwidth',0.0025,'FaceColor',[0.3010 0.7450 0.9330],'EdgeColor',[1 1 1],'FaceAlpha',0.6);

xlabel('Order2 Voltage[V]')
ylabel('Counts')

x_ticks = 10.^(6 :1:12);
load('SR1');
figure();
x1=result(:,1);
y1=result(:,2);
load('SR2');
y2=result(:,2);
plot(result(:,1),result(:,2),'--*');
plot(x1,y1,'-*',x1,y2,'r-o');
legend('Opamp1 with ¦Â=3', 'Opamp2 with ¦Â=1');
xlabel("SR[V/s]");
ylabel('SNDR[dB]');
set(gca, 'XTick', x_ticks)
set(gca, 'XScale', 'log');  % Set X-axis to logarithmic scale
set(gca, 'XTickLabel', x_ticks);  % Set X-axis tick labels to the corresponding values

load('swing1');
figure();
x1=result(:,1);
y1=result(:,2);
load('swing2');
y2=result(:,2);
plot(result(:,1),result(:,2),'--*');
plot(x1,y1,'-*',x1,y2,'r-o');
legend('Opamp1 with ¦Â=3', 'Opamp2 with ¦Â=1');
xlabel("Saturation[V]");
ylabel('SNDR[dB]');



