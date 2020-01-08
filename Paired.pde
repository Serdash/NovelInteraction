class Paired {

  Student student;
  Modules module;

  Paired(Student s, Modules m) {
    //arguments 
    student = s;
    module = m;
  }

  //public void setStudent(Student student){
  //  this.student = student;
  //}

  //public Student getStudent(){
  //  return student;
  //}



  void display() {

    
    fill(#16262E);
    textSize(28);
    text(student.getSname(), 10, 30); 
    fill(#3C7A89);
    textSize(24);
    text(student.getAge() + " " + student.getGender(), 10, 60);
    fill(#2E4756);
    text( module.getMcode() , 10, 90); 
    //textSize(20);
    //text(student.getSname() + " " + student.getAge() + " " + student.getGender() + " " + module.getMtitle(), 100, 100);
    translate(0, 100);
  }
  
   void display2() {
    
    fill(#2E4756);
    text( module.getMcode(), 10, 20); 
    translate(0, 30);
}
}