function NewStrategy()
{
  this.alias = Aliases.Maven.NewStrategyDialogForm;
  
  this.cancel = function(){this.alias.Cancel.Click()}
  this.ok = function(){this.alias.Ok.Click()}
}