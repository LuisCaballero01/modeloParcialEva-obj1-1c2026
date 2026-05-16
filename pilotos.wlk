import evas.*
import nerv.*
object asuka{
    var puntosDeEntrenamiento = 5
    const evas = [] //¿?
    var ultimoEvaSincronizado = eva00

    method puntosDeEntrenamiento() = puntosDeEntrenamiento
    method estaSatisfecho() = ultimoEvaSincronizado.fuerzaAt()>2115
    method puedeSincrozarseConEva(unEva) = unEva.puedeSincronizarse(self)

    method consecuenciasSincronizacionConEva(unEva){
        ultimoEvaSincronizado = unEva
        puntosDeEntrenamiento += unEva.puntosQueOtorga()
    }
}
object shinji{
    var puntosDeEntrenamiento = 2
    const evasSincronizados = []
    var estaCansado = false

    method puntosDeEntrenamiento() = puntosDeEntrenamiento
    method estaSatisfecho() = cuartel.evas().all({c => evasSincronizados.contains(c)})
    method puedeSincrozarseConEva(unEva) = unEva.puedeSincronizarse(self).and(estaCansado.negate())

    method consecuenciasSincronizacionConEva(unEva){
        evasSincronizados.add(unEva)
        estaCansado = true
        puntosDeEntrenamiento += unEva.puntosQueOtorga()
    }
    method descansar(){
        estaCansado = true
    }
}
object rei{
    var puntosDeEntrenamiento = 0
    var cantidadDeSincronizaciones = 0

    method puntosDeEntrenamiento() = puntosDeEntrenamiento
    method estaSatisfecho() = cantidadDeSincronizaciones > 0
    method puedeSincrozarseConEva(unEva) = unEva.puedeSincronizarse(self) && unEva.fuerzaAt()>2110 && cantidadDeSincronizaciones < 5

    method consecuenciasSincronizacionConEva(unEva){
        cantidadDeSincronizaciones += 1
        puntosDeEntrenamiento += unEva.puntosQueOtorga()
    }

}