class Parcela {
	var ancho
	var largo
	var property horasDeSolPorDia
	const plantas = #{}
	
	method superficie() = ancho * largo
	
	method cantidadDePlantas() = plantas.size()
	
	method maximoDePlantasToleradas() =
		if (ancho > largo) self.superficie() / 5
		else self.superficie() / 3 + largo
		
	method tieneComplicaciones() =
		plantas.any{planta => planta.horasDeSolToleradas() < horasDeSolPorDia}
		
	method toleraUnaPlantaMas() = self.cantidadDePlantas() < self.maximoDePlantasToleradas()
	
	method plantarUnaPlanta(planta) {
		if (self.toleraUnaPlantaMas() and 
			planta.horasDeSolToleradas() + 2 > horasDeSolPorDia) {
			plantas.add(planta)
		}
		else self.error("La planta no pudo ser plantada.")
	}
	
	method tienePlantaQueSupere(altura) = plantas.any{planta => planta.altura() > altura}

	method promedioDePlantasBienAsociadas() =
		plantas.count{planta => self.seAsociaBien(planta)} / plantas.size()

	method seAsociaBien(planta)
}

class ParcelaEcologica inherits Parcela {
	override method seAsociaBien(planta) =
		not self.tieneComplicaciones() and planta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBien(planta) =
		self.cantidadDePlantas() <= 2 and planta.esFuerte()
}