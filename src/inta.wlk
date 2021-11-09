object inta {
	const property parcelas = #{}

	method agregarParcela(parcela) { parcelas.add(parcela) }
	
	method promedioDePlantas() =
		parcelas.sum{parcela => parcela.cantidadDePlantas()} / parcelas.size()
	
	method parcelasConMasDe4Plantas() =
		parcelas.filter{parcela => parcela.cantidadDePlantas() > 4}
	
	method parcelaMasAutosustentable() =
		self.parcelasConMasDe4Plantas().max{
			parcela => parcela.promedioDePlantasBienAsociadas()
		}
}