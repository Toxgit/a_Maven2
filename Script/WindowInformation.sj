function WindowInformation()// стратегия сохранена успешно, при удалении constraints
{
  this.alias = Aliases.Maven.dlgInformation;
  
  this.ok = function(){this.alias.Ok.ClickButton()}
  this.no = function(){this.alias.No.ClickButton()}
}