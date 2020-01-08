//modulesclass

class Modules {
  String code = " ";
  int codeI = 0;
  String title = " ";
  String instructor = " ";
  
  //arguments

Modules(int mCode, String mTitle, String mInstructor){
  
  title = mTitle;
  instructor = mInstructor;
  codeI = mCode;
  
  if(mCode == 1){
    code = "CSD3700";
  }
  if(mCode == 2){
    code = "CSD3810";
  }
  if(mCode == 3){
    code = "CSD3820";
  }
  if(mCode == 4){
    code = "ITX3999";
  }
  if(mCode == 5){
    code = "CSD3999";
  }


}

public void setMtitle(String title){
  this.title = title;
}

public String getMtitle(){
  return title;
}

public void setMcode(String code){
  this.code = code;
}

public String getMcode(){
  return code;
}

public void setcodeI(int codeI){
  this.codeI = codeI;
}

public int getMcodeI(){
  return codeI;
}
//function to display data
void display(){
  fill(0);
  textSize(20);
  text(code + " " + title + " " + instructor, 100, 100);
  translate(0, 20);
}



}