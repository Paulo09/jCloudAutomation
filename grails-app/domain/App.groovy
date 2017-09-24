class App {

String nomeApp
String ip
String porta
String macadres='0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED'
String portaCom
String tipoArduino
Projeto projeto
static belongsTo = Projeto
static hasMany = [canal:Canal]

static constraints ={
       portaCom(inList:['COM1','COM2','COM3','COM4','COM5','COM6','COM7','COM9','COM9','COM10','COM11','COM12','COM13','COM14','COM15','COM16','COM17','COM18','COM19','COM20','COM21','COM22','COM23','COM24','COM25','COM26','COM27','COM28','COM29','COM30','COM31','COM32','COM33','COM34','COM35','COM36','COM37','COM38','COM39','COM40','COM41','COM42','COM43','COM44','COM45','COM46','COM47','COM48','COM49','COM50','COM51','COM52','COM53','COM54','COM55','COM56','COM57','COM58','COM59','COM60','COM61','COM62','COM63','COM64','COM65','COM66','COM67','COM68','COM69','COM70','COM71','COM72','COM73','COM74','COM75','COM76','COM77','COM78','COM79','COM80','COM81','COM82','COM83','COM84','COM85','COM86','COM87','COM88','COM89','COM90','COM91','COM92','COM93','COM94','COM95','COM96','COM97','COM98','COM99','COM100'])
	   tipoArduino(inList:['Arduino Uno','Arduino Leonardo','Arduino Esplora','Arduino Micro','Arduino Duemilanove (328)','Arduino Duemilanove (168)','Arduino Nano (328)','Arduino Nano (168)','Arduino Mini (328)','Arduino Mini (168)','Arduino Pro Mini (328)','Arduino Pro Mini (168)','Arduino Mega 2560/ADK','Arduino Mega 1280','Arduino Mega 8','Microduino Core+ (644)'])
}

}
