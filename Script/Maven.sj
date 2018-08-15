//USEUNIT WindowInformation
//USEUNIT WindowConfirmation

function Maven(){
  this.alias = Aliases.Maven;
  
  this.strategyExists = function(){
    if (this.alias.MainForm.WorkForm.StrategyForm.Exists)
      return true;
    else return false;
  }
  this.hotkeys = function(keys){
    this.alias.MainForm.Keys(keys);
  }
}

function NewMaven(){
  return new Maven();
}


/*  //winError Exists? ЭТИ МЕТОДЫ ПЕРЕНЕС В ХЕЛПЕНИ САМИХ ФОРМ   
  this.winErrorExists = function(){
    if (this.alias.WindowError.Exists)
      return true;
    else return false;
  }
  //WindowInformation Exists? if yes return object
  this.WindowInformation = function(){
    if (this.alias.dlgInformation.Exists)
      return new WindowInformation.WindowInformation();
    else return false;
  }
  //WindowConfirmation Exists? if yes return object
  this.WindowConfirmation = function()
  {
    if (this.alias.dlgConfirmation.Exists)
      return new WindowConfirmation.WindowConfirmation();
    else return false;
  }
  //WindowSaveAs Exists? if yes return object
  this.WindowSaveAs = function()
  {
    if (this.alias.dlgSaveAs.Exists)
     return true;//new WindowSaveAs.WindowSaveAs();
    else return false;
  }
  //Variables Exists? 
  this.VariablesExists = function()
  {
    if (this.alias.Variables.Exists)
     return true;//new WindowSaveAs.WindowSaveAs();
    else return false;
  }*/
   
  //метод hotkeys
