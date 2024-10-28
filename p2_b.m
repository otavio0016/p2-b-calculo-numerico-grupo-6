clear all
close all
clc

columns_names = {'Outcome', 'Patient Age', 'Gender', ...
                 'Ventilated (Y/N)', 'Red blood cell distribution width', ...
                 'Monocytes(%)', 'White blood cell count', ...
                 'Platelet Count', 'Lymphocyte Count', ...,
                 'Neutrophils Count', 'Days Hospitalized'};

data = csvread('COVID-19_CBC_Data_cleaned.csv');

# removendo a linha com strings dos títulos
data(1, :) = []



### início do código da prova (fique à vontade para comentar o código de plots dos scatters)

# ANALÍSE 2

# Primeiramente, tinha-se o objetivo de comparar diferentes faixas etárias à quantidade de células sanguíneas do paciente.
# Para isso, comparou-se a média de leucócitos, linfócitos e neutrófilos em 3 faixas etárias (0-40, 40-60 e 60+) anos.
# Para uma melhor visualização, utilizou-se gráficos de barras e lineares.
# segue o código

# LEUCÓCITOS X FAIXAS ETÁRIAS

# Índices das colunas
age_column = 2;  # Coluna de "Patient Age"
wbc_column = 7;  # Coluna de "White blood cell count"

# Definir faixas etárias
age_groups = {[0, 40], [40, 60], [60, Inf]};
group_labels = {'0-40', '40-60', '60+'};  # Rótulos das faixas etárias

# Calcular a média do "White blood cell count" para cada faixa etária
mean_wbc = zeros(1, length(age_groups));

for i = 1:length(age_groups)
    age_range = age_groups{i};

    # Filtrar dados pela faixa etária
    age_filter = data(:, age_column) >= age_range(1) & data(:, age_column) < age_range(2);
    wbc_data = data(age_filter, wbc_column);

    # Calcular a média de White blood cell count para a faixa etária
    mean_wbc(i) = mean(wbc_data);
end

# Criar o gráfico de barras
figure;
bar(mean_wbc);
set(gca, 'xticklabel', group_labels);  # Adicionar rótulos no eixo x
xlabel('Faixa Etária');
ylabel('Média de White Blood Cell Count');
title('Comparação de Leucócitos por Faixa Etária');


# NEUTRÓFILOS X FAIXAS ETÁRIAS

# Índices das colunas
age_column = 2;  # Coluna de "Patient Age"
neutrophils_column = 10;  # Coluna de "Neutrophils Count"

# Definir faixas etárias
age_groups = {[0, 40], [40, 60], [60, Inf]};
group_labels = {'0-40', '40-60', '60+'};  # Rótulos das faixas etárias

# Calcular a média do "Neutrophils Count" para cada faixa etária
mean_neutrophils = zeros(1, length(age_groups));

for i = 1:length(age_groups)
    age_range = age_groups{i};
    
    # Filtrar dados pela faixa etária
    age_filter = data(:, age_column) >= age_range(1) & data(:, age_column) < age_range(2);
    neutrophils_data = data(age_filter, neutrophils_column);

    # Calcular a média de Neutrophils Count para a faixa etária
    mean_neutrophils(i) = mean(neutrophils_data);
end

# Criar o gráfico de barras
figure;
bar(mean_neutrophils);
set(gca, 'xticklabel', group_labels);  # Adicionar rótulos no eixo x
xlabel('Faixa Etária');
ylabel('Média de Neutrophils Count');
title('Comparação de Neutrófilos por Faixa Etária');

# LINFÓCITOS X FAIXAS ETÁRIAS

# Índices das colunas
age_column = 2;  # Coluna de "Patient Age"
lymphocyte_column = 9;  # Coluna de "Neutrophils Count"

# Definir faixas etárias
age_groups = {[0, 40], [40, 60], [60, Inf]};
group_labels = {'0-40', '40-60', '60+'};  # Rótulos das faixas etárias

# Calcular a média do "Lymphocytes Count" para cada faixa etária
mean_lymphocyte = zeros(1, length(age_groups));

for i = 1:length(age_groups)
    age_range = age_groups{i};
    
    # Filtrar dados pela faixa etária
    age_filter = data(:, age_column) >= age_range(1) & data(:, age_column) < age_range(2);
    lymphocyte_data = data(age_filter, lymphocyte_column);

    # Calcular a média de Lymphocytes Count para a faixa etária
    mean_lymphocyte(i) = mean(lymphocyte_data);
