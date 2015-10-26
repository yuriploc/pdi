img_orig = imread('myimage.jpg');
img = double(rgb2gray(img_orig));

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

% FILTRO DA MEDIA
% K(:) = 1/(I*J)

% FILTRO GAUSSIANO
% [X,Y] = meshgrid(-amp_lin:amp_lin, -amp_cols:amp_cols);
% sigma = N/6;
% K = (1/(2*pi*sigma^2))*exp(-(X.^2+Y.^2)/(2*sigma^2)); % eq 'completa' #2
% K = exp(-((X.^2+Y.^2)/(2*sigma^2))); % #1
% K = K./sum(K(:)); % normaliza?

% MASCARA DE DERIVADA 2D (p/ kernel 3x3)
% #1
% K(:) = -1;
% K(2,2) = 8;
% #2
% kk = [0 1 0];
% K = [kk; 1 -4 1; kk];

% CONVOLUCAO
% posicionando o kernel na imagem
% n e m iniciam no centro do kernel,desconsideram ampliacao de borda,referencia da img
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

imshow(F)