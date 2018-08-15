function UpdateDatasets(){
  this.alias = Aliases.Maven.UpdateDatasets;
  
  this.ok = function(){this.alias.Ok.Click()}
  this.no = function(){this.alias.Close()}
  
  this.check = function(index){this.alias.List.CheckItem(index, cbChecked)}
  this.unCheck = function(index){this.alias.List.CheckItem(index, cbUnchecked)}
}