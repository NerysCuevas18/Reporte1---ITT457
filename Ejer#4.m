clear;
clc;

N = 2048;
fs = 2048;
dt = 1/fs;
t = (0:(N-1)) * dt;

m1 = cos(2*pi*5*t);%--> signal
m2 = 2*cos(2*pi*10*t + 45);%--> signal
plot(t,m1);
title('Señal a modular 1');       
plot(t,m2);
title('Señal a modular 2');       

Yaux1=fftshift(fft(m1,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Yaux1)); 
xlim([-10 10])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');
Yaux2=fftshift(fft(m2,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Yaux2)); 
xlim([-15 15])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');

y1 = cos(2*pi*100*t);%--> carrier signal
y2 = sin(2*pi*100*t);%--> carrier signal
x1 = m1.*y1;
plot(t,x1);
xlim([0 0.5])
title('Modulación AM');       
xlabel ('Tiempo (seg)');
ylabel('x(t)');
x2 = m2.*y2; % (1/2)*(cos(210*pi*t) + cos(190*pi*t)) + sin(220*pi*t + 45) - sin(-180*pi*t + 45)
plot(t,x2);
xlim([0 0.3])
title('Modulación AM');       
xlabel ('Tiempo (seg)');
ylabel('x(t)');
x = x1 + x2;
plot(t,x);
xlim([0 0.3])

Y=fftshift(fft(x,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Y)); 
xlim([-150 150])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');

d1 = x.*(2*y1);
d2 = x.*(2*y2); 
plot(t,d1);
xlim([0 0.5])
title('Demodulación AM');       
xlabel ('Tiempo (seg)');
ylabel('x(t)');
plot(t,d2);
xlim([0 0.5])
title('Demodulación AM');       
xlabel ('Tiempo (seg)');
ylabel('x(t)');

Y=fftshift(fft(d1,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Y)); 
xlim([-15 15])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');
Y=fftshift(fft(d2,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Y)); 
xlim([-15 15])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');

b1 = lowpass(d1,5,fs);
plot(t,b1);
title('Señal demodulada');       
ylim([-1 1])
b2 = lowpass(d2,10,fs);
plot(t,b2);
title('Señal demodulada');       
ylim([-2 2])

Y1=fftshift(fft(b1,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Y1)); 
xlim([-10 10])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');
Y2=fftshift(fft(b2,N));         
fVals=fs*(-N/2:N/2-1)/N;        
stem(fVals,abs(Y2)); 
xlim([-15 15])
title('FFT');       
xlabel('Frecuencia (Hz)')         
ylabel('Y(s)');
