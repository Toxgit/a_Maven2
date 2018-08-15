//old но оставим просто выпилим все лишнее
//USEUNIT Settings
//USEUNIT TextBox

function WindowSaveAs(){

  this.alias = Aliases.Maven.dlgSaveAs;
  
  this.ok = function(){
    this.alias.Save.ClickButton();
  }
  this.cancel = function(){
    this.alias.Cancel.ClickButton();
  }
  this.setName = function (name){
    var path = strLocation + name;
    if (name == "clear") path = "clear";
    textBoxSetText(this.alias.Name, path);
  }
 
  // этот метод пилил не помню для чего, возможно не хотел создавать доп. поле в excel, ниже другой метод
  /*
  this.setMyName = function (name)
  {
    textBoxSetText(this.alias.Name, name);
    return this;
  }
 
  /*this.save = function()
  {
    this.alias.Save.ClickButton();
     var maven = new Maven.Maven();
    if (maven.WindowConfirmation())return maven.WindowConfirmation();
    else return new WindowInformation.WindowInformation();
  }*/  
}