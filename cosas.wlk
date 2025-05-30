object knightRider {
    method peso() {
      return 500
    }

    method peligrosidad() {
      return 10
    }
}

object bumbelebee {
    var transformado = false
    method peso() = 800
    method peligrosidad() {
        var peligrosidad = 30
        if(self.estaTransformado()) {
            peligrosidad = 15
        }
        return peligrosidad
    }
    method transformar(){
        transformado = true
    }
    method estaTransformado() = transformado
}

object ladrillo {
    var cantidad = 0
    method peligrosidad() = 2
    method peso()  = cantidad * 2
    method modificarCantidad(unaCantidad) {
        cantidad = unaCantidad
    }
}

object arena {
    var property peso = 0
    method peligrosidad() = 1
}

object bateriaAntiaerea {
    var tieneMisiles = false
    method peso() = if(tieneMisiles) 100 else 0
    method peligrosidad() = if(tieneMisiles) 300 else 200
    method cargarMisiles(){tieneMisiles=true}
    method descargarMisiles(){tieneMisiles=false}
}

object contenedor{
    const contenido = []
    method peso() = 100 + contenido.sum({unaCosa => unaCosa.peso()})
    method peligrosidad() = if (contenido.isEmpty()) 0 else contenido.max({unaCosa => unaCosa.peligrosidad()}).peligrosidad()
    method agregarCosa(unaCosa) {
        contenido.add(unaCosa)
    }
    method quitarCosa(unaCosa) {
        contenido.remove(unaCosa)
    }
    method agregarListaDeCosas(unaLista) {
        contenido.addAll(unaLista)
    }
}

object residuosRadioActivos {
    var property peso = 0
    method peligrosidad() = 200
}

object embalaje{
    var cosaEnvuelta = arena
    method envolver(unaCosa){
        cosaEnvuelta = unaCosa
    }
    
    method peso(){
        return cosaEnvuelta.peso()
    }
    
    method peligrosidad(){
        return cosaEnvuelta.peligrosidad() * 0.5
    }
}