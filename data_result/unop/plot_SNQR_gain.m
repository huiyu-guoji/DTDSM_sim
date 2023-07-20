n=21;

load('opamp_new1');
y(:,1)=result(:,2);
load('opamp_new2');
y(:,2)=result(:,2);
y(:,3)=result(:,1);
plot(y(:,3),y(:,1),'-*',y(:,3),y(:,2),'r-o');
xlabel("OP-amp Open Loop Gain[dB]");
ylabel("SQNR[dB]");
legend('Opamp1 with ¦Â=0.27', 'Opamp2 with ¦Â=0.45');
load('input_SQNR');
figure();
plot(result(:,1),result(:,2),'-*');
xlabel('Input Amplitude/dBFS');
ylabel('SNDR/dB');
ylim([0,125]);