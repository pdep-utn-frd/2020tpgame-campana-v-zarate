import wollok.game.*
import characters.*
import level.*
import piedra.*
import vida.*

object logica {

	method agregarPiedra(player) {
		var x
		var y
		if (player.limiteIzq() == 0) {
			x = 0.randomUpTo(3).roundUp()
		} else {
			x = 5.randomUpTo(8).roundUp()
		}
		y = 0.randomUpTo(3).roundUp()
		const piedraR = new Piedra(imagen = "piedra_1.png", posicion = game.at(x, y), limiteIzq = -1, limiteDer = 9, move = false)
		game.addVisual(piedraR)
	}

	method gameOver() {
		self.ganador()
		keyboard.x().onPressDo{ game.stop()}
	}

	method ganador() {
		if (level.p2().vida() == 0) {
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

 