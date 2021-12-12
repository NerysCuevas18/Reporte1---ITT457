clear;
clc;

N = 2048;
fs = 2048;
dt = 1/fs;
t = (0:(N-1)) * dt;
ang = 0;

m = cos(2*pi*5*t + ang);%--> signal
plot(t,m);
title('Señal a modular');       
y = cos(2*pi*100*t);%--> carrier signal
x = m.*y; % (1/2)*(cos(210*pi*t) + cos(190*pi*t))
plot(t,x);
xlim([0 0.5])
title('Modulación AM');       
xlabel ('Tiempo (seg)');
ylabel('x(t)');

Y=fftshift(fft(x,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Y)); 
xlim([-150 150])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');


f = 100;
y = 2*cos(2*pi*f*t + ang);%--> carrier signal
d = x.*y; % (1/2)*(cos(210*pi*t) + cos(190*pi*t))
plot(t,d);
xlim([0 0.5])
title('Demodulación AM');       
xlabel ('Tiempo (seg)');
ylabel('x(t)');

Y=fftshift(fft(d,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Y)); 
xlim([-10 10])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');


b = lowpass(d,5,fs);
plot(t,b);
title('Señal demodulada');       
ylim([-1 1])

Y=fftshift(fft(b,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Y)); 
xlim([-10 10])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');

