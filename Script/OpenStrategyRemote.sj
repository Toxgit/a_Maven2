//USEUNIT ListView
function OpenStrategyRemote()
{
  this.alias = Aliases.Maven.dlgOpenRemoteServer;
  this.list = this.alias.List;
  
  this.ok = function(){this.alias.Ok.ClickButton()}
  this.cancel = function(){this.alias.Cancel.ClickButton()}
}