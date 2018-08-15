function WindowConfirmation()//в диалоговом окне Save as если уже существует, то спрашивает перезаписать?
{
  this.alias = Aliases.Maven.dlgConfirmation;
  
  this.ok = function(){this.alias.Ok.ClickButton()}
  this.no = function(){this.alias.No.ClickButton()}
}