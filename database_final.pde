/*
  Tracked Objects
 TUIO 1.1 Demo for Processing
 
 Modified by Bob Fields Sept 2016.
 
 Note: we need to used the 
 synchronized(objects) {
 ...
 }
 construct to avoid problems when two threads use the objects mapping. 
 Without synchronisation, if the map is modified (e.g. by adding or removing an item)
 while another thread is using it, a ConcurrentModificationException is thrown.
 
 */

// import the TUIO library
import TUIO.*;
import java.util.Map;
import java.util.Collections;
import java.util.List;

// declare a TuioProcessing client
TuioProcessing tuioClient;

// these are some helper variables which are used
// to create scalable graphical feedback

PFont font;
Map<Integer, TrackedObject> objects = 
  Collections.synchronizedMap(new HashMap<Integer, TrackedObject>());
int ageObj1 = 0;
String genderObj = null;
int moduleObj= 0;


int distance = 0;
ArrayList <Student> studentsList = new ArrayList <Student>();
ArrayList <Modules> modulesList = new ArrayList <Modules>();
ArrayList <Paired> completeList = new ArrayList <Paired> ();


void setup()
{
  //size(displayWidth,displayHeight);
  size(1600, 1400);

  rectMode(CENTER);
  noFill();

  font = createFont("Arial", 18);
  textFont(font);

  // finally we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods in this class (see below)
  tuioClient  = new TuioProcessing(this);

  //list of students
  studentsList.add(new Student("Anastasia Romanov", 23, true));
  studentsList.add(new Student("Jon Brady", 19, false));
  studentsList.add(new Student("Sheila Crawford", 18, true));
  studentsList.add(new Student("Kuba McGenius", 21, false));
  studentsList.add(new Student("Jae Park", 25, false));
  studentsList.add(new Student("Lilly Watson", 19, true));
  studentsList.add(new Student("Xander Salvatore", 24, false));
  studentsList.add(new Student("Emmy Gallagher", 21, true));
  studentsList.add(new Student("Levi Ackerman", 23, false));
  studentsList.add(new Student("Edward Elric", 22, false));

  modulesList.add(new Modules(1, "Digital Multimedia Engineering", "Carl James-Reynolds"));
  modulesList.add(new Modules(2, "Novel Interaction Technologies", "Bob Fields"));
  modulesList.add(new Modules(3, "Human Factors in Design", "Mark Springett"));
  modulesList.add(new Modules(4, "IT Project", "Ralph Moseley"));
  modulesList.add(new Modules(5, "Computer Science Project", "Suiping Zhou"));

  completeList.add(new Paired(studentsList.get(0), modulesList.get(1)));
  completeList.add(new Paired(studentsList.get(0), modulesList.get(2)));
  completeList.add(new Paired(studentsList.get(1), modulesList.get(0)));
  completeList.add(new Paired(studentsList.get(2), modulesList.get(2)));
  completeList.add(new Paired(studentsList.get(2), modulesList.get(4)));
  completeList.add(new Paired(studentsList.get(2), modulesList.get(1)));
  completeList.add(new Paired(studentsList.get(3), modulesList.get(3)));
  completeList.add(new Paired(studentsList.get(3), modulesList.get(0)));
  completeList.add(new Paired(studentsList.get(4), modulesList.get(2)));
  completeList.add(new Paired(studentsList.get(5), modulesList.get(2)));
  completeList.add(new Paired(studentsList.get(5), modulesList.get(1)));
  completeList.add(new Paired(studentsList.get(5), modulesList.get(3)));
  completeList.add(new Paired(studentsList.get(6), modulesList.get(4)));
  completeList.add(new Paired(studentsList.get(7), modulesList.get(4)));
  completeList.add(new Paired(studentsList.get(8), modulesList.get(0)));
  completeList.add(new Paired(studentsList.get(8), modulesList.get(1)));
  completeList.add(new Paired(studentsList.get(9), modulesList.get(2)));
  completeList.add(new Paired(studentsList.get(9), modulesList.get(4)));
  completeList.add(new Paired(studentsList.get(9), modulesList.get(3)));
}

// within the draw method we retrieve an ArrayList of type <TuioObject>, <TuioCursor> or <TuioBlob>
// from the TuioProcessing client and then loops over all lists to draw the graphical feedback.
void draw()
{
  background(255);
  //List<TrackedObject> tos = objects.values();
  textSize(32);
text( "STUDENT DATABASE", width/2, 30);
  //distance = dist(TrackedObject.getX, TrackedObject.getY, TrackedObject2.getX, TrackedObject2.getY);
   synchronized(objects) {
     String a = "";
    for (TrackedObject to : objects.values()) {
      to.draw();
    }

    for (int i = 0; i < completeList.size(); i++) {
      if ((genderObj == null || completeList.get(i).student.getGender() == genderObj ) && (ageObj1 == 0 || completeList.get(i).student.getAge() == ageObj1)
      && (moduleObj == 0 || completeList.get(i).module.getMcodeI() == moduleObj)) {
        //Student sList = studentsList.get(i);
        //sList.display();

        Paired cList = completeList.get(i);
        String  b = completeList.get(i).student.getSname();
        if (a!=b)
        cList.display();
        else 
          cList.display2();
        a = completeList.get(i).student.getSname();
      }
      //if (studentsList.get(i).getAge() == ageObj1) {
      //  Student sList = studentsList.get(i);
      //  sList.display();
      //}
    }
  }
}

