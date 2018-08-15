function MainMenuFile()//это подменю Файл
{
  Log.Message("MainMenuFile");
  this.alias = Aliases.Maven.MainForm.BarMainMenu.MainMenu.wItems.Item(0).Items;
  
  this.toNewStrategy = function()
  {
    this.alias.Item("New Strategy").Click();
  }
//**********************
  this.save = function()
  {
    this.alias.Item("Save Strategy").Click();
  }
  
//Save Strategy As...
   this.saveAs = function()
  {
   this.alias.Item("Save Strategy As...").Click();
  }
//**********************
  this.saveAll = function()
  {
   this.alias.Item("Save All").Click();
  }
//**********************

}
function aaa()
  {
    Log.Message("xxxx");
    mFile = new  MainMenuFile();
    mFile.saveAll();
  }