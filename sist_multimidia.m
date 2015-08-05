clear % limpando variáveis
clc % limpando console

img = imread('myimage.jpg');
img = double(rgb2gray(img));

[N,M] = size(img); % N=linhas da imagem; M=colunas da imagem
F = zeros(N,M);
I = input('Insira valor i do kernel:');
J = input('Insira valor j do kernel:');

% ampliando bordas de acordo com o tamanho do kernel
amp_lin = (I-1)/2;
amp_cols = (J-1)/2;
img_nova = vertcat(img(1:amp_lin,:), img); % ampliando linhas de cima
img_nova = vertcat(img_nova, img(N-amp_lin+1:N,:)); % ampliando linhas de baixo
img_nova = horzcat(img_nova(:, 1:amp_cols), img_nova); % ampliando colunas a esq
img_nova = horzcat(img_nova, img_nova(:, M-amp_cols+1:M)); % ampliando colunas a direita

% ajustando N e M da img original na img nova
N2 = N+amp_lin;
M2 = M+amp_cols;

% posicionando o kernel na imagem
% n e m iniciam no centro do kernel, referência da img
% i e j percorrem o kernel
K = zeros(I,J);
for n = 1+amp_lin :1: N2
    for m = 1+amp_cols :1: M2
        for i = 1 :1: I
            for j = 1 :1: J
                
            end
        end
    end
    
end