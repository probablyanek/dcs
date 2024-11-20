%%%%% Unipolar NRZ%%%%%

clc
clear all

bitrate = 1;                % Rb-bitrate
bits = [1 0 0 1 0 1 1 1 0 1 0];
T = length(bits) / bitrate;  % Symbol duration
n = 200;
dt = 1/n;                    % Bit duration

Tb = 1 / bitrate;            % 1/bitrate value
a = 1;
f = 0:bitrate/100:2*bitrate;  % Power spectra frequency

x1 = f * Tb;                 % Power spectra frequency

t = 0:dt:T;                  % t takes the value 0 to T with equal spacing
x = zeros(1, length(t));      % Initialization of x

% Line coding : Uni-polar
for (i = 0:length(bits)-1)
    if bits(i+1) == 1
        x((i*n)+1:(i+1)*n) = 1;
    else
        x((i*n)+1:(i+1)*n) = 0;
    end
end

subplot(2, 1, 1)
plot(x)
xlabel('Discrete time')
ylabel('Amplitude')
title('NRZ UNI POLAR-LINE CODING')
axis([0 2300 0 2])
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

sx = ((a^2)/4) * Tb * (sinc(x1).^2 + ((a^2)/4) * dirac(f));  % Power spectra UNIPOLAR formula

subplot(2, 1, 2)
plot(sx)
xlabel('Frequency')
ylabel('Power')
title('NRZ UNI POLAR-POWER SPECTRUM-LINE CODING')
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

for (i=0:length(bits)-1)
    if bits(i+1) == 1
        x((i*n)+1:(i+0.5)*n) = 1;
        x(((i+0.5)*n)+1:(i+1)*n) = 0;
    else
        x((i*n)+1:(i+0.5)*n) = 0;
        x(((i+0.5)*n)+1:(i+1)*n) = 0;
    end
end

figure
subplot(2, 1, 1)
plot(x)
xlabel('Discrete time')
ylabel('Amplitude')
title('RZ UNI POLAR-LINE CODING')
axis([0 2300 0 2])
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

sx = ((a^2)/4) * Tb * (sinc(x1).^2 + ((a^2)/4) * dirac(f));  % Power spectra UNIPOLAR formula
subplot(2, 1, 2)
plot(sx)
xlabel("Freq")
ylabel("Power")
title("RZ UNI POLAR-POWER SPECTRUM-LINE CODING")
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

%%%% POLAR NRZ%%%%%

for(i=0:length(bits)-1)
    if bits(i+1) == 1
        x((i*n)+1:(i+1)*n) = 1;
    else
        x((i*n)+1:(i+1)*n) = -1;
    end
end

figure
subplot(2, 1, 1)
plot(x)
xlabel('Discrete time')
ylabel('Amplitude')
title('NRZ POLAR-LINE CODING')
axis([0 2300 -2 2])
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

sx = (a^2) * Tb * (sinc(x1).^2);  % Power spectra POLAR formula
subplot(2, 1, 2)
plot(sx)
xlabel('Frequency')
ylabel('Power')
title('NRZ POLAR-POWER SPECTRUM-LINE CODING')
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

%%%% POLAR RZ%%%%%

for(i=0:length(bits)-1)
    if bits(i+1) == 1
        x((i*n)+1:(i+0.5)*n) = 1;
        x(((i+0.5)*n)+1:(i+1)*n) = 0;
    else
        x((i*n)+1:(i+0.5)*n) = -1;
        x(((i+0.5)*n)+1:(i+1)*n) = 0;
    end
end

figure
subplot(2, 1, 1)
plot(x)
xlabel('Discrete time')
ylabel('Amplitude')
title('RZ POLAR-LINE CODING')
axis([0 2300 -2 2])
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

sx = (a^2) * Tb * (sinc(x1).^2);  % Power spectra POLAR formula
subplot(2, 1, 2)
plot(sx)
xlabel('Frequency')
ylabel('Power')
title('RZ POLAR-POWER SPECTRUM-LINE CODING')
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

%%%% BIPOLAR AMI %%%%%

count = 0;  % Initialize the count variable

for(i = 0:length(bits)-1)
    if bits(i+1) == 1
        if mod(count, 2) == 0
            x((i*n)+1:(i+1)*n) = 1;
        else
            x((i*n)+1:(i+1)*n) = -1;
        end
        count = count + 1;
    else
        x((i*n)+1:(i+1)*n) = 0;
    end
end

figure
subplot(2, 1, 1)
plot(x)
xlabel('Discrete time')
ylabel('Amplitude')
title('BIPOLAR AMI-LINE CODING')
axis([0 2300 -2 2])
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

