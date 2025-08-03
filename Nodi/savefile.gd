extends Node
class_name SaveFile
static var collectibles_discovered : Dictionary[String, bool] = {
	"Computer Vecchio" : false, 
	"Caffè" : false, 
	"Timbro dell'inizio" : false, 
	"Libro in prestito" : false, 
	"Gameboy" : false, 
	"Rotolo d'oro" : false, 
	"Appunti del mentore" : false, 
	"BlueBull" : false
}

static func discover(name: String):
	print("Hai raccolto, ", name, "!")
	collectibles_discovered[name] = true
	
