import java.util.*;

public class Triangle {
  private PVector p1;
  private PVector p2;
  private PVector p3;
  private PVector m12;
  private PVector m23;
  private PVector m31;
  
  Triangle(float p1x, float p1y, float p2x, float p2y, float p3x, float p3y){
    p1 = new PVector(p1x, p1y); 
    p2 = new PVector(p2x, p2y); 
    p3 = new PVector(p3x, p3y);
    m12 = new PVector((p1x+p2x)/2, (p1y+p2y)/2);
    m23 = new PVector((p2x+p3x)/2, (p2y+p3y)/2);
    m31 = new PVector((p3x+p1x)/2, (p3y+p1y)/2);
  }
  
  public PVector getM12(){ return m12; }
  public PVector getM23(){ return m23; }
  public PVector getM31(){ return m31; }
  public PVector getP1(){ return p1; }
  public PVector getP2(){ return p2; }
  public PVector getP3(){ return p3; }
  
  public Triangle[] insideTriangles(){
    Triangle[] inside = new Triangle[3];
    
    inside[0] = new Triangle(p1.x, p1.y, m12.x, m12.y, m31.x, m31.y);
    inside[1] = new Triangle(m12.x, m12.y, p2.x, p2.y, m23.x, m23.y);
    inside[2] = new Triangle(m31.x, m31.y, m23.x, m23.y, p3.x, p3.y);
    return inside;
  }
  
  public void display(){
    stroke(255, 100, 100);
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  }
  
}

Triangle first;
List<Triangle> triangleList;
void setup(){
  size(800,800);
  background(0);
  first = new Triangle(width/2, 0, width, height, 0, height);
  triangleList = new ArrayList<Triangle>();
  triangleList.add(first); 
}

int i = 0;
void draw(){
  noFill();
  noStroke();
  background(0);
  for (Triangle t: triangleList.get(i).insideTriangles()) {
    triangleList.add(t);
  }
  for (Triangle t: triangleList){
    t.display();
  }
  i++;
}
