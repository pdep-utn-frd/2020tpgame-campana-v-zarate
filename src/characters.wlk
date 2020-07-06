import wollok.game.*
import level.*

class Jugador {
    var imagen
    var posicion
    var property limiteIzq
    var property limiteDer
    var property contador
    var property direccion

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
		if (contador > 0){
		var x = posicion.x() + self.direccion()
		var y = posicion.y()
		var piedraA = new Piedras(imagen ="piedra_1.png", posicion = game.at(x,y), limiteIzq = -1, limiteDer = 7)
		contador = contador -1
		game.addVisual(piedraA)}
		else{
			level.agregarPiedra(self)
		}
		
		if(x<=3){
		game.onTick(300,"moverse",{piedraA.moverDerecha(self)})	
		}
		else{
			game.onTick(300,"moverse",{piedraA.moverIzquierda(self)})
		}
		
		}
		

//    method dondeApareceLaPiedra(){
//    	
//    	if (self.limiteIzq() == 0){
//    		var  x = 0.randomUpTo(2).roundUp()	
//    	}
//    	 else{
//    	 	var x = 4.randomUpTo(6).roundUp()
//    	 }	 
//    	var y = 0.randomUpTo(2).roundUp()
//    	posicion = game.at(x,y)
//    }

//    method dondeApareceLaPiedraX(player){
//    	var x
//    	
//    	 if (player.limiteIzq() == 0){
//    	 	x = 0.randomUpTo(2).roundUp()
//    	 	}
//    	 else {
//    	 	x = 4.randomUpTo(6).roundUp()
//    	 }	
//    	return x
//    }
//    method dondeApareceLaPiedraY(player){
//    	var y
//    	if(player.limiteIzq() == 0){
//    		y = 0.randomUpTo(2).roundUp()
//    	}
//    	else{
//    		y = 0.randomUpTo(3).roundUp()
//    	}
//    	return y
//    }
}

class Piedras {
    var imagen
    var posicion
    const limiteIzq
    const limiteDer

    method image() {
        return imagen
    }

    method position() {
        return posicion
    }

//    method moverArriba() {
//        if (posicion.y() < 2) {
//            posicion = posicion.up(1)}
//        else {posicion}
//    }

//    method moverIzquierda() {
//        if (posicion.x() > limiteIzq) {
//        posicion = posicion.left(1)}
//        else {posicion}
//    }

	method moverIzquierda(player){
		posicion = posicion.left(1)
	}

//    method moverAbajo() {
//        if (posicion.y() > 0) {
//        posicion = posicion.down(1)}
//        else {posicion}
//    }

	//    method moverDerecha() {
	//        if (posicion.x() < limiteDer) {
	//        posicion = posicion.right(1)}
	//        else {posicion}
	//    }


	method moverDerecha(player){
		posicion = posicion.right(1)
	}

    method borrarImagen() {
        game.removeVisual(self)
    }

    method serAgarradoPor(player) {
        player.aumentarContador()
        self.borrarImagen()
        level.agregarPiedra(player)
        
    }
}
