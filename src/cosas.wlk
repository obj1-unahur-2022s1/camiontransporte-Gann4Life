object knightRider {
	method peso() = return 500 
	method peligrosidad() = return 10
}

object bumblebee {
	var property transformadoEnAuto
	method peso() = 800
	method peligrosidad() = if(transformadoEnAuto) 15 else 30
}

object paqueteLadrillos{
	var property cantidad
	method peso() = cantidad * 2
	method peligrosidad() = 10
}

object arena {
	var property peso
	method peligrosidad() = 1
}

object bateriaAntiarea {
	var property conMisiles = false
	method peso() = if(conMisiles) 300 else 200
	method peligrosidad() = if(conMisiles) 100 else 0
}

object contenedor {
	var contenido = []
	method add(cosa) { contenido.add(cosa)}
	method remove(cosa) { contenido.remove(cosa) }
	method peso() = 100 + contenido.sum{cosa => cosa.peso()}
	method peligrosidad() = contenido.max({cosa => cosa.peligrosidad()}).peligrosidad()
}

object residuosRadioactivos {
	var property peso
	method peligrosidad() = 200
}

object embalajeSeguridad {
	var property contenido
	method peso() = contenido.peso()
	method peligrosidad() = contenido.peligrosidad()/2
}




