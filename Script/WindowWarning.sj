//USEUNIT WindowSaveAs
function WindowWarning()
{
  this.alias = Aliases.Maven.dlgWarning;
  //диалог при попытке закрыть стратегию, в которой есть не сохраненные изменения 
  //при удалении used constraint
  //при cоздании constraint с недопустимым Name
  
  this.cancel = function(){this.alias.Cancel.ClickButton()}
  this.ok = function(){this.alias.Ok.ClickButton()}
  this.no = function(){this.alias.No.ClickButton()}
  
  //блок ниже нужен для старой MainMenu
  this.close = function(){
    if (this.alias.Exists){
        this.alias.No.ClickButton();
        return true;
    }else return false;
  }
  this.closeAll = function(){
    while (true){
     if (this.alias.Exists){
        this.alias.No.ClickButton();
     } else break;
    }
  }
}