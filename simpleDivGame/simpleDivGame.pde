// Division game for Ete
// easy version -- just a try-out

PFont gameFont;
int problemOrder = 1;  // problem ordering number
int dividend, divisor; // for dividend and divisor, respectively 
int quotient, remainder; // for quotient and remainder, respectively
boolean problemState = true;  // true = problem, false = solution
boolean transit = false; // transit flag (for stay put or pass through)

void setup() {
  // canvas size
  size(600,600);
  // create font for the game
  gameFont = createFont("Helvetica",32);
  
}

void draw() {
  if (problemState && !transit) { // the state where to display problem
    problem();
  } 
  
  if (!problemState && !transit) // the state where to display solution
  {
    solution();
  }
  
}
// random the dividend and divisor
// calculate the result (quotient and remainder)
// display just the problem
void problem() {
  
  background(random(100,250),random(100,250),random(100,250));
  
  // problem title 
  textAlign(LEFT,TOP);
  textFont(gameFont);
  text("Problem "+problemOrder+":",10,10);
  
  // random the number for each problem
  dividend = (int)random(12,1000);
  divisor = (int)random(2,13);
  // integer part
  quotient = dividend/divisor;
  remainder = dividend%divisor;
  
  textFont(gameFont,80);
  textAlign(CENTER,CENTER);
  text(dividend+" / "+divisor+" = ?",width/2,height/2);
  
  problemState = false;
  transit = true;
}

// display the solution 
void solution() {
  textFont(gameFont,32);
  textAlign(LEFT,TOP);
  text("The answer is " + quotient +
       "\n with the remainder of " + remainder, 10, height-100);
  problemState = true;
  transit = true;
  problemOrder++;
}

// click for moving between states (problem <--> solution)
void mousePressed() {
  transit = false;
}

void keyPressed() {
  transit = false;
}