clear;clc;

fs = 44100;
samples = [5*fs,10*fs];
clear pn1 pn2 pn3 fs;
[pn1,fs] = audioread('sample1.wav',samples);
[pn2,fs] = audioread('sample2.wav',samples);
[pn3,fs] = audioread('sample3.wav',samples);

flims = [20 20e3];
bpo = 3;
opts = {'FrequencyLimits',flims,'BandsPerOctave',bpo};

poctave(pn1,fs,opts{:});
savefig('data1.fig');
poctave(pn2,fs,opts{:});
savefig('data2.fig');
poctave(pn3,fs,opts{:});
savefig('data3.fig');

hfig = open('data1.fig');
ax1 = hfig.Children;
x1 = ax1.Children.XData;
y1 = ax1.Children.YData;

hfig = open('data2.fig');
ax2 = hfig.Children;
x2 = ax2.Children.XData;
y2 = ax2.Children.YData;

hfig = open('data3.fig');
ax3 = hfig.Children;
x3 = ax3.Children.XData;
y3 = ax3.Children.YData;

xHz = [20 25 31.5 40 50 63 80 100 125 160 200 250 315 400 500 630 800 1000 1250 1600 2000 2500 3150 4000 5000 6300 8000 10000 12500 16000 20000];

meany = (y1+y2+y3)/3;
[pks,locs] = findpeaks(meany);

threshold = mean(pks);
[pksh,locsh] = findpeaks(meany,'MinPeakHeight',threshold);

plot(meany);
hold on;
plot(locsh,meany(locsh),'ro');
hold off;
savefig('result.fig');

meanpksl = (sum(pks)-sum(pksh))/(numel(pks)-numel(pksh));
maxpksh = maxk(pksh,3);

for index = 1:numel(locsh)
    if pksh(index)==maxpksh(1)
        a = index;
    elseif pksh(index)==maxpksh(2)
        b = index;
    elseif pksh(index)==maxpksh(3)
        c = index;
    end
end

if isempty(a)==0
    disp(xHz(locsh(a)));
    disp('Hzにおいて');
    disp(pksh(a)-meanpksl);
    disp('dB減衰させてください.');
end
if isempty(b)==0
    disp(xHz(locsh(b)));
    disp('Hzにおいて');
    disp(pksh(b)-meanpksl);
    disp('dB減衰させてください.');
end
if isempty(c)==0
    disp(xHz(locsh(c)));
    disp('Hzにおいて');
    disp(pksh(c)-meanpksl);
    disp('dB減衰させてください.');
end

audiowrite('result1.wav',pn1,fs);
audiowrite('result2.wav',pn2,fs);
audiowrite('result3.wav',pn3,fs);