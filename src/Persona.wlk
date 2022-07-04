import Agresiones.*
import Policia.*
import Actitudes.*

class Persona {
	var property actitud
	var property composicionFamiliar = []
	const agresionesPasadas = []
	const agresoresPasados = []
	
	method agregarFamiliar(familiar){
		composicionFamiliar.add(familiar)
	}
	
	method recibirAgresion(agresion){
		agresionesPasadas.add(agresion)
		agresoresPasados.add(agresion.efectuadoPor())
		
		if (agresion.esGrave() and composicionFamiliar.any({familiar => familiar == agresion.efectuadoPor()}) and actitud.haceDenuncia()){
			policia.registrarDenuncia(agresion)
		}
	}
}
