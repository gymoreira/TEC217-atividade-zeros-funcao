u = 1800;     % velocidade na qual o combustível é expelido em relação ao fogueta
m0 = 1600000; % massa inicial do foguete no instante t = 0
q = 2600;     % taxa de consumo do combustível
g = 9.81;     % aceleração da gravidade

v = @(t) u*log(m0/(m0-q*t)) - g*t; % função da velocidade de subida do foguete

% valores iniciais do intervalo [a, b]
a = 10;      
b = 50;

% precisão desejada (1%)
tol = 0.01;

while abs(b - a) > tol
    % cálculo dos valores da função nos pontos a e b
    fa = v(a) - 750;
    fb = v(b) - 750;
    
    % cálculo do ponto c
    c = (a*fb - b*fa)/(fb - fa);
    
    % cálculo do valor da função no ponto c
    fc = v(c) - 750;
    
    % atualização do intervalo [a, b]
    if fa*fc < 0
        b = c;
    else
        a = c;
    end
end

% resultado
t = (a + b)/2;
disp(['O tempo em que a velocidade é igual a 750 m/s é: ', num2str(t), ' s']);
