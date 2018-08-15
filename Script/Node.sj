function Node()
{
  this.alias = Aliases.Maven.Nodes;
  this.listVar = new Object;
  this.listVar.list = this.alias.ListVar;
  this.listStr = new Object;
  this.listStr.list = this.alias.ListStr;
  
  
  this.ok = function(){this.alias.Ok.Click();}
  this.cancel = function(){this.alias.Cancel.Click();}
  this.toOutputVar = function(){this.alias.OutputVariables.Click(7, 8);}
  this.toInputVar = function(){this.alias.InputVariables.Click(7, 8);}
  this.unlink = function(){this.alias.UnLink.ClickButton();}
  this.link = function(){this.alias.Link.ClickButton();}
  this.createAndLink = function(){this.alias.CreateAndLink.ClickButton();}
  this.autoLink = function(){this.alias.AutoLink.ClickButton();}
  
  
}