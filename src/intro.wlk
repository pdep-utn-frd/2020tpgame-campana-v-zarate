import wollok.game.*
import level.*

object introduccion {

	const property aux = new Intro(imagen = "intro.png")

	method inicio() {
		game.width(9)
		game.height(5)
		game.boardGround(level.cancha())
		game.addVisual(aux)
	}

}

class Intro {

	var imagen

	method position() {
		return game.origin()
	}

	method image() {
		return imagen
	}

}

 