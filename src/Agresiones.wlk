object diccionario {

	const palabrasInaceptables = ["matar","asesinar","quemar"]
	const elementosIgneos = ["nafta", "encendedor", "lanzallamas"]
	
	method esInaceptable(unaPalabra){
		return palabrasInaceptables.contains(unaPalabra)
	}
	
	method esElementoIgneo(palabra){
		return elementosIgneos.contains(palabra)
	}
	
}

class Agresion{
	var property lugar
	var property efectuadoPor
	var property esFisica
	var property elementoUtilizado = null
	var property palabrasUsadas = []

	method esGrave(){
		if (esFisica){
			return true
		}else{
			return palabrasUsadas.any({palabra => diccionario.esInaceptable(palabra)})
		}
	}
	
	method esIgnea(){
		if(not esFisica){
			return palabrasUsadas.any({palabra => palabra == "fuego"})
		}else{
			return ((diccionario.esElementoIgneo(elementoUtilizado)) or (palabrasUsadas.any({palabra => palabra == "fuego"})))
		}	
	}
	
	method efectuadaPorFamiliar(persona){
		return (persona.composicionFamiliar().any({familiar => familiar == efectuadoPor}))
	}
}