end

# Criar o gráfico de barras
figure;
bar(mean_lymphocyte);
set(gca, 'xticklabel', group_labels);  # Adicionar rótulos no eixo x
xlabel('Faixa Etária');
ylabel('Média de Lymphocyte Count');
title('Comparação de Linfócitos por Faixa Etária');


# GRÁFICO LINEAR (CÉLULAS DO SANGUE X FAIXA ETÁRIA)

# Índices das colunas
age_column = 2;                # Coluna de "Patient Age"
wbc_column = 7;                # Coluna de "White blood cell count"
lymphocytes_column = 9;        # Coluna de "Lymphocyte Count"
neutrophils_column = 10;       # Coluna de "Neutrophils Count"

# Definir faixas etárias
age_groups = {[0, 40], [40, 60], [60, Inf]};
group_labels = {'0-40', '40-60', '60+'};

# Inicializar variáveis para armazenar as médias
mean_wbc = zeros(1, length(age_groups));
mean_lymphocytes = zeros(1, length(age_groups));
mean_neutrophils = zeros(1, length(age_groups));

# Calcular a média de cada parâmetro para cada faixa etária
for i = 1:length(age_groups)
    age_range = age_groups{i};

    # Filtrar dados pela faixa etária
    age_filter = data(:, age_column) >= age_range(1) & data(:, age_column) < age_range(2);

    # Extrair dados para cada parâmetro e calcular a média
    mean_wbc(i) = mean(data(age_filter, wbc_column));
    mean_lymphocytes(i) = mean(data(age_filter, lymphocytes_column));
    mean_neutrophils(i) = mean(data(age_filter, neutrophils_column));
end

# Plotar o gráfico de linhas
figure;
plot(1:length(age_groups), mean_lymphocytes, '-o', 'DisplayName', 'Linfócitos', 'Color', 'b');
hold on;
plot(1:length(age_groups), mean_neutrophils, '-o', 'DisplayName', 'Neutrófilos', 'Color', 'r');
plot(1:length(age_groups), mean_wbc, '-o', 'DisplayName', 'Leucócitos', 'Color', 'g');

# Configurações do gráfico
set(gca, 'xtick', 1:length(age_groups), 'xticklabel', group_labels);  # Rótulos do eixo x
xlabel('Age Groups');
ylabel('Mean Count');
title('Células sangíneas por faixa etária');
legend('show');
hold off;




# OUTCOME X FAIXA ETÁRIA

# Índices das colunas
age_column = 2;  # Coluna de "Patient Age"
outcome_column = 1;  # Coluna de "Outcome Count"

# Definir faixas etárias
age_groups = {[0, 40], [40, 60], [60, Inf]};
group_labels = {'0-40', '40-60', '60+'};  # Rótulos das faixas etárias

# Calcular a média do "Outcome Count" para cada faixa etária
mean_outcome = zeros(1, length(age_groups));

for i = 1:length(age_groups)
    age_range = age_groups{i};
    
    # Filtrar dados pela faixa etária
    age_filter = data(:, age_column) >= age_range(1) & data(:, age_column) < age_range(2);
    outcome_data = data(age_filter, outcome_column);

    # Calcular a média de Outcome Count para a faixa etária
    mean_outcome(i) = mean(outcome_data);
end

# Criar o gráfico de barras
figure;
bar(mean_outcome);
set(gca, 'xticklabel', group_labels);  # Adicionar rótulos no eixo x
xlabel('Faixa Etária');
ylabel('Média de Mortalidade');
title('Comparação de Mortalidade por Faixa Etária');

# REGRESSÃO LINEAR
# Consideramos interessante avaliar a relação entre a quantidade de células sanguíneas por paciente com a taxa de mortalidade
# Para isso foi realizada uma regressão linear, considerando os coeficientes de regressão e o coeficiente de correlação
# Segue o código:

# LEUCÓCITOS X OUTCOME

columns_names = {'Outcome', 'Patient Age', 'Gender', ...
                 'Ventilated (Y/N)', 'Red blood cell distribution width', ...
                 'Monocytes(%)', 'White blood cell count', ...
                 'Platelet Count', 'Lymphocyte Count', ...,
                 'Neutrophils Count', 'Days Hospitalized'};

