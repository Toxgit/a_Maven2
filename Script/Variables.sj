function Variables ()
{
  this.alias = Aliases.Maven.Variables;
  this.list = this.alias.List;
  
  this.ok = function(){this.alias.Ok.ClickButton()}
  
  this.cancel = function(){this.alias.Cancel.ClickButton()}
  this.apply = function(){this.alias.Apply.ClickButton()}
  this.add = function(){this.alias.Add.ClickButton()}
  this.del = function(){this.alias.Delete.ClickButton()}
  this.copy = function(){this.alias.Copy.ClickButton()}
  this.selectAll = function(){this.alias.SelectAll.ClickButton()}
  this.unSelectAll = function(){this.alias.DeselectAll.ClickButton()}
  this.click = function(x,y){this.alias.Click(x,y)}
  //********************
  this.DetalInfoLinkedList = new Object;
  this.DetalInfoLinkedList.list = this.alias.tabControl.linkedList;
  this.DetalInfoUsedList = new Object;
  this.DetalInfoUsedList.list = this.alias.tabControl.usedList;
  this.DetalInfoScriptList = new Object;
  this.DetalInfoScriptList.list = this.alias.tabControl.scriptList;  
  //******************/
  
  this.toSelectConstraint = function(){
    var x = this.alias.Properties.ConstraintButton.Width - 10;
    this.alias.Properties.ConstraintButton.Click(x,5);
  }
}