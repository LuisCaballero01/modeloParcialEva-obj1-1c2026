
object cuartel{
    const property evas = []
    const pilotos = []

    method promedioPuntosEntrenamiento() = pilotos.average({p => p.puntosDeEntrenamiento()})
    method pilotoConMayorPuntosDeEntrenamiento() = pilotos.max({p => p.puntosDeEntrenamiento()})
    method fuerzaATDeLosEvas() = evas.map({e => e.fuerzaAt()})
    method evasQuePuedeUtilizar(unPiloto) = evas.filter({e => self.puedenSincronizarse(e, unPiloto)})
    method todosPuedenUsarAlMenosUnEva() = pilotos.all({p => self.algunEvaPuedeSerUtilizadoPor(p)})
    method algunEvaPuedeSerUtilizadoPor(unPiloto) = evas.any({e => self.puedenSincronizarse(e, unPiloto)})
    method estaSatisfecho(unPiloto) = unPiloto.estaSatisfecho()

    method registrarPiloto(unPiloto){
        pilotos.add(unPiloto)
    }
    method registrarPilotos(listaDePilotos){ pilotos.addAll(listaDePilotos) }
    method echarPiloto(unPiloto){
        pilotos.remove(unPiloto)
    }
    method registrarEva(unEva){
        evas.add(unEva)
    }
    method registrarEvas(listaDeEvas){ evas.addAll(listaDeEvas) }
    method echarEva(unEva){ evas.remove(unEva) }

    method intentarSincronizar(unEva,unPiloto){
        if (self.puedenSincronizarse(unEva,unPiloto)){
            unEva.consecuenciasSincronizacionConPiloto(unPiloto)
            unPiloto.consecuenciasSincronizacionConEva(unEva)
        }
    }
    method puedenSincronizarse(unEva, unPiloto) = unEva.puedeSincronizarse(unPiloto).and(unPiloto.puedeSincrozarseConEva(unEva))

    method sincronizarConPilotos(unEva){
        pilotos.forEach({p => self.intentarSincronizar(unEva, p)})
    }
    method consecuenciasSincronizacionConEvas(unPiloto){
        evas.forEach({e => self.intentarSincronizar(e, unPiloto)})
    }
    
}
