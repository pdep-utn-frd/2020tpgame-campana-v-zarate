import wollok.game.*
import level.*

class Jugador {
	var imagen
	var posicion
	var limiteIzq
	var limiteDer
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
}

class Pelotas {
	var imagen
	var posicion
	const limiteIzq
	const limiteDer
	var contador = 0
	
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
	
	method recibeGolpe(player) {
		self.trayectoria(player)
	}
	
	method trayectoria(player) {
		game.onTick(1000, "mover1", {self.darUnPaso(player)})
	}
	
	method darUnPaso(player) {
		posicion = posicion.right(player.direccion())
		contador = contador + 1
		if (contador == 4) {
			game.removeTickEvent("mover1")}
	}
}