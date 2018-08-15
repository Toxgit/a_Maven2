function DataSource(){
  this.alias = Aliases.Maven.DataSource;
  
  this.ok = function(){this.alias.Ok.Click()}
  this.cancel = function(){this.alias.cancel.Click()} 
}