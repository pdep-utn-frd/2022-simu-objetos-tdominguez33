
object diccionario {

	var palabrasInaceptables = ["matar","asesinar","quemar"]
	
	method esInaceptable(unaPalabra){
		return palabrasInaceptables.contains(unaPalabra)
	}
	
}
