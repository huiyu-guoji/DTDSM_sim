%修改参数运行批量仿真

clear all
CTSDM();
n=0;
modulename='un_DTDSM_1b_2or_512osr';
load_system(modulename);
 %for AdB=20:5:140    %需要改变的参数
 for A=0.00000001:0.03:3.3
    n=n+1;
    s1=sprintf("**simulation times : %dth **",n);
    disp(s1);
    fname = n;
    
    %幅度有限
     %A=10^(AdB/20);
     %alfa = (A-1)/A;
%     Amax=3.3;
%     sr=2e9;
     %GBW=A*10^7;
   
    
    %set_param('un_DTDSM_1b_2or_512osr/Sine Wave1','Amplitude',num2str(k,'%.4f'));
    set_param('un_DTDSM_1b_2or_512osr/Power Spectral Density','savename',num2str(fname));
    
    simOut=sim(modulename);
    load(num2str(fname));
    result(n,1)=20*log10(A/3.3);
    %result(n,1)=GBW;
    %result(n,1)=AdB;
    result(n,2)=SNR_dB;
    
    s3=sprintf("**AdBFS = %d  simulation result: SNR_dB %f **",result(n,1),result(n,2));
    disp(s3);

end
    delete *.mat
    plot(result(:,1),result(:,2),'-*');
%   xlabel("GBW[Hz]");
   xlabel("Input Amplitude[dBFS]");
%    xlabel("OP-amp Open Loop Gain[dB]");
    ylabel("SQNR[dB]");
%   title ("输入对SQNR的影响")
    s2=sprintf("**simulation end **\n** %d times in total**",n);
    disp(s2); 
    save('opamp_new2','result')