data = csvread('COVID-19_CBC_Data_cleaned.csv');

# removendo a linha com strings dos títulos
data(1, :) = []

# Encontrar os índices das colunas de interesse
outcome_idx = find(strcmp(columns_names, 'Outcome'));
wbc_idx = find(strcmp(columns_names, 'White blood cell count'));

# Definir as variáveis x e y
x = data(:, wbc_idx);       # White blood cell count
y = data(:, outcome_idx);   # Outcome

# Cálculo das médias de x e y
x_mean = mean(x);
y_mean = mean(y);

# Cálculo do coeficiente de inclinação (beta1) e do intercepto (beta0) manualmente
numerator_beta1 = sum((x - x_mean) .* (y - y_mean));
denominator_beta1 = sum((x - x_mean).^2);
beta1 = numerator_beta1 / denominator_beta1;

# Intercepto beta0
beta0 = y_mean - beta1 * x_mean;

# resultados da regressão leucócitos
fprintf("Equação da regressão linear: y = %.4f + %.4f * x\n", beta0, beta1);

# Cálculo do coeficiente de correlação (r) manualmente
numerator_r = sum((x - x_mean) .* (y - y_mean));
denominator_r = sqrt(sum((x - x_mean).^2) * sum((y - y_mean).^2));
r = numerator_r / denominator_r;

# coeficiente de correlação leucócitos
fprintf("Coeficiente de correlação (r): %.4f\n", r);

# LINFÓCITOS X OUTCOME

# Encontrar os índices das colunas de interesse
outcome_idx = find(strcmp(columns_names, 'Outcome'));
linfo_idx = find(strcmp(columns_names, 'Lymphocyte Count'));

# Definir as variáveis x e y
x = data(:, linfo_idx);       # White blood cell count
y = data(:, outcome_idx);   # Outcome

# Cálculo das médias de x e y
x_mean = mean(x);
y_mean = mean(y);

# Cálculo do coeficiente de inclinação (beta1) e do intercepto (beta0) manualmente
numerator_beta1 = sum((x - x_mean) .* (y - y_mean));
denominator_beta1 = sum((x - x_mean).^2);
beta1 = numerator_beta1 / denominator_beta1;

# Intercepto beta0
beta0 = y_mean - beta1 * x_mean;

# resultados da regressão linfócitos
fprintf("Equação da regressão linear: y = %.4f + %.4f * x\n", beta0, beta1);

# Cálculo do coeficiente de correlação (r) manualmente
numerator_r = sum((x - x_mean) .* (y - y_mean));
denominator_r = sqrt(sum((x - x_mean).^2) * sum((y - y_mean).^2));
r = numerator_r / denominator_r;

# coeficiente de correlação linfócitos
fprintf("Coeficiente de correlação (r): %.4f\n", r);

# NEUTRÓFILOS X OUTCOME

# Encontrar os índices das colunas de interesse
outcome_idx = find(strcmp(columns_names, 'Outcome'));
neutro_idx = find(strcmp(columns_names, 'Neutrophils Count'));

# Definir as variáveis x e y
x = data(:, neutro_idx);       # White blood cell count
y = data(:, outcome_idx);   # Outcome

# Cálculo das médias de x e y
x_mean = mean(x);
y_mean = mean(y);

# Cálculo do coeficiente de inclinação (beta1) e do intercepto (beta0) manualmente
numerator_beta1 = sum((x - x_mean) .* (y - y_mean));
denominator_beta1 = sum((x - x_mean).^2);
beta1 = numerator_beta1 / denominator_beta1;

# Intercepto beta0
beta0 = y_mean - beta1 * x_mean;

# resultados da regressão neutrófilos
fprintf("Equação da regressão linear: y = %.4f + %.4f * x\n", beta0, beta1);

# Cálculo do coeficiente de correlação (r) manualmente
numerator_r = sum((x - x_mean) .* (y - y_mean));
denominator_r = sqrt(sum((x - x_mean).^2) * sum((y - y_mean).^2));
r = numerator_r / denominator_r;

# coeficiente de correlação neutrófilos
fprintf("Coeficiente de correlação (r): %.4f\n", r);

