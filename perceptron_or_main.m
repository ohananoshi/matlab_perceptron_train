% MATLAB: R2023a

bias = -1;
taxa_de_aprendizado = 0.5;

% PORTA OR COM PERCEPTRON

% DADOS
qtd_amostras_1 = 4;

input_data = [0 0; 0 1; 1 0; 1 1];
input_data = [(bias)*ones(4,1), input_data(:,:)];

output_data = [0 1 1 1]';

% INICIANDO PESOS ALEATORIAMENTE
pesos = rand(1,3)';

% A FUNÇÃO DE ATIVAÇÃO SERÁ O DEGRAU

% TREINAMENTO
saida = zeros(1,4);
contador_erros = 1;
qtd_epocas = 0;

while contador_erros ~= 0.0
    contador_erros = 0.0;
    qtd_epocas = qtd_epocas + 1;

    for i = 1:qtd_amostras_1
        saida(i) = degrau(sum(input_data(i,:)*pesos));

        if saida(i) ~= output_data(i)
            contador_erros = contador_erros + 1.0;
            pesos = pesos + (taxa_de_aprendizado * (output_data(i) - saida(i))) * input_data(i,:)';
        end
    end
end

% TESTE 

reta = -(pesos(2)/pesos(3))*linspace(-1,1,10) + (pesos(1)/pesos(3));

scatter([0 0 1 1],[0 1 0 1],'blue');
hold on;
plot(reta, linspace(-1,1,10));
hold on;
plot(linspace(-1,1,10),zeros(1,10));
hold on;
plot(zeros(1,10),linspace(-1,1,10));
hold off;

legend('pontos','reta gerada','eixo x','eixo y');


% ====================== FUNÇÕES =====================

% FUNÇÃO DE ATIVAÇÃO DO NEURÔNIO
function out = degrau(input)
    if(input > 0)
        out = 1;
    else
        out = 0;
    end
end