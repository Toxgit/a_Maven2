function AppOptions(){
  this.alias = Aliases.Maven.AppOptions;
  
  this.ok = function(){this.alias.Ok.Click()}
  this.cancel = function(){this.alias.Cancel.Click()}
  this.apply = function(){this.alias.Apply.Click()}
  this.workFlowEmpty = function(){this.alias.workFlowEmpty.Click()}
  
}