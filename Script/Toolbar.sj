//видос 5 30:35

function Toolbar()
{
  this.alias = Aliases.Maven.MainForm.BarMainMenu;
  
  this.newStrategy = function(){this.alias.File.wItems.Item("New Strategy").Click();}
  this.openStrategy = function(){this.alias.File.wItems.Item("Open Strategy...").Click();}
  this.openStrategyRemote = function(){this.alias.File.wItems.Item("Open Strategy Remote...").Click();}
  
  this.print = function(){this.alias.File.wItems.Item("Print Strategy...").Click();}  
  this.PrintPreview = function(){this.alias.File.wItems.Item("Print Preview Strategy ...").Click()}
    
  this.save = function(){this.alias.File.wItems.Item("Save Strategy").Click()}
  this.saveAs = function(){this.alias.File.wItems.Item("Save Strategy As...").Click()}
  this.saveImage = function(){this.alias.File.wItems.Item("Save Strategy As Image ...").Click()}
  this.saveAll = function(){this.alias.File.wItems.Item("Save All").Click()}
  
  this.variables = function(){this.alias.Strategy.wItems.Item("Variables...").Click()}
  this.constraint = function(){this.alias.Strategy.wItems.Item("Constraints...").Click()}
  this.UpdateSelectedNodes = function(){this.alias.Strategy.wItems.Item("Update Selected Nodes").Click()}
  
  this.close = function(){this.alias.Strategy.wItems.Item("Close").Click()}
  this.closeAll = function(){this.alias.Strategy.wItems.Item("Close All Strategies").Click()}
}