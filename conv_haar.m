tamanho_sinal = input('digite o valor do tamanho do sinal: ');
altura_piramide = input('quantos niveis quer ir na piramide? ');

N = min((log(tamanho_sinal)/log(2)),altura_piramide);

VETOR = randn(1,tamanho_sinal);
VETOR_AUX = VETOR;

H0 = [1/sqrt(2) 1/sqrt(2)];
H1 = [1/sqrt(2) -1/sqrt(2)];

G0 = [1/sqrt(2) 1/sqrt(2)];
G1 = [-1/sqrt(2) 1/sqrt(2)];

tamanho = tamanho_sinal;
piramide = zeros(N,tamanho/2)

for i = 1 :1: N
    
    conv_h0 = conv(VETOR_AUX,H0,'same');
    conv_h1 = conv(VETOR_AUX,H1,'same');
    
    passa_alta = zeros(1,tamanho/2);
    passa_baixa = zeros(1,tamanho/2);
    
    % laco pega a subamostra
    k = 1;
    for j = 1 :2: tamanho
        passa_baixa(1,k) = conv_h0(1,j);
        passa_alta(1,k) = conv_h1(1,j);
        k = k+1;
    end
    
    passa_alta
    passa_baixa

    tamanho = tamanho/2
    
    piramide(N,tamanho) = passa_alta(1,tamanho)
    VETOR_AUX = passa_baixa;
    
    
end