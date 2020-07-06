import wollok.game.*
import characters.*

object level {
    var p1
    var p2
    var piedra1
    var piedra2
   

    method inicio() {
        game.width(7)
        game.height(3)
        game.boardGround("gigantedevillafox.png")
        p1 = new Jugador(imagen ="cadu1.png" , posicion = game.at(1,1), limiteIzq = 0, limiteDer = 2, direccion = 1, contador = 0)
        keyboard.w().onPressDo{p1.moverArriba()}
        keyboard.a().onPressDo{p1.moverIzquierda()}
        keyboard.s().onPressDo{p1.moverAbajo()}
        keyboard.d().onPressDo{p1.moverDerecha()}
        keyboard.g().onPressDo{p1.lanzarPiedra()}
        p2 = new Jugador(imagen ="dalmine_1.png" , posicion = game.at(5,1), limiteIzq = 4, limiteDer = 6, direccion = -1, contador = 0)
        keyboard.up().onPressDo{p2.moverArriba()}
        keyboard.left().onPressDo{p2.moverIzquierda()}
        keyboard.down().onPressDo{p2.moverAbajo()}
        keyboard.right().onPressDo{p2.moverDerecha()}
        keyboard.l().onPressDo{p2.lanzarPiedra()}
        piedra1 = new Piedras(imagen ="piedra_1.png" , posicion = game.at(2,1), limiteIzq = -1, limiteDer = 7)
        piedra2 = new Piedras(imagen ="piedra_1.png" , posicion = game.at(4,1), limiteIzq = -1, limiteDer = 7)
        game.addVisual(p1)
        game.addVisual(p2)
        game.addVisual(piedra1)
        game.addVisual(piedra2)
        game.onCollideDo(p1, {i => i.serAgarradoPor(p1)})
        game.onCollideDo(p2, {i => i.serAgarradoPor(p2)})
//        game.onCollideDo(p1, {i => i.recibeGolpe(p1)})
//        game.onCollideDo(p2, {i => i.recibeGolpe(p2)})
    }
    
    
			// Spawn piedra random
   		 method agregarPiedra(player) {
       		if (player.contador() < 3){
       		var x
       		var y
       		if(player.limiteIzq() == 0){
       			x = 0.randomUpTo(2).truncate(0)
       		}
       		else{
       			x = 3.randomUpTo(6).roundUp()
       		}
       		y = 0.randomUpTo(2).roundUp()
       		var piedraR = new Piedras(imagen ="piedra_1.png", posicion = game.at(x,y) , limiteIzq = -1, limiteDer = 7)
       		game.addVisual(piedraR)}
       		
             }
        
        
        
        
}