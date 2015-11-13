% DECOMPOSIÇÃO

%tamanho_sinal = input('digite o valor do tamanho do sinal: ');
%altura_piramide = input('quantos niveis quer ir na piramide? ');
tamanho_sinal =4;
altura_piramide =4;

N = min((log(tamanho_sinal)/log(2)),altura_piramide);

%VETOR = randn(1,tamanho_sinal);
VETOR = [1 4 -3 0];
VETOR_AUX = VETOR;

H0 = [1/sqrt(2) 1/sqrt(2)];
H1 = [-1/sqrt(2) 1/sqrt(2)];

G0 = [1/sqrt(2) 1/sqrt(2)];
G1 = [1/sqrt(2) -1/sqrt(2)];

tamanho = tamanho_sinal;
piramide = zeros(N,tamanho/2);

for i = 1 :1: N
    
    conv_h0 = conv(VETOR_AUX,H0);
    conv_h0 = conv_h0(1:end-1);
    conv_h1 = conv(VETOR_AUX,H1);
    conv_h1 = conv_h1(1:end-1);
    
    passa_alta = zeros(1,tamanho/2);
    passa_baixa = zeros(1,tamanho/2);
    
    % laco pega a subamostra
    k = 1;
    for j = 2 :2: tamanho
        passa_baixa(1,k) = conv_h0(1,j);
        passa_alta(1,k) = conv_h1(1,j);
        k = k+1;
    end
    
    tamanho = tamanho/2;
    
    piramide(i,1:tamanho) = passa_alta;
    VETOR_AUX = passa_baixa;
    
end

% RECONSTRUÇÃO

for i = N :-1: 1
    passa_alta = piramide(i,1:tamanho)
    tamanho = tamanho*2;
    
    pa_expansao = zeros(1,tamanho)
    pb_expansao = zeros(1,tamanho)
    
    % expande a subamostra
    k = 1;
    for j = 1 :2: tamanho
        pa_expansao(1,j) = passa_alta(1,k)
        pb_expansao(1,j) = passa_baixa(1,k)
        k = k+1;
    end
    
    conv_g0 = conv(pb_expansao,G0);
    conv_g0 = conv_g0(1:end-1)
    
    conv_g1 = conv(pa_expansao,G1);
    conv_g1 = conv_g1(1:end-1)
    
    passa_baixa = conv_g0 + conv_g1
    
    
end
