class Canal {

String numeroCanal
String tipoBotao
String textoAtivo
String textoInativo
App app
static belongsTo = App

static constraints ={
    numeroCanal(inList:['Canal1','Canal2','Canal3','Canal4','Canal5','Canal6','Canal7','Canal8','Canal9','Canal10','Canal11','Canal12','Canal13'])
	tipoBotao(inList:['FLIP_BUTTON','SWITCH_BUTTON'])
}

}
