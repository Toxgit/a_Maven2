//USEUNIT TextBox
//USEUNIT Settings

function OpenStrategy(){
  this.alias = Aliases.Maven.dlgOpen;
  
  this.ok = function(){this.alias.Ok.ClickButton()}
  this.cancel = function(){this.alias.Cancel.ClickButton()}
  
  this.setProjPath = function(path){
    var projPath = strLocation + path;
    if (path == "clear") projPath = "clear";
    textBoxSetText(this.alias.Path, projPath);
  }
}