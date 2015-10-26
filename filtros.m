clear % limpando variáveis
clc % limpando console

img = imread('myimage.jpg');
img = rgb2gray(img); % img = imread('myimage.jpg');

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
N2 = N+(amp_lin*2);
M2 = M+(amp_cols*2);

K = zeros(I,J);

% K(:) = 1/(I*J) % FILTRO DA MEDIA

% FILTRO GAUSSIANO
[X,Y] = meshgrid(-amp_lin:amp_lin,-amp_cols:amp_cols);
sigma = N/6;
K = exp(X.^2+Y.^2)/(2*sigma^2); % normaliza ou nao?



% posicionando o kernel na imagem
% n e m iniciam no centro do kernel,
% desconsideram ampliacao de borda, referencia da img
% i e j percorrem o kernel
for n = 1+amp_lin :1: N2-amp_lin
    for m = 1+amp_cols :1: M2-amp_cols
        result_sum_kernel = 0;
        for i = 1 :1: I
            for j = 1 :1: J
                index_x = n+i+amp_lin-I;
                index_y = m+j+amp_cols-J;
                result_sum_kernel = result_sum_kernel + img_nova(index_x, index_y)*K(i,j);
            end
        end
        F(n-amp_lin, m-amp_cols) = result_sum_kernel;
    end
end