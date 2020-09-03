import wollok.game.*
import characters.*

object level {

	var p1
	var p2
	var piedra1
	var piedra2
	var vidap1
	var vidap2
	const cancha = "gigantedevillafox.png"

	method inicio() {
		game.width(9)
		game.height(5)
		game.boardGround(cancha)
		p1 = new Jugador(imagen = "cadu1.png", posicion = game.at(1, 2), limiteIzq = 0, limiteDer = 3, direccion = 1, contador = 0, vida = 3, posicionVida = game.at(2, 4))
		p2 = new Jugador(imagen = "dalmine_1.png", posicion = game.at(7, 2), limiteIzq = 5, limiteDer = 8, direccion = -1, contador = 0, vida = 3, posicionVida = game.at(6, 4))
		self.comandoTeclas()
		piedra1 = new Piedras(imagen = "piedra_1.png", posicion = game.at(3, 2), limiteIzq = -1, limiteDer = 9, move = false)
		piedra2 = new Piedras(imagen = "piedra_1.png", posicion = game.at(5, 2), limiteIzq = -1, limiteDer = 9, move = false)
		vidap1 = new Vidas(imagen = "3vidas.png", posicion = game.at(2, 4))
		vidap2 = new Vidas(imagen = "3vidas.png", posicion = game.at(6, 4))
		game.addVisual(vidap1)
		game.addVisual(vidap2)
		game.addVisual(p1)
		game.addVisual(p2)
		game.addVisual(piedra1)
		game.addVisual(piedra2)
		game.onCollideDo(p1, { i => i.serAgarradoPor(p1)})
		game.onCollideDo(p2, { i => i.serAgarradoPor(p2)})
	}

	method agregarPiedra(player) {
		if (player.contador() < 3) {
			var x
			var y
			if (player.limiteIzq() == 0) {
				x = 0.randomUpTo(3).roundUp()
			} else {
				x = 5.randomUpTo(8).roundUp()
			}
			y = 0.randomUpTo(3).roundUp()
			var piedraR = new Piedras(imagen = "piedra_1.png", posicion = game.at(x, y), limiteIzq = -1, limiteDer = 9, move = false)
			game.addVisual(piedraR)
		} else {
			var x
			var y
			if (player.limiteIzq() == 0) {
				x = 0.randomUpTo(3).roundUp()
			} else {
				x = 5.randomUpTo(8).roundUp()
			}
			y = 0.randomUpTo(3).roundUp()
			var piedraR = new Piedras(imagen = "piedra_1.png", posicion = game.at(x, y), limiteIzq = -1, limiteDer = 9, move = false)
			game.addVisual(piedraR)
		}
	}

	method comandoTeclas() {
		keyboard.w().onPressDo{ p1.moverArriba()}
		keyboard.a().onPressDo{ p1.moverIzquierda()}
		keyboard.s().onPressDo{ p1.moverAbajo()}
		keyboard.d().onPressDo{ p1.moverDerecha()}
		keyboard.g().onPressDo{ p1.lanzarPiedra()}
		keyboard.up().onPressDo{ p2.moverArriba()}
		keyboard.left().onPressDo{ p2.moverIzquierda()}
		keyboard.down().onPressDo{ p2.moverAbajo()}
		keyboard.right().onPressDo{ p2.moverDerecha()}
		keyboard.l().onPressDo{ p2.lanzarPiedra()}
	}

	method gameOver() {
		self.ganador()
		keyboard.x().onPressDo{ game.stop()}
	}

	method ganador() {
		if (p2.vida() == 0) {
			game.addVisual(new Ganador(imagen = "caducampeon.png"))
		} else {
			game.addVisual(new Ganador(imagen = "violacampeon.png"))
		}
	}

}

class Ganador {

	var imagen

	method position() {
		return game.origin()
	}

	method image() {
		return imagen
	}

}

