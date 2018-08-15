function Menu()
{
  this.alias = Aliases.Maven.MainForm.BarMainMenu.MainMenu;
  
  this.newStrategy = function(){this.alias.wItems.Item("File").Items.Item("New Strategy").Click()}
  this.openStrategy = function(){this.alias.wItems.Item("File").Items.Item("Open Strategy...").Click()}
  this.openStrategyRemote = function(){this.alias.wItems.Item("File").Items.Item("Open Strategy Remote...").Click()}
  this.saveStrategy = function(){this.alias.wItems.Item("File").Items.Item("Save Strategy").Click()}
  this.saveStrategyAs = function(){this.alias.wItems.Item("File").Items.Item("Save Strategy As...").Click()}
  this.saveImage = function(){this.alias.wItems.Item("File").Items.Item("Save Strategy As Image ...").Click()}
  this.saveAll = function(){this.alias.wItems.Item("File").Items.Item("Save All").Click()}
  this.print = function(){this.alias.wItems.Item("File").Items.Item("Print Strategy...").Click()}  
  this.PrintPreview = function(){this.alias.wItems.Item("File").Items.Item("Print Preview Strategy ...").Click()}     
  this.closeAll = function(){this.alias.wItems.Item("File").Items.Item("Close All Strategies").Click()}
  this.closeStrategy = function(){this.alias.wItems.Item("File").Items.Item("Close Strategy").Click()}
  this.exit = function(){this.alias.wItems.Item("File").Items.Item("Exit").Click()}
  
  this.toVariables = function(){this.alias.wItems.Item("Strategy").Items.Item("Variables...").Click()}
  this.RemoveUnusedVariables = function(){this.alias.wItems.Item("Strategy").Items.Item("Remove unused variables...").Click()}
  
  this.options = function(){this.alias.wItems.Item("Tools").Items.Item("Options...").Click()}
}






/*TEST
function test()
{
  var menu  = new Menu();
  menu.saveImage();
}
//sdfsd*/