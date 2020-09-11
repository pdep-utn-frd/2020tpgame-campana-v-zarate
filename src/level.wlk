import wollok.game.*
import characters.*
import logica.*
import piedra.*
import vida.*

object level {

	var property p1
	var property p2
	var piedra1
	var piedra2
	var piedra1M
	var piedra2M
	var vidap1
	var vidap2
	const cancha = "gigantedevillafox.png"

	method inicio() {
		game.width(9)
		game.height(5)
		game.boardGround(cancha)
		p1 = new Jugador(imagen = "cadu1.png", posicion = game.at(1, 2), limiteIzq = 0, limiteDer = 3, direccion = 1, contador = 0, vida = 3, posicionVida = game.at(2, 4))
		p2 = new Jugador(imagen = "dalmine_1.png", posicion = game.at(7, 2), limiteIzq = 5, limiteDer = 8, direccion = -1, contador = 0, vida = 3, posicionVida = game.at(6, 4))
		p1.comandoTeclasP1()
		p2.comandoTeclasP2()
		piedra1 = new Piedra(imagen = "piedra_1.png", posicion = game.at(3, 2), limiteIzq = -1, limiteDer = 9, move = false)
		piedra2 = new Piedra(imagen = "piedra_1.png", posicion = game.at(5, 2), limiteIzq = -1, limiteDer = 9, move = false)
		piedra1M = new PiedraMagica(imagen = "piedra_magica_1.png", posicion = game.at(0, 0), limiteIzq = -1, limiteDer = 9, move = false)
		piedra2M = new PiedraMagica(imagen = "piedra_magica_2.png", posicion = game.at(8, 0), limiteIzq = -1, limiteDer = 9, move = false)
		vidap1 = new Vida(imagen = "3vidas.png", posicion = game.at(2, 4))
		vidap2 = new Vida(imagen = "3vidas.png", posicion = game.at(6, 4))
		game.addVisual(vidap1)
		game.addVisual(vidap2)
		game.addVisual(piedra1M)
		game.addVisual(piedra2M)
		game.addVisual(p1)
		game.addVisual(p2)
		game.addVisual(piedra1)
		game.addVisual(piedra2)
		game.onCollideDo(p1, { i => i.serAgarradoPor(p1)})
		game.onCollideDo(p2, { i => i.serAgarradoPor(p2)})
	}

}

