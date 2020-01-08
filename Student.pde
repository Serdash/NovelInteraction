//studentclass

class Student {
  String name = " ";
  int age = 0;
  String gender = " ";
  
  //arguments

Student(String sName, int sAge, boolean sGender){
  name = sName;
  age = sAge;

  if (sGender == true){
    gender = "Female";
  }
  else {
    gender = "Male";
  }


}

public void setSname(String name){
  this.name = name;
}

public String getSname(){
  return name;
}


public void setAge(int age){
  this.age = age;
}

public int getAge(){
  return age;
}

public void setGender(String gender){
  this.gender = gender;
}

public String getGender(){
  return gender;
}
//function to display data
void display(){
  fill(0);
  textSize(20);
  text(name + " " + age + " " + gender, 200, 100);
  translate(0,20);
}


}