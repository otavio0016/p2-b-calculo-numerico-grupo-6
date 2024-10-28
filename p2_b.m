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








