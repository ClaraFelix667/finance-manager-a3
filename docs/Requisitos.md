# Requisitos do Sistema

## Técnica de Priorização
Os requisitos foram priorizados utilizando a **Técnica MoSCoW**, classificando-os como:
- **Must (M)** — obrigatório
- **Should (S)** — importante, mas não essencial
- **Could (C)** — desejável
- **Won’t (W)** — fora do escopo desta versão

## 1. Requisitos Funcionais
 ### **01 -RF01-Cadastro de contas bancarias e cartões**
 **M (Deve)**
 O usuário poderá adicionar múltiplas contas bancarias (corrente, poupança) e cartões de credito com informações básicas como nome, saldo inicial e limite.

### **RF02-Rastreamento de despesas e receitas**
**M (Deve)**
O sistema deve permitir o registro detalhado de todas as transcoes mensais (despesas e receitas), incluindo valor, data, descrição e conta de origem/destino.

### **RF03-Categorização Automática (IA Simulada)**
**S (Deveria)**
O sistema deve aplicar um algoritmo de Machine learning (simulado, baseado em regras ou palavras-chave) para sugerir e aplicar automaticamente uma categoria a cada transação registrada como: Alimentação, Transporte, Salário.

### **RF04-Metas mensais** 
**S (Deveria)**
O usuário poderá definir as metas de gasto mensais por categoria que ele classificar no app, exemplo: gastar no máximo R$ 1.000 com alimentação. O aplicativo mostrara a evolução do orçamento em tempo real.

### **RF05-Relatórios gráficos** 
**M (Deve)**
Formação de relatórios gráficos de pizza, barras e linha mostrando a distribuição dos gastos do usuário, evolução de receitas e balanço mensal.

### **RF06-Integração com bancos via API**
**C (Poderia)**
O app poderá se conectar a instituições financeiras para importar automaticamente transações e saldos, mediante autorização do usuário.

### **RF07-Alertas para vencimentos de contas** 
**S (Deveria)**
Quando estiver perto da data de vencimento o sistema enviara notificações ou lembretes sobre conta e faturas (cartão de credito, boletos) para o usuário.

### **RF08-Gestão de categorias**
**M (Deve)**
O usuário deve ser capaz de criar, editar e excluir categorias personalizadas de despesas e receitas.

### **RF09-Filtro e Busca de Transações**
**S (Deveria)**
O sistema deve oferecer funcionalidades avançadas de busca e filtro de transações por data, valor, categoria, tipo (despesa/receita) e conta.

### **RF010-Dashboard de Visão Geral**
**M (Deve)**
O sistema deve exibir uma tela inicial (Dashboard) com um resumo financeiro do mês atual, incluindo saldo total, despesas e receitas mensais, e status dos orçamentos mais críticos.

### **RF-IA-01:**
 O sistema deve utilizar Inteligência Artificial para analisar as transações de um mês selecionado e gerar um resumo textual explicando os principais gastos baseados na categoria e descrição.

### **RF-IA-02:**
 O sistema deve apresentar sugestões de ação rápida ("Quick Replies") abaixo do resumo, incluindo "Abrir Chat Detalhado" e "Obter mais informações (em relação ao resumo)".

### **RF-IA-03:**
 O sistema deve permitir que o usuário mantenha múltiplos históricos de conversas com a IA sobre diferentes tópicos financeiros.


## 2. Requisitos Não Funcionais
**RNF01-Segurança**
**M (Deve)**
O sistema deve implementar uma autenticação biométrica (autenticação facial ou impressão digital) para a segurança dos dados do usuário. E o sistema deve proteger os dados financeiros e pessoais do usuário utilizando criptografia.

### **RNF02-Desempenho**
**S (Deveria)**
O sistema deve realizar sincronização em tempo real dos dados entre dispositivos e servidores, assegurando que todas as informações estejam sempre atualizadas sem atrasos perceptíveis para o usuário.

### **RNF03-Escabilidade**
**C (Poderia)**
O aplicativo deve suportar vários dispositivos e usuários simultaneamente, mantendo estabilidade do sistema e o desempenho mesmo com aumento da base de dados de acessos.

### **RNF04-usabilidade** 
**M (Deve)**
A interface deve ser intuitiva, moderna e simples de navegação, priorizando a boa experiencia do usuário. Incluir elementos de gamificacao como (metas, conquistas e recompensas virtuais) para incentivar o uso continuo dos usuários no aplicativo.

### **RNF05-Acessibildade**
**S (Deveria)**
O aplicativo deve ser acessível a diferentes perfis de usuários, incluindo opções de contraste, tamanho de fonte ajustável e leitura por voz, garantindo inclusão digital.

### **RNF06-Sustentabilidade**
**C (Poderia)**
O aplicativo deve possuir um modo offline que o usuário consiga fazer o registro de transações mesmo sem conexão ativa
armazenando os dados localmente e sincronizando-os automaticamente assim que a conexão for restabelecida, reduzindo o consumo de dados moveis e contribuindo para uma experiencia mais econômica e sustentável. 

### **RNF-Desempenho:**
**M (Must)**
 O resumo da IA deve ser gerado em menos de 3 segundos para não travar o dashboard.

## **RNF-Privacidade:**
**M (Must)**
 Os dados enviados para a API da IA devem ser anonimizados (não enviar o nome do usuário, apenas os valores e descrições das despesas).

