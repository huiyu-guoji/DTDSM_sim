%修改参数运行批量仿真

clear all
CTSDM();
n=0;
modulename='SimPara_DTDSM_2b_2or_512osr';
load_system(modulename);
 %for  cap=-12 :0.5:-6
 %for  deltadB=-12 :0.2:-6
 %for  AdB=20:5:140    %需要改变的参数
 %for  A=0.00000001:0.03:3.3
  for A=-15:0.5:-10
      
    n=n+1;
    s1=sprintf("**simulation times : %dth **",n);
    disp(s1);
    fname = n;
    c=1*10^A;
    %c=cap*10^(-12);
    %delta=10^(deltadB);
    %幅度有限
     %A=10^(AdB/20);
     %alfa = (A-1)/A;
%     Amax=3.3;
%     sr=2e9;
  %   GBW=10^A;
    %SR=1*10^A;  
    
    %set_param('un_DTDSM_1b_2or_512osr/Sine Wave1','Amplitude',num2str(k,'%.4f'));
    set_param('SimPara_DTDSM_2b_2or_512osr/Power Spectral Density','savename',num2str(fname));
    
    simOut=sim(modulename);
    load(num2str(fname));
    %result(n,1)=20*log10(A/3.3);
    result(n,1)=c;
    %result(n,1)=delta;
    result(n,2)=SNR_dB;
    
    s3=sprintf("**GBW = %d  simulation result: SNR_dB %f **",A,result(n,2));
    disp(s3);

 end
    x_ticks = 10.^(-15 :1:-10);
    delete *.mat
    plot(result(:,1),result(:,2),'-*');

    xlabel("Sample Capacitance[F]");
%     xlabel("SR[V/s]");
%      xlabel('Noise[V]');
%    xlabel("Input Amplitude[dBFS]");
%    xlabel("OP-amp Open Loop Gain[dB]");
    %  xlabel('GBW[Hz]');
    ylabel("SQNR[dB]");
    %set(gca, 'XTick', x_ticks)
    set(gca, 'XScale', 'log');  % Set X-axis to logarithmic scale
    set(gca, 'XTick', x_ticks);  % Set X-axis ticks to 2, 4, 8, 16, and so on
    set(gca, 'XTickLabel', x_ticks);  % Set X-axis tick labels to the corresponding values

%   grid on;  % Display grid
%   title ("输入对SQNR的影响")
    s2=sprintf("**simulation end **\n** %d times in total**",n);
    disp(s2); 
    save('GBW2','result')
