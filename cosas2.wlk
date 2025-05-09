object knightRider {
    method peso() {
      return 500
    }

    method peligrosidad() {
      return 10
    }
    method bulto() = 1
    method consecuenciaDeCarga(){}
}

object bumbelebee {
    var transformado = false
    method peso() = 800
     method bulto() = 2
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
    method consecuenciaDeCarga(){ transformado = true}
}

object ladrillo {
    var cantidad = 0
    method peligrosidad() = 2
    method bulto() = if(cantidad <= 100) 1 
                    else if(cantidad.between(101, 300)) 2
                    else 3
    //method bultoSinif() = (2.min(1.max(cantidad-99)).max(3.min.(cantidad-298)))

    method peso()  = cantidad * 2
    method modificarCantidad(unaCantidad) {
        cantidad = unaCantidad
    }
    method consecuenciaDeCarga(){ cantidad += 12 }
}

object arena {
    var property peso = 0
    method peligrosidad() = 1
    method bulto() = 1
    method consecuenciaDeCarga(){  peso =  (peso -10).max(0)}
}

object bateriaAntiaerea {
    var tieneMisiles = false
    method peso() = if(tieneMisiles) 100 else 0
    method peligrosidad() = if(tieneMisiles) 300 else 200
    method cargarMisiles(){tieneMisiles=true}
    method descargarMisiles(){tieneMisiles=false}
    method bulto() = if(tieneMisiles) 2 else 1
    method consecuenciaDeCarga(){self.cargarMisiles()}
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

    method bulto() = 1 + contenido.sum({c=> c.bulto()})
    method consecuenciaDeCarga(){contenido.forEach({e => e.consecuenciaDeCarga()})} 
}

object residuosRadioActivos {
    var property peso = 0
    method peligrosidad() = 200
}

object embalaje{
    var cosaEnvuelta = arena
    method bulto() = 2
    method envolver(unaCosa){
        cosaEnvuelta = unaCosa
    }
    
    method peso(){
        return cosaEnvuelta.peso()
    }
    
    method peligrosidad(){
        return cosaEnvuelta.peligrosidad() * 0.5
    }

    method consecuenciaDeCarga(){} 
}