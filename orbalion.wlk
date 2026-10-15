class Equipos {
    const nombre
    const nivelDeEnergiaBase
    const entrenador
    const tecnologiasComplementarias = []// lista de tecnologias
    method energiaTotal()= nivelDeEnergiaBase + self.sumaDeValoresEnergeticosTC()
    method losActivosDetecnologiasComplementariasActivas() = tecnologiasComplementarias.filter({t => t.estaActivo()})
    method sumaDeValoresEnergeticosTC() = self.losActivosDetecnologiasComplementariasActivas().sum({t => t.valorEnergetico()})
    method cantidadDeActivos() = self.losActivosDetecnologiasComplementariasActivas().size()
    method estanTodasLasTecnologiasActivas() = tecnologiasComplementarias.all({t => t.estaActivo()})
    method esDePrestigioUniversal()

}

class Luminico inherits Equipos {
    const nivelDeRadiacion
    const nombresDeCristales = []// lista de string
    override method energiaTotal(){return
        if(nivelDeRadiacion <= 5000)super() + super() * 0.10
        else super()
    } 
    method cantidadCristales() = nombresDeCristales.size()

    override method esDePrestigioUniversal() = self.cantidadCristales() >= 3 and entrenador.esDeEliteGalactica() and self.cantidadDeActivos() >= 1
}

class Sintetico inherits Equipos {
    const nivelDeProcesamientoCentral
    const cantidadModulosActivos
    const estaCertificado
    override method energiaTotal(){return 
    if(cantidadModulosActivos > 5) super() - super() * 0.20
    else  super()
}   
    override method esDePrestigioUniversal()= estaCertificado and cantidadModulosActivos > 3 and self.estanTodasLasTecnologiasActivas()
   
}

class Eterico inherits Equipos {
    const nivelDeFluctuacion
    const cantidadPortales
    override method esDePrestigioUniversal()= nivelDeFluctuacion > 75 and cantidadPortales >= 2 and self.cantidadDeActivos() >= 2
    override method energiaTotal(){return
    if(self.esDePrestigioUniversal()) super() + super() * 0.15
    else super()
    
    }
}

class Entrenador {
    const cantidadCiclosSolares
    const estaEnCintonia
    const nivelPrecisionEstrategica
    const rolesDisponibles = [estrategiaCuantico,arquitectoDeEnergia,guiaMental]
    var rol = ""
    method asignar(unRol){
        if(rolesDisponibles.contains(unRol)){
            rol = unRol
        }else {
          self.error("rol no homologado por la FOZ")
        }
    }
    method rol() = rol
    method nivelPrecisionEstrategica() = nivelPrecisionEstrategica
    method estaEnCintonia() = estaEnCintonia

    method esDeEliteGalactica()= cantidadCiclosSolares > 10 and rol.cumple(self)
}

object estrategiaCuantico{
    method cumple(unEntrenador) = unEntrenador.nivelPrecisionEstrategica() > 80
}
object arquitectoDeEnergia{
    method cumple(unEntrenador) = unEntrenador.estaEnCintonia()
}
object guiaMental{
    method cumple(unEntrenador) = true
}

class TecnologiasEspeciales {
    const nombre
    const valorEnergetico
    const activa
    method valorEnergetico() = valorEnergetico
    method estaActivo() = activa
}