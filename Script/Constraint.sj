function Constraint()
{
  this.alias = Aliases.Maven.Constraint;
  this.list =  this.alias.List;
  this.constraintValue = new Object;
  this.constraintValue.list = this.alias.tabControl.Properties.Values;
  this.gridControlNavigator = this.alias.tabControl.Properties.Values.GridControlNavigator;
  
  this.cancel = function(){this.alias.Cancel.ClickButton();}
  this.add = function() {this.alias.Add.ClickButton();}
  this.copy = function() {this.alias.Copy.ClickButton();}
  this.del = function() {this.alias.Delete.ClickButton();}
  this.imp = function() {this.alias.Import.ClickButton();}
  this.ok = function() {this.alias.Ok.ClickButton();}
  this.selectAll = function() {this.alias.SelectAll.ClickButton();}
  this.unSelectAll = function() {this.alias.UnSelectAll.ClickButton();}
  
}