const palabrasInaceptables = ["matar", "morir", "muerte"]
const palabrasIgneas = ["fuego", "combustible", "nafta", "encendedor"]

class Agresion{
	var property lugar
	var property agresor
	var property palabras
	
	method esGrave(){
		return palabras.any({palabra => palabrasInaceptables.any({palabraInaceptable => palabraInaceptable == palabra})})
	}
	
	//Verificamos solo las palabras
	method esIgnea(){
		return palabras.any({palabra => palabra == "fuego"})
	}
}

class AgresionFisica inherits Agresion{
	var property elementoUtilizado
	
	override method esGrave(){
		return true
	}
	
	//Verificamos las palabras y el elemento utilizado
	override method esIgnea(){
		return (palabrasIgneas.any({palabra => palabra == elementoUtilizado}) or palabras.any({palabra => palabra == "fuego"}))
	}
}
