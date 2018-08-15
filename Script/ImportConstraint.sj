function ImportConstraint()
{
  this.alias = Aliases.Maven.ImportConstraints;
  this.list = this.alias.List;
  
  this.cancel = function(){this.alias.Cancel.ClickButton();}
  this.importt = function(){this.alias.Import.ClickButton();}
  this.selectAll = function(){this.alias.SelectAll.ClickButton();}
  this.unselectAll = function(){this.alias.UnselectAll.ClickButton();}
  this.browse = function(){this.alias.Browse.ClickButton("Browse");}
  this.load = function(){this.alias.Load.ClickButton("Load");}
}