# Análise de Riscos e Estratégias de Mitigação

Esta seção descreve os principais riscos identificados planejamos evitá-los ou resolvê-los.

## Riscos de Segurança e Privacidade (LGPD)

* **Risco: Proteção de dados financeiros.**
  Se a criptografia não for bem feita, senhas e saldos podem vazar.
  * **Solução:** Usaremos algoritmos fortes (como BCrypt) para as senhas e criptografia AES-256 para os dados sensíveis no banco de dados.

* **Risco: Integração com bancos (API).**
  Ao conectar com o banco, hackers podem tentar interceptar a conexão.
  * **Solução:** Usar conexão segura obrigatória (HTTPS) e guardar os tokens de acesso de forma criptografada na tabela de Integrações.

* **Risco: Acesso não autorizado.**
  Alguém pegar o celular desbloqueado e abrir o app.
  * **Solução:** Exigir biometria (digital ou FaceID) para abrir o aplicativo e deslogar automaticamente após um tempo sem uso.

## Riscos de Desempenho

* **Risco: Lentidão na sincronização.**
  Se muita gente sincronizar ao mesmo tempo, o servidor pode travar.
  * **Solução:** O app vai salvar os dados primeiro no celular (cache local) para ser rápido, e enviar para o servidor em segundo plano, sem travar a tela.

* **Risco: Conflitos no Modo Offline.**
  O usuário altera algo sem internet e, quando volta, dá erro de sincronização.
  * **Solução:** O sistema vai considerar sempre a alteração mais recente (baseada no horário/timestamp) como a correta.

* **Risco: Escalabilidade.**
  O sistema ficar lento se o número de usuários crescer muito rápido.
  * **Solução:** O banco de dados foi desenhado seguindo regras de normalização (3NF) para ser eficiente, e usaremos índices nas buscas mais comuns.

## Riscos Funcionais

* **Risco: Categorização automática errada.**
  O sistema classificar uma farmácia como "Restaurante", bagunçando o gráfico.
  * **Solução:** O usuário poderá editar a categoria manualmente se o sistema errar, e o sistema "aprenderá" com essa correção para a próxima vez.

* **Risco: Falha nos alertas.**
  O usuário não receber o aviso e esquecer de pagar uma conta.
  * **Solução:** Enviar alertas por dois caminhos: Notificação no celular (Push) e E-mail para contas marcadas como urgentes.

## Riscos de Inteligência Artificial (IA)

* **Risco: Alucinação da IA (Informação Falsa).**
  A IA inventar gastos que não existem no resumo mensal.
  * **Solução:** Vamos configurar a IA com instruções estritas ("System Prompts") para que ela analise **apenas** os dados JSON que enviarmos, sem inventar informações externas.

* **Risco: Privacidade dos Dados.**
  Enviar dados pessoais (como CPF ou Nome) para a empresa da IA (ex: OpenAI).
  * **Solução:** Faremos uma "anonimização" antes de enviar: a IA só receberá a lista de valores, datas e categorias, sem o nome do usuário ou dados bancários reais.

* **Risco: Demora na resposta.**
  O chat demorar muito para carregar o resumo, frustrando o usuário.
  * **Solução:** Mostrar uma animação de "digitando..." para o usuário saber que está processando, e salvar os resumos antigos no banco (cache) para não precisar gerar de novo se ele abrir a tela novamente.