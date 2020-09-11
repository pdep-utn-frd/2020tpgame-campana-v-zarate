import wollok.game.*
import level.*
import logica.*
import piedra.*
import vida.*

class Jugador {

	var imagen
	var posicion
	var property limiteIzq
	var property limiteDer
	var property contador
	var property direccion
	var property vida
	var property posicionVida
	var property piedraMagica = false

	method image() {
		return imagen
	}

	method position() {
		return posicion
	}

	method moverArriba() {
		if (posicion.y() < 3) {
			posicion = posicion.up(1)
		}
	}

	method moverIzquierda() {
		if (posicion.x() > limiteIzq) {
			posicion = posicion.left(1)
		}
	}

	method moverAbajo() {
		if (posicion.y() > 0) {
			posicion = posicion.down(1)
		}
	}

	method moverDerecha() {
		if (posicion.x() < limiteDer) {
			posicion = posicion.right(1)
		}
	}

	method aumentarContador() {
		contador = contador + 1
	}

	method lanzarPiedra() {
		var x = 0
		var y = 0
		if (contador > 0) {
			x = posicion.x() + self.direccion()
			y = posicion.y()
			contador -= 1
			logica.agregarPiedra(self)
			const piedraA = new Piedra(imagen = "piedra_1.png", posicion = game.at(x, y), limiteIzq = -1, limiteDer = 9, move = true)
			game.addVisual(piedraA)
			game.onTick(110, "moverse", { piedraA.moverse(self)})
		}
	}

	method lanzarPiedraMagicaP1() {
		var x = 0
		var y = 0
		if (piedraMagica) {
			x = posicion.x() + self.direccion()
			y = posicion.y()
			const piedraAM = new Piedra(imagen = "piedra_magica_1.png", posicion = game.at(x, y), limiteIzq = -1, limiteDer = 9, move = true)
			game.addVisual(piedraAM)
			game.onTick(110, "moverse2", { piedraAM.moverse(self)})
		}
	}

	method lanzarPiedraMagicaP2() {
		var x = 0
		var y = 0
		if (piedraMagica) {
			x = posicion.x() + self.direccion()
			y = posicion.y()
			const piedraAM = new Piedra(imagen = "piedra_magica_2.png", posicion = game.at(x, y), limiteIzq = -1, limiteDer = 9, move = true)
			game.addVisual(piedraAM)
			game.onTick(110, "moverse2", { piedraAM.moverse(self)})
		}
	}

	method voltearPiedra() {
		if (piedraMagica) {
			game.removeTickEvent("moverse2")
		}
		piedraMagica = false
	}

	method recibirGolpe() {
		vida -= 1
		if (vida == 0) {
			logica.gameOver()
		}
	}

	method vidas() {
		var corazones
		if (vida == 3) {
			corazones = new Vida(imagen = "3vidas.png", posicion = posicionVida)
			game.addVisual(corazones)
		}
		if (vida == 2) {
			corazones = new Vida(imagen = "2vidas.png", posicion = posicionVida)
			game.addVisual(corazones)
		}
		if (vida == 1) {
			corazones = new Vida(imagen = "1vida.png", posicion = posicionVida)
			game.addVisual(corazones)
		}
	}

	method comandoTeclasP1() {
		keyboard.w().onPressDo{ self.moverArriba()}
		keyboard.a().onPressDo{ self.moverIzquierda()}
		keyboard.s().onPressDo{ self.moverAbajo()}
		keyboard.d().onPressDo{ self.moverDerecha()}
		keyboard.space().onPressDo{ self.lanzarPiedra()}
		keyboard.e().onPressDo{ self.lanzarPiedraMagicaP1()}
		keyboard.r().onPressDo{ self.voltearPiedra()}
	}

	method comandoTeclasP2() {
		keyboard.up().onPressDo{ self.moverArriba()}
		keyboard.left().onPressDo{ self.moverIzquierda()}
		keyboard.down().onPressDo{ self.moverAbajo()}
		keyboard.right().onPressDo{ self.moverDerecha()}
		keyboard.l().onPressDo{ self.lanzarPiedra()}
		keyboard.k().onPressDo{ self.lanzarPiedraMagicaP2()}
		keyboard.j().onPressDo{ self.voltearPiedra()}
	}

}

