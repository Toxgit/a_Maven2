//Old
//USEUNIT Maven
//USEUNIT OpenStrategy
//USEUNIT Print
//USEUNIT PrintPreview
//USEUNIT Toolbar
//USEUNIT WindowOpenRemote
//USEUNIT WindowWarning

function MainMenuControl()
{
  this.alias = Aliases.Maven.MainForm.BarMainMenu.MainMenu;
  
  var maven = new Maven.Maven();
  
  //menu File
  this.toFile = function()
  {
    this.alias.wItems.Item("file").Click();
  }
  //*******************************************
  
  // дописать возможность создать стратегию через Ctrl+N, и на тулбаре
   this.toNewStrategy = function(item)
  {
    switch (item.options)
    {
      case "hotkey":
        Log.Message("Создание стратегии по hotkey");
        maven.hotkeys("^n");       
        return this.newStrategyDialogForm;
        break;
    
      case "buttonOnToolbar":
        Log.Message("Создание стратегии по кнопке на тулбаре");
        var toolbar = new Toolbar.Toolbar();
        toolbar.newStrategy();
        return this.newStrategyDialogForm;
        break;
    
      default:
      Log.Message("Создание стратегии из главного меню");
      this.alias.wItems.Item("File").Items.Item("New Strategy").Click();
      return this.newStrategyDialogForm;
    }  
  }
  this.newStrategyDialogForm = new NewStrategyDialogForm.NewStrategyDialogForm(); 
  //*******************************************
   this.toNStr = function()
   {
    this.alias.wItems.Item("File").Items.Item("New Strategy").Click();
   }
    
  //Open Strategy  
  this.toOpenStrategy = function(item)
  {
    switch (item.options)
    {
      case "hotkey":
        Log.Message("Открываем стратегию по hotkey");
        maven.hotkeys("^o");
        return this.windowOpen;
        break;
    
      case "buttonOnToolbar":
        Log.Message("Открываем стратегию по кнопке на тулбаре");
        var toolbar = new Toolbar.Toolbar();
        toolbar.openStrategy();
        return this.windowOpen;
        break;
    
      default:
      Log.Message("Открываем стратегию из главного меню");
      this.alias.wItems.Item("File").Items.Item("Open Strategy...").Click();
      return this.windowOpen;
    }
 
  }
  this.windowOpen = new WindowOpen.WindowOpen();
  //*******************************************
  this.toOpenStr =function()
  {
    this.alias.wItems.Item("File").Items.Item("Open Strategy...").Click();
  }
  
  //Open Strategy Remote
  this.toOpenStrategyRemote = function(item)
  {
    switch (item.options)
    {
      case "hotkey":
        Log.Message("Открываем remote strategy по hotkey");
        maven.hotkeys("^j");
        return this.windowOpenRemote;
        break;
    
      case "buttonOnToolbar":
        Log.Message("Открываем remote strategy по кнопке на тулбаре");
        var toolbar = new Toolbar.Toolbar();
        toolbar.openStrategyRemote();
        return this.windowOpenRemote;
        break;
    
      default:
      Log.Message("Открываем remote strategy из главного меню");
      this.alias.wItems.Item("File").Items.Item("Open Strategy Remote...").Click();
      return this.windowOpenRemote;
    }
 
  }
  this.windowOpenRemote = new WindowOpenRemote.WindowOpenRemote();

//*******Save strategy****************************
  this.save = function()
  {
    this.alias.wItems.Item("File").Items.Item("Save Strategy").Click();
  }  
//*******Save Strategy As...*****************
  this.saveAs = function()
  {
    this.alias.wItems.Item("File").Items.Item("Save Strategy As...").Click();
  }
//*******Save Strategy As Image ...************
  this.saveImage = function()
  {
    this.alias.wItems.Item("File").Items.Item("Save Strategy As Image ...").Click();
  }
//*******Save All****************************
  this.saveAll = function()
  {
    this.alias.wItems.Item("File").Items.Item("Save All").Click();
  }  

  
//*******Print****************************
  this.print = function()
    {
      this.alias.wItems.Item("File").Items.Item("Print Strategy...").Click();
    }  
//*******PrintPreview****************************
  this.PrintPreview = function()
    {
      this.alias.wItems.Item("File").Items.Item("Print Preview Strategy ...").Click();
      return new PrintPreview.PrintPreview();
    }  
    
//Close All Strategy
  this.closeAllStrategy = function()
  {
     this.alias.wItems.Item("File").Items.Item("Close All Strategies").Click();
     var winWar = new WindowWarning.WindowWarning();
     winWar.closeAll();
  }
//просто нажати CloseAll в меню
  this.closeAll = function()
  {
     this.alias.wItems.Item("File").Items.Item("Close All Strategies").Click(); 
  }
  //*******************************************
  
  //Close Strategy
  this.closeStrategy = function()
  {
    if (maven.strategyExists())
     { 
       Log.Message("стратегия существуе, закрываем ее.")
       this.alias.wItems.Item("File").Items.Item("Close Strategy").Click();
       var winWar = new WindowWarning.WindowWarning();
       if (!winWar.close()) Log.Message("Стратегия  без изменений, закрылась без сообщения Do You want to save it?");
     }else Log.Message("стратегия не существуе, закрывать нечего.");
  }
  //*******************************************
  //Close Strategy
  this.closeOneStr = function()
  {
    this.alias.wItems.Item("File").Items.Item("Close Strategy").Click();
  }
  
  //Close Strategy and save
  this.closeStr = function()
  {
    if (maven.strategyExists())
     {
      this.alias.wItems.Item("File").Items.Item("Close Strategy").Click();
      return new WindowWarning.WindowWarning();
     }
  }
//*******Exit****************************
   this.exit = function()
  {
     this.alias.wItems.Item("File").Items.Item("Exit").Click(); 
  }
//***************************************
//***************************************
//***********Variables*******************
  this.toVariables = function()
  {
    this.alias.wItems.Item("Strategy").Items.Item("Variables...").Click();
  }
  
}

