import wollok.game.*
import characters.*
import level.*
import logica.*
import vida.*

class Piedra {

	var imagen
	var posicion
	const property limiteIzq
	const property limiteDer
	var property move

	method image() {
		return imagen
	}

	method position() {
		return posicion
	}

	method moverse(player) {
		posicion = posicion.right(player.direccion())
	}

	method volteada() {
		posicion = posicion.down(1)
	}

	method borrarImagen() {
		game.removeVisual(self)
	}

	method serAgarradoPor(player) {
		if (not move) {
			player.aumentarContador()
		} else {
			player.recibirGolpe()
			player.vidas()
		}
		self.borrarImagen()
	}

}

class PiedraMagica inherits Piedra {

	override method serAgarradoPor(player) {
		if (not move) {
			player.tienePiedraMagica(true)
		} else {
			player.recibirGolpe()
			player.vidas()
		}
		self.borrarImagen()
	}

}

 