sx = (a^2) * Tb * (sinc(x1)) .* (sinc(x1)) .* (sin(pi * x1)) .* (sin(pi * x1)); % spectra BIPOLAR formula
subplot(2, 1, 2)
plot(sx)
xlabel('Frequency')
ylabel('Power')
title('BIPOLAR AMI-POWER SPECTRUM-LINE CODING')
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

%%%% BIPOLAR PSEUDOTERNARY %%%%%

count = 0;  % Initialize the count variable

for(i = 0:length(bits)-1)
    if bits(i+1) == 0
        if mod(count, 2) == 0
            x((i*n)+1:(i+1)*n) = 1;
        else
            x((i*n)+1:(i+1)*n) = -1;
        end
        count = count + 1;
    else
        x((i*n)+1:(i+1)*n) = 0;
    end
end

figure
subplot(2, 1, 1)
plot(x)
xlabel('Discrete time')
ylabel('Amplitude')
title('BIPOLAR PSEUDOTERNARY-LINE CODING')
axis([0 2300 -2 2])
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

sx = (a^2) * Tb * (sinc(x1)) .* (sinc(x1)) .* (sin(pi * x1)) .* (sin(pi * x1)); % spectra BIPOLAR formula
subplot(2, 1, 2)
plot(sx)
xlabel('Frequency')
ylabel('Power')
title('BIPOLAR PSEUDOTERNARY-POWER SPECTRUM-LINE CODING')
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

%%%% MANCHESTER %%%%%

for(i=0:length(bits)-1)
    if bits(i+1) == 1
        x((i*n)+1:(i+0.5)*n) = 1;
        x(((i+0.5)*n)+1:(i+1)*n) = -1;
    else
        x((i*n)+1:(i+0.5)*n) = -1;
        x(((i+0.5)*n)+1:(i+1)*n) = 1;
    end
end

figure
subplot(2, 1, 1)
plot(x)
xlabel("Discrete Time")
ylabel("Amplitude")
title("MANCHESTER LINE CODING")
axis([0 2300 -2 2])
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

sx = (a^2) * Tb * (sinc(x1/2)).*(sinc(x1/2)).*(sin(pi*x1/2)).*(sin(pi*x1/2));
subplot(2, 1, 2)
plot(sx)
xlabel("Frequency")
ylabel("Power")
title("MANCHESTER POWER SPECTRUM")
xticks(0:200:2300)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

%%%% Differential Manchester Line Coding %%%%

clc
clear all

bitrate = 1;                % Rb-bitrate
bits = [1 0 0 1 0 1 1 1 0 1 0];
T = length(bits) / bitrate;  % Symbol duration
n = 200;
dt = 1/n;                    % Bit duration

Tb = 1 / bitrate;            % 1/bitrate value
a = 1;
f = 0:bitrate/100:2*bitrate;  % Power spectra frequency

x1 = f * Tb;                 % Power spectra frequency

t = 0:dt:T;                  % t takes the value 0 to T with equal spacing
x = zeros(1, length(t));      % Initialization of x

% Differential Manchester encoding
prev_polarity = -1;  % Differential encoding starts with a negative polarity

for i = 0:length(bits)-1
    if bits(i+1) == 1
        % Invert the polarity at the start of the bit period
        x((i*n)+1:(i+0.5)*n) = -prev_polarity;
        x(((i+0.5)*n)+1:(i+1)*n) = prev_polarity;
        prev_polarity = prev_polarity;  % Polarity stays the same
    else
        % No inversion at the start of the bit period
        x((i*n)+1:(i+0.5)*n) = prev_polarity;
        x(((i+0.5)*n)+1:(i+1)*n) = -prev_polarity;
        prev_polarity = -prev_polarity;  % Invert polarity for next bit
    end
end

figure
subplot(2, 1, 1)
plot(x)
xlabel('Discrete Time')
ylabel('Amplitude')
title('DIFFERENTIAL MANCHESTER LINE CODING')
axis([0 2500 -2 2])
xticks(0:200:2500)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid

% Power Spectra for Differential Manchester
sx = (a^2) * Tb * (sinc(x1/2)).*(sinc(x1/2)).*(sin(pi*x1/2)).*(sin(pi*x1/2));

subplot(2, 1, 2)
plot(sx)
xlabel('Frequency')
ylabel('Power')
title('DIFFERENTIAL MANCHESTER POWER SPECTRUM')
xticks(0:200:2500)  % Set x-axis grid at 200-unit intervals
grid on  % Add grid