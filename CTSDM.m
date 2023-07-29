%2阶，512osr，理论最高能做到enob=20.89
%参数设置

osr=1024;
fb=0;
fs=osr*2*2e4;
order=2;
opt=1;
N=1;
H_inf=1.5;

%假设实际的Vref=3
vref= 2^N;
VDD=1.5/1.2*vref;

fin=21/2^16;%按fs归一化相干采样

%打印参数
s0=sprintf('**Simulation Parameters **');
s1=sprintf('   Fs(Hz)=%1.0f',fs);
s2=sprintf('   Ts(s)=%1.6e',1/fs);
s3=sprintf('   Fin(Hz)=%1.4f',fin*fs);
s4=sprintf('   Order=%d',order);
s5=sprintf('   OSR=%1.0f',osr);
s8=sprintf('   Quantization=%d',N);
s6=sprintf('   Npoints=%1.0f',2^16);
s7=sprintf('   Vref(V)=1.2   ');
disp(s0);
disp(s1);
disp(s2);
disp(s3);
disp(s4);
disp(s5);
disp(s8);
disp(s6);
disp(s7);



%理想模型能达到的指标
ntf=synthesizeNTF(order,osr,opt,H_inf,fb);
ntf.Ts=1/fs;
% [snr,amp] = simulateSNR(ntf,osr);
% plot(amp,snr,'-*');
% % %bode(ntf);
% xlabel('Input Amplitude/dBFS');
% ylabel('SNDR/dB');


[a,g,b,c] = realizeNTF(ntf,'CIFF');
%状态转移
ABCD=stuffABCD(a,g,b,c,'CIFF');
%积分器保证增益的最大摆幅
[ABCDs,vinmax]=scaleABCD(ABCD,2^N,fin,0.6*VDD,vref);
%实际的保证积分器和量化器摆幅的vinmax
vinmax=vinmax*1.5/VDD;
%实际电路对应
[a1,g1,b1,c1]=mapABCD(ABCDs,'CIFF');
