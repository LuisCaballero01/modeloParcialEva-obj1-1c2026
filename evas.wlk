object eva01{
    var fuerzaAt = 2110
    var energia = 100

    method fuerzaAt() = fuerzaAt
    method energia() = energia
    method puntosQueOtorga() = 2
    method recargarEnergia(horas) = 100.min(energia + (30*horas))
    method puedeSincronizarse(piloto) = (energia>30).and(piloto.puntosDeEntrenamiento()>=4)

    method consecuenciasSincronizacionConPiloto(piloto){
        fuerzaAt = 2150.min(fuerzaAt+1)
        energia = (energia - 25)
    
    }
// Utilizar el mensaje .and() conviene cuando ambos booleanos son operaciones?

}
object eva02{
    var energia = 100
    var modo = estandar

    method fuerzaAt() = 2114
    method energia() = energia
    method puntosQueOtorga() = modo.puntosQueOtorga()
    method recargarEnergia(horas) = 100.min(energia + (25*horas))
    method puedeSincronizarse(piloto) = (energia>20).and(piloto.puntosDeEntrenamiento()>=2)

    method consecuenciasSincronizacionConPiloto(piloto){
        energia -= modo.consumo()

    }
    method cambiarModo(unModo){
        modo = unModo
    }

}
object estandar{
    method puntosQueOtorga() = 1
    method consumo() = 10
}
object ataque{
    method puntosQueOtorga() = 3
    method consumo() = 20
}
object berserk{
    method puntosQueOtorga() = 6
    method consumo() = 35
}

object eva00{
    var fuerzaAt = 2100

    method fuerzaAt() = fuerzaAt
    method energia() = 100
    method puntosQueOtorga() = 1
    method puedeSincronizarse(piloto) = true

    method consecuenciasSincronizacionConPiloto(piloto){}
    method aumentarFuerza(unaCantidad){
        fuerzaAt = 2150.min(fuerzaAt+unaCantidad)
    }
}
