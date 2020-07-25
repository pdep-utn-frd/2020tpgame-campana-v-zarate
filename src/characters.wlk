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
    var property posicionVida
   
    method image() {
        return imagen
    }

    method position() {
        return posicion
    }

    method moverArriba() {
        if (posicion.y() < 3) {
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
		var piedraA = new Piedras(imagen ="piedra_1.png", posicion = game.at(x,y), limiteIzq = -1, limiteDer = 9, move = true)
		game.addVisual(piedraA)
		if(self.limiteIzq() <= 3){
		game.onTick(110,"moverse",{piedraA.moverDerecha(self)})	
		piedraA.piedraLimite()
		}
		else{
			game.onTick(110,"moverse",{piedraA.moverIzquierda(self)})
			piedraA.piedraLimite()
			}
				}
				 					
		}
	method recibirGolpe(){
		var resultado
		vida = vida -1
		if (vida == 0){
			level.gameOver()
		}
	}
	method vidas(){
		var corazones
		if (vida == 3){
			corazones = new Vidas(imagen = "3vidas.png", posicion = posicionVida)
			game.addVisual(corazones)
		}
		if (vida == 2){
			corazones = new Vidas(imagen ="2vidas.png", posicion = posicionVida)
			game.addVisual(corazones)
		}
		if (vida == 1){
			corazones = new Vidas(imagen = "1vida.png", posicion = posicionVida)
			game.addVisual(corazones)
		}
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
			player.vidas()
			        	
        	}    	    
    }
    
    method piedraLimite(){
    	if(posicion.x() == 9) {
    		self.borrarImagen()
    	}
    	if (posicion.x() == -1){
    		self.borrarImagen()
    	}
    	
    }
   
}

class Vidas {
	var imagen
	var posicion
	
	method image(){
		return imagen
	}
	method position(){
		return posicion
	}
}

class Resultado{
	var imagen
	var posicion
	
	method image(){
		return imagen
	}
	method potision(){
		return posicion
	}
}

