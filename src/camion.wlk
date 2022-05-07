import cosas.*

object camion {
	// Peso máximo en kilos
	const pesoMaximo = 2500
	
	// Peso base
	const tara = 1000
	
	var contenido = []
	
	method cargar(cosa) {contenido.add(cosa) }
	
	method descargar(cosa) { contenido.remove(cosa) }
	
	// Si el peso de cada uno de los objetos cargados es un número par
	method todoPesoPar() = contenido.all({cosa => cosa.peso().odd() == true})
	
	// Indica si hay alguno de los objetos cargados que tiene exactamente el peso indicado
	method hayAlgunoQuePesa(peso) = contenido.any({cosa => cosa.peso() == peso})
	
	// Devuelve el primer objeto cargado que encuentre, cuyo nivel de peligrosidad coincida exactamente con el valor indicado
	method elDeNivel(nivel) = contenido.find({cosa => cosa == nivel})
	
	// Es la suma del peso del camión vacío (tara) y su carga. La tara del camión es de 1000 kilos
	method pesoTotal() = tara + contenido.sum({cosa => cosa.peso()})
	
	// Indica si el peso total es superior al peso máximo, que es de 2500 kilos
	method excedidoDePeso() = self.pesoTotal() > pesoMaximo
	
	// Devuelve una colección con los objetos cargados que superen el nivel de peligrosidad indicado
	method objetosQueSuperanPeligrosidad(nivel) = contenido.filter({cosa => cosa.peligrosidad() > nivel})
	
	// Devuelve una colección con los objetos cargados que son más peligrosos que la cosa indicada
	method objetosMasPeligrososQue(cosa) = contenido.filter({elemento => elemento.peso() > cosa.peso()})
	
	// Puede circular si no está excedido de peso, y además, ninguno de los objetos cargados supera el nivel máximo de peligrosidad indicado
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = !self.excedidoDePeso() && contenido.any({cosa => cosa.peligrosidad() > nivelMaximoPeligrosidad})
	
	// Indica si el peso de alguna de las cosas que tiene el camión está en ese intervalo
	method tieneAlgoQuePeseEntre(min, max) = contenido.find({cosa => cosa.peso().between(min, max)}).size() > 0

	// la cosa más pesada que tenga el camión. Ojo que lo que se pide es la cosa y no su peso.
	 method cosaMasPesada() = contenido.max({cosa => cosa.peso()})
	  
	// devuelve una lista con los pesos de cada cosa que tiene el camión.
	method pesos() = contenido.map({cosa => cosa.peso()})
}