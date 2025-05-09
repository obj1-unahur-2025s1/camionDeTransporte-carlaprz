object camion {
    const carga = []

    method cargar(unaCosa){
        carga.add(unaCosa)
    }

    method descargar(unaCosa){
        carga.remove(unaCosa)
    }

    method pesoTotal() = 1000 + self.pesoCarga()
    
    method pesoCarga() = carga.sum({unaCosa => unaCosa.peso()})

    method todoPesoPar() = carga.all({unaCosa => unaCosa.peso().even()})

    method hayAlgoQuePesa(unValor) = carga.any({e => e.peso() == unValor})

    method cosaConPeligrosidad(unNivel) = carga.find({e => e.peligrosidad() == unNivel})

    method cosaSuperanPeligrosidad(unNivel) = carga.filter({e => e.peligrosidad() > unNivel})

    method cosasMasPeligrosasQue(unaCosa) = self.cosaSuperanPeligrosidad(unaCosa.peligrosidad()) 

    method excedidoPeso() = self.pesoTotal() > 2500

    method puedeCircular(unNivel) = 
        not self.excedidoPeso() && self.cosaSuperanPeligrosidad(unNivel).isEmpty()
    
    method tieneAlgoQuePesaEntre(min, max) = carga.any({ e => e.peso().between(min, max)})

    method cosaMasPesada() = carga.max({e => e.peso()})
}