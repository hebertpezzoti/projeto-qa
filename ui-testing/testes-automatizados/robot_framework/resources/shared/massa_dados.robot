*** Variables ***
# Dicionário/Lista de Usuários de aceesso ao site/sistema SauceDemo para massa de dados
&{USER_STANDARD}              usuario=standard_user               senha=secret_sauce
&{USER_LOCKED}                usuario=locked_out_user             senha=secret_sauce
&{USER_PROBLEM}               usuario=problem_user                senha=secret_sauce
&{USER_PERFORMANCE}           usuario=performance_glitch_user     senha=secret_sauce
&{USER_ERROR}                 usuario=error_user                  senha=secret_sauce
&{USER_VISUAL}                usuario=visual_user                 senha=secret_sauce

# Dados do usuário para Formulário de Compra
${FIRST_NAME}       Hebert
${LAST_NAME}        Pezzoti da Silva
${ZIP_POSTAL_CODE}  0000-000