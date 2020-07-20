import wollok.game.*
import level.*

class Jugador {
    var imagen
    var posicion
    var property limiteIzq
    var property limiteDer
    var property contador
    var property direccion
    var property vida 

    method image() {
        return imagen
    }

    method position() {
        return posicion
    }

    method moverArriba() {
        if (posicion.y() < 2) {
            posicion = posicion.up(1)}
        else {posicion}
    }

    method moverIzquierda() {
        if (posicion.x() > limiteIzq) {
        posicion = posicion.left(1)}
        else {posicion}
    }

    method moverAbajo() {
        if (posicion.y() > 0) {
        posicion = posicion.down(1)}
        else {posicion}
    }

    method moverDerecha() {
        if (posicion.x() < limiteDer) {
        posicion = posicion.right(1)}
        else {posicion}
    }

    method aumentarContador() {
        contador = contador + 1
    }

	method lanzarPiedra(){		
		var x = 0 
		var y = 0
		
		if (contador > 0){
		 x = posicion.x() + self.direccion()
		 y = posicion.y()	
		contador = contador -1
		level.agregarPiedra(self)
		var piedraA = new Piedras(imagen ="piedra_1.png", posicion = game.at(x,y), limiteIzq = -1, limiteDer = 7, move = true)
		game.addVisual(piedraA)
		if(self.limiteIzq() <= 3){
		game.onTick(150,"moverse",{piedraA.moverDerecha(self)})	
		}
		else{
			game.onTick(150,"moverse",{piedraA.moverIzquierda(self)})
			}
				}
				 					
		}
	method recibirGolpe(){
		vida = vida -1
	}
			
}

class Piedras {
    var imagen
    var posicion
    const limiteIzq
    const limiteDer
    var property move

    method image() {
        return imagen
    }

    method position() {
        return posicion
    }

	method moverIzquierda(player){
		posicion = posicion.left(1)
	}

	method moverDerecha(player){
		posicion = posicion.right(1)
	}

    method borrarImagen() {
        game.removeVisual(self)
    }

    method serAgarradoPor(player) {
        if (move == false){
        player.aumentarContador()
        self.borrarImagen()
        }
        
        else{player.recibirGolpe()	
			self.borrarImagen()
			        	
        	}    	    
    }
    
   
}
