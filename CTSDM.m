%2�ף�512osr���������������enob=20.89
%��������

osr=512;
fb=0;
fs=osr*2e4;
order=2;
opt=1;
N=2;
H_inf=1.5;

%����ʵ�ʵ�Vref=3
vref= 2^2;
VDD=3.3/3*vref;

fin=37/2^16;%��fs��һ����ɲ���

%��ӡ����
s0=sprintf('**Simulation Parameters **');
s1=sprintf('   Fs(Hz)=%1.0f',fs);
s2=sprintf('   Ts(s)=%1.6e',1/fs);
s3=sprintf('   Fin(Hz)=%1.4f',fin*fs);
s4=sprintf('   Order=%d',order);
s5=sprintf('   OSR=%1.0f',osr);
s6=sprintf('   Npoints=%1.0f',2^16);
s7=sprintf('   Vref(V)=3   ');
disp(s0);
disp(s1);
disp(s2);
disp(s3);
disp(s4);
disp(s5);
disp(s6);
disp(s7);



%����ģ���ܴﵽ��ָ��
ntf=synthesizeNTF(order,osr,opt,H_inf,fb);
ntf.Ts=1/fs;
% [snr,amp] = simulateSNR(ntf,osr);
% plot(amp,snr);
% %bode(ntf);
% xlabel('Input Amplitude/dBFS');
% ylabel('SNDR/dB');


[a,g,b,c] = realizeNTF(ntf,'CIFF');
%״̬ת��
ABCD=stuffABCD(a,g,b,c,'CIFF');
%��������֤��������ڷ�
[ABCDs,vinmax]=scaleABCD(ABCD,2^2,fin,0.8*VDD,vref+1);
%ʵ�ʵı�֤���������������ڷ���vinmax
vinmax=vinmax*3.3/VDD;
%ʵ�ʵ�·��Ӧ
[a1,g1,b1,c1]=mapABCD(ABCDs,'CIFF');