// --------------------------------------------------------------
// these callback methods are called whenever a TUIO event occurs
// there are three callbacks for add/set/del events for each object/cursor/blob type
// the final refresh callback marks the end of each TUIO frame

// called when an object is added to the scene

void addTuioObject(TuioObject tobj) {
  int id = tobj.getSymbolID();
  if (id == 1) {
    synchronized(objects) {

      ageObj1 = 18;


      TrackedObject o = new TrackedObject(""+ageObj1);

      o.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
      o.size=(int)random(50, 100);
      objects.put(id, o);
    }
  }
  //  if(id == 2){
  //synchronized(objects) {

  //  ageObj1 = 18;


  //  TrackedObject o2 = new TrackedObject(""+ageObj1);

  //  o2.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
  //  o2.size=(int)random(50, 100);
  //  objects.put(id, o2);

  //   } 
  //}
  if (id == 3) {
    synchronized(objects) {

      genderObj = "Female";

      TrackedObject gObj = new TrackedObject("♀");

      gObj.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
      gObj.size=(int)random(50, 100);
      objects.put(id, gObj);
    }
  }
  if (id == 4) {
    synchronized(objects) {

      genderObj = "Male";

      TrackedObject gObj2 = new TrackedObject("♂");

      gObj2.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
      gObj2.size=(int)random(50, 100);
      objects.put(id, gObj2);
    }
  }
  
    if (id == 5) {
    synchronized(objects) {

      moduleObj = 1;
      TrackedObject mObj0 = new TrackedObject("" +moduleObj);

      mObj0.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
      mObj0.size=(int)random(50, 100);
      objects.put(id, mObj0);
    }
  }
  
  // if (id == 6) {
  //  synchronized(objects) {
  //    moduleObj = 2;
      
  //    TrackedObject mObj1 = new TrackedObject(moduleObj);

  //    mObj1.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
  //    mObj1.size=(int)random(50, 100);
  //    objects.put(id, mObj1);
  //  }
  //}
  
  //  if (id == 7) {
  //  synchronized(objects) {
  //    moduleObj = 3;

  //    TrackedObject mObj2 = new TrackedObject(moduleObj);

  //    mObj2.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
  //    mObj2.size=(int)random(50, 100);
  //    objects.put(id, mObj2);
  //  }
  //}
  
  //  if (id == 8) {
  //  synchronized(objects) {
  //    moduleObj = 4;

  //    TrackedObject mObj3 = new TrackedObject(moduleObj);

  //    mObj3.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
  //    mObj3.size=(int)random(50, 100);
  //    objects.put(id, mObj3);
  //  }
  //}
  
  //    if (id == 9) {
  //  synchronized(objects) {
  //    moduleObj = 5;

  //    TrackedObject mObj4 = new TrackedObject(moduleObj);

  //    mObj4.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
  //    mObj4.size=(int)random(50, 100);
  //    objects.put(id, mObj4);
  //  }
  //}
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  int id = tobj.getSymbolID();
  if (id==1) {

    synchronized(objects) {

      float ageObjA = tobj.getAngle(); 
      ageObj1 = int(map(ageObjA, 0, TWO_PI, 18, 26));
      println(ageObj1);


      TrackedObject o = objects.get(id);
      o.setValue(""+ageObj1);
      o.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
      o.setAngle(tobj.getAngle());
    }
  }
  if (id==3) {

    synchronized(objects) {

      TrackedObject gObj = objects.get(id);
      gObj.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
    }
  }
  if (id==4) {

    synchronized(objects) {

      TrackedObject gObj2 = objects.get(id);
      gObj2.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
    }
  }
  
  if (id==5) {

    synchronized(objects) {
 float moduleObjA = tobj.getAngle();
      moduleObj = int(map(moduleObjA, 0, TWO_PI, 1, 5));
      println(moduleObj);
      
      TrackedObject gObj2 = objects.get(id);
      gObj2.setPos(tobj.getScreenX(width), tobj.getScreenY(height));
    }
  }
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  int id = tobj.getSymbolID();
  synchronized(objects) {
    if (objects.containsKey(id)) {
      objects.remove(id);
    }
     if ((id==1)) {
      ageObj1 = 0;
    }
    if ((id == 3 || id == 4)) {
      genderObj = null;
    }
    
    if ((id==5)) {
      moduleObj = 0;
    }
  }
}