import agresiones.*
import policia.*

object militante{
	method haceDenuncia(persona){
		return true
	}
}

object miedosa{
	method haceDenuncia(persona){
		return false
	}
}

object paciente{
	method haceDenuncia(persona){
		//FALTA CONSIDERAR AGRESIONES DE UNA MISMA PERSONA
		return (persona.agresionesPasadas().size() >= persona.tolerancia())
	}
}

object aguerrida{
	method haceDenuncia(persona){
		//Ya tiene una agresion grave realizada por un familiar
		return (persona.agresionesPasadas().any({agresion => agresion.esGrave() and persona.composicionFamiliar().any({familiar => familiar == agresion.agresor()})}))
	}
}

class Persona{
	var property composicionFamiliar
	var property actitud
	var property tolerancia = 0
	var property agresionesTotales = 0
	var property agresionesGraves = 0
	var property agresionesPasadas = []
	
	method recibirAgresion(agresion){
		agresionesTotales += 1
		agresionesPasadas.add(agresion)
		if (agresion.esGrave()){
			agresionesGraves += 1
		}
		
		if(agresion.esGrave() and composicionFamiliar.any({familiar => familiar == agresion.agresor()}) and actitud.haceDenuncia(self)){
			policia.recibirDenuncia(agresion)
		}	
	}
	
	method participarEnOrganizacionSocial(){
		actitud = militante
	}
	
	method recibirAcompanamiento(persona){
		actitud = persona.actitud()
	}
	
	method esMiedosa(){
		return actitud == miedosa
	}
	
	method esPaciente(){
		return actitud == paciente
	}
	
	method esAguerrida(){
		return actitud == aguerrida
	}
	
	method esMilitante(){
		return actitud == militante
	}
	
	method serAmenazadaDeMuerte(){
		if(self.esPaciente()){
			tolerancia = tolerancia * 2
		}else if(self.esAguerrida()){
			actitud = paciente
			tolerancia = 5
		}else if(self.esMilitante()){
			actitud = aguerrida
		}
	}
}

