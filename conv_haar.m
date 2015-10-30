tamanho_sinal = input('digite o valor do tamanho do sinal:');
altura_piramide = input('quantos niveis quer ir na piramide?');

N = min((log(tamanho_sinal)/log(2)),altura_piramide);

VETOR = randn(1,N);
VETOR_AUX = VETOR;

H0 = [1/sqrt(2) 1/sqrt(2)];
H1 = [1/sqrt(2) -1/sqrt(2)];

G0 = [1/sqrt(2) 1/sqrt(2)];
G1 = [-1/sqrt(2) 1/sqrt(2)];

tamanho = tamanho_sinal/2;
piramide = zeros(N,tamanho);

for i = 1 :1: N
    
    passa_baixa = 
    passa_alta
    
    for j = 1 :2: tamanho
        
    end
end