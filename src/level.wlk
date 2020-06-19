import wollok.game.*
import characters.*

object level {
	var p1
    var p2
    var bocha
	
	method inicio() {
		game.width(7)
    	game.height(3)
    	game.boardGround("cancha.png")
    	p1 = new Jugador(imagen ="p1.png" , posicion = game.at(1,1), limiteIzq = 0, limiteDer = 2, direccion = 1)
    	keyboard.w().onPressDo{p1.moverArriba()}
    	keyboard.a().onPressDo{p1.moverIzquierda()}
    	keyboard.s().onPressDo{p1.moverAbajo()}
    	keyboard.d().onPressDo{p1.moverDerecha()}
    	p2 = new Jugador(imagen ="p2.png" , posicion = game.at(5,1), limiteIzq = 4, limiteDer = 6, direccion = -1)
    	keyboard.up().onPressDo{p2.moverArriba()}
    	keyboard.left().onPressDo{p2.moverIzquierda()}
    	keyboard.down().onPressDo{p2.moverAbajo()}
    	keyboard.right().onPressDo{p2.moverDerecha()}
    	bocha = new Pelotas(imagen ="bocha.png" , posicion = game.at(2,1), limiteIzq = -1, limiteDer = 7)
		game.addVisual(p1)
		game.addVisual(p2)
		game.addVisual(bocha)
		game.onCollideDo(p1, {i => i.recibeGolpe(p1)})
		game.onCollideDo(p2, {i => i.recibeGolpe(p2)})
	}
}