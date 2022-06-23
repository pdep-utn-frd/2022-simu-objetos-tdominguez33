import Agresiones.*
import Policia.*
import Persona.*

object actitudMiedosa{
	method haceDenuncia(persona){
		return false
	}
}

object actitudMilitante{
	method haceDenuncia(persona){
		return true
	}
}

object actitudAguerrida{
	method haceDenuncia(persona){
		return (persona.agresionesPrevias().any({agresion => agresion.esGrave() and agresion.efectuadaPorFamiliar(persona)}))
	}
}

object actitudPaciente{
	const tolerancia = 3
	//Falta implementar que sean hechas por la misma persona
	method haceDenuncia(persona){
		return (persona.agresionesPasadas() >= tolerancia)
	}
}