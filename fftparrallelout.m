adout = [ 0 32 16 48 8 40 24 56 4 36 20 52 12 44 28 60 2 34 18 50 10 42 26 58 6 38 ...
    22 54 14 46 30 62 1 33 17 49 9 41 25 57 5 37 21 53 13 45 29 61 3 35 19 51 ...
    11 43 27 59 7 39 23 55 15 47 31 63];
for i=1:64
    if adout(1,i)<32
        adout(3,i) =  -round(((32-adout(1,i))+32)/64*50e6*20e-9*2^19);
    else
        adout(3,i) = -round(((64-adout(1,i)))/64*50e6*20e-9*2^19);
    end
end


adout16ch = [0 8 4 12 2 10 6 14 1 9 5 13 3 11 7 15];
for i=1:16
    if adout16ch(1,i)<8
        adout16ch(3,i) =  -round(((8-adout16ch(1,i))+8)/16*50e6*20e-9*2^19);
    else
        adout16ch(3,i) = -round(((16-adout16ch(1,i)))/16*50e6*20e-9*2^19);
    end
end

adout32ch = [0 16 8 24 4 20 12 28 2 18 10 26 6 22 14 30 1 17 9 25 5 21 13 29 3 19 11 27 7 23 15 31];
for i=1:32
    if adout32ch(1,i)<16
        adout32ch(3,i) =  -round(((16-adout32ch(1,i))+16)/32*50e6*20e-9*2^19);
    else
        adout32ch(3,i) = -round(((32-adout32ch(1,i)))/32*50e6*20e-9*2^19);
    end
end
for i=1:256
x = dec2bin(i-1,8);
y=fliplr(x);
z(i) = -bin2dec(y)/256*125e6*8e-9*2^19;
end
for i=1:256
x = dec2bin(i-1,8);
y=fliplr(x);
freq500_ch1(i) = -bin2dec(y)/256*125e6;
end
freq500_ch1(freq500_ch1<-62500000)=125e6+freq500_ch1(freq500_ch1<-62500000);
freq500_ch1=freq500_ch1/125e6;
freq500_ch2 = freq500_ch1-1;
freq500_ch3 = freq500_ch1+1;
freq500_ch4 = freq500_ch1;
freq500_ch4(freq500_ch4>=0)=freq500_ch4(freq500_ch4>=0)-2;
freq500_ch4(freq500_ch1<0)=freq500_ch4(freq500_ch1<0)+2;
load('dataram.mat');
i = 236;
x = dec2bin(i-1,8);
y=fliplr(x);
freq = -bin2dec(y)/256*125e6
