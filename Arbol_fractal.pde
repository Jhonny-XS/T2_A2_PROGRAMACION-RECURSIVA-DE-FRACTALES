// Declaramos un ángulo inicial y una variable para la longitud de las ramas.
float angulo=PI/4;
int m=(int)random(50, 150);

// Definimos una clase llamada "arbol" para representar los árboles.
class arbol {
  int x;
  arbol(int a) {
    x=a;
  }

  // Esta función dibuja un árbol utilizando la función "FractalLineaCentral".
  void dibujaArbol() {
    FractalLineaCentral(x);
  }
}
// Creamos tres objetos de la clase "arbol".

arbol Arbol1;
arbol Arbol2;
arbol Arbol3;
arbol Arbol4;

void setup() {
  size(640, 480);
  rectMode(CENTER);
  // Inicializamos los objetos "Arbol" con alturas aleatorias.

  Arbol1 = new arbol((int)random(0, 200));
  Arbol2 = new arbol((int)random(0, 200));
  Arbol3 = new arbol((int)random(0, 200));
  Arbol4 = new arbol((int)random(0, 200));
}

void draw() {
  background(0);
  // Ajustamos el ángulo de las ramas según la posición del mouse.
  translate(m, height);
  angulo=map(mouseX, 0, 640, -PI, PI);
  stroke(255);
  // Dibujamos los tres árboles.
  Arbol1.dibujaArbol();
  Arbol2.dibujaArbol();
  Arbol3.dibujaArbol();
  Arbol4.dibujaArbol();
}

// Esta función recursiva dibuja una rama central y las ramas a su izquierda y derecha.
void FractalLineaCentral(int x) {
  pushMatrix();
  line(0, 0, 0, -x);
  translate(0, -x);
  x=2*x/3;
  if (x>1) {
    pushMatrix();
    rotate(angulo);
    line(0, 0, 0, -x);
    FractalLineaCentral(x);
    popMatrix();
    pushMatrix();
    rotate(-angulo);
    line(0, 0, 0, -x);
    FractalLineaCentral(x);
    popMatrix();
  }
  popMatrix();
  translate(m, 0);
}
