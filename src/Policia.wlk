import Agresiones.*
import Actitudes.*
import Persona.*

object policia{
	const denuncias = []
	const denunciantes = []
	method registrarDenuncia(denuncia){
		denuncias.add(denuncia)
		denunciantes.add(denuncia.victima())
	}
	
	method denunciaRegistradaPor(victima){
		return (denunciantes)
	}
}
	
class Denuncia{
	var property numero
	var property agresion
	var property victima
}