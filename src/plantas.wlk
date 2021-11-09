class Planta {
	const property anioDeObtencion
	var property altura

	method horasDeSolToleradas()
	method esFuerte() = self.horasDeSolToleradas() > 10
	method daNuevasSemillas() = self.esFuerte()
	method espacioQueOcupa()
	method esParcelaIdeal(parcela)
}

class Menta inherits Planta {
	override method esParcelaIdeal(parcela) = parcela.superficie() > 6 
	override method horasDeSolToleradas() = 6
	override method daNuevasSemillas() = super() or altura > 0.4
	override method espacioQueOcupa() = altura * 3
}

class Soja inherits Planta {
	override method horasDeSolToleradas() =
		if (altura > 1) 9
		else {
			if (altura < 0.5) 6
			else 7
		}
	override method daNuevasSemillas() = super() or anioDeObtencion > 2007 and altura > 1
	override method espacioQueOcupa() = altura / 2
	override method esParcelaIdeal(parcela) = parcela.horasDeSolPorDia() == self.horasDeSolToleradas()
}

class Quinoa inherits Planta {
	var solTolerado
	override method horasDeSolToleradas() = solTolerado
	override method daNuevasSemillas() = super() or anioDeObtencion < 2005
	override method espacioQueOcupa() = 0.5
	override method esParcelaIdeal(parcela) = not parcela.tienePlantaQueSupere(1.5)
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method esParcelaIdeal(parcela) = parcela.maximoDePlantasToleradas() == 1
}

class Hierbabuena inherits Menta {
	override method espacioQueOcupa() = super() * 2
}