class Projeto {
String nome
String responsavel
String descricao
Date dataCadastro
Date incioProjeto
Date fimProjeto
byte[] esquemaEletrico
byte[] imagem
static hasMany = [app:App]
}
