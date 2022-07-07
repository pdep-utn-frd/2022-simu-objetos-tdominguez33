class Denuncia{
	var property agresion
	var property victima
	var property numeroDenuncia
}

object policia{
	var property denunciasRegistradas = []
	
	method recibirDenuncia(agresion){
		denunciasRegistradas.add(agresion)
	}
}