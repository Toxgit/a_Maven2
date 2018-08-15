//USEUNIT MainMenu
//USEUNIT Maven
//USEUNIT ODTInitt
//USEUNIT TestLogging
//USEUNIT Toolbar
//USEUNIT WindowSaveAs
/*
function ODTinit(){ ODTInitt.initddt("TestData.xls","OpenStrategy");Log.Message("Загружена новая структура ODT для теста по Open Strategy.");}

function TestOpenStrategy()
{
  BeginTestTransaction("Open Strategy","тест проверяет открытие стратегии локально, remote.");
  var maven = new Maven.Maven();
  var menu = new MainMenuControl();
  var toolbar = new Toolbar.Toolbar();
  var wSaveAs = new WindowSaveAs.WindowSaveAs();
  /*
  if (maven.strategyExists()) 
        menu.closeStrategy();
    */    
 /* for (var i=0; i< ODT.Data.OpenStrategy.VariableCount; i++)
      {
        logStep("Iteration "+i);
        var item = ODT.Data.OpenStrategy.Variables(i).Value;
        
        if (item.description != "remote"){
          var osdf = menu.toOpenStrategy(item);
          switch (item.options)
          {
            case "cancel":
              osdf.ok();
              Log.Message("Do not select strategy, press OK");
              osdf.setPath(item).cancel();
              if (maven.strategyExists())
              {
                Log.Warning("Cтратегия "+ item.name+" открылась. ID проверки - "+ item.id);
                menu.closeStrategy();
              }else  Log.Checkpoint("После нажатия Cancel Cтратегия "+ item.name+" не открылась.");
              break;
              
            case "save":
              osdf.setPath(item).ok();
              Log.Message("Cтратегия "+ item.name+" открылась.");
              Log.Message("Проверяем сохранение стратегии по кнопке Save.")
              maven.hotkeys("^s");
              if (maven.WindowInformation()){maven.WindowInformation().ok();Log.Checkpoint("HotKey - Открылось окно Saved successfully.");}
              toolbar.save();
              if (maven.WindowInformation()){maven.WindowInformation().ok();Log.Checkpoint("Toolbar - Открылось окно Saved successfully.");}
              menu.save();
              if (maven.WindowInformation()){maven.WindowInformation().ok();Log.Checkpoint("MainMenu - Открылось окно Saved successfully.");}
              menu.closeStrategy(); 
              
              break;
//*********************************************************            
              case "save as":
                osdf.setPath(item).ok();
                if (maven.strategyExists())
                  {
                    Log.Message("Cтратегия "+ item.name+" открылась.");
                    Log.Message("Проверяем сохранение стратегии по кнопкам Save As.");
                    toolbar.saveAs();
                    if (maven.WindowSaveAs()){wSaveAs.cancel();Log.Checkpoint("Toolbar - Открылось окно Save As.");}
                    menu.saveAs();
                    if (maven.WindowSaveAs())
                    {
                      Log.Checkpoint("MainMenu - Открылось окно Save As.");
                      wSaveAs.cancel();
                    }
                    menu.closeStrategy(); 
                  }              
                  break;
 //*******Save All**************************************************
            case "save all":
              Log.Message("Проверка save all");
              osdf.setPath(item).ok();
              item = ODT.Data.OpenStrategy.Variables(i-1).Value;
              osdf = menu.toOpenStrategy(item);
              osdf.setPath(item).ok();
              Log.Checkpoint("Две стратегии открыты");
              
              menu.saveAll();
              Log.Message("Жмем Menu  Save All");
              maven.WindowInformation().ok();
              maven.WindowInformation().ok();
              Log.Checkpoint("Два диалога Saved successfully закрыты.");
              toolbar.saveAll();
              Log.Message("Жмем Save all на toolbar")
              maven.WindowInformation().ok();
              maven.WindowInformation().ok();
              Log.Checkpoint("Два диалога Saved successfully закрыты.");
              menu.closeAllStrategy();
              Log.Checkpoint("Два cтратегии закрыты.");
              break;
  //*********************************************************
  
            default:
              osdf.ok();
              Log.Message("Do not select strategy, press OK");
              osdf.setPath(item).ok();
              if (maven.strategyExists())
              {
                Log.Message("Cтратегия "+ item.name+" открылась.");
                menu.closeStrategy();
              }  
        }}else
        {
          var osrdf = menu.toOpenStrategyRemote(item);
          switch (item.options)
          {
            case "cancel"://****************************
              osrdf.cancel();
              if (maven.strategyExists())
              {
                Log.Warning ("Cтратегия "+ item.name+" открылась, после таго как нажали Cancel.");
                menu.closeStrategy();
              }
              break;

            case "save"://*************************
               ListViewSelectItem(osrdf.list, item.name);
              osrdf.ok();
              if (maven.strategyExists())
                {
                  Log.Message("Cтратегия "+ item.name+" открылась.");
                  Log.Message("Проверяем сохранение стратегии по кнопкам Save.");
                  maven.hotkeys("^s");
                  if (maven.WindowSaveAs()){wSaveAs.cancel();Log.Checkpoint("HotKey - Открылось окно Save As.");}
                  toolbar.save();
                  //aqUtils.Delay(3000);
                  if (maven.WindowSaveAs()){wSaveAs.cancel();Log.Checkpoint("Toolbar - Открылось окно Save As.");}
                  menu.save();
                  if (maven.WindowSaveAs())
                  {
                    Log.Checkpoint("MainMenu - Открылось окно Save As.");
                    wSaveAs.setName(item).save().ok();
                    if(maven.WindowInformation()){maven.WindowInformation().ok();Log.Checkpoint("Стратегия с name "+item.name+" существует, перезаписали ее.");}
                    menu.save();
                    if (maven.WindowInformation()){maven.WindowInformation().ok();Log.Checkpoint("For a strategy saved eralier  - Открылось окно Saved successfully.");}
                    menu.closeStrategy(); 
                  }
                }              
                break;
//*********************************************************
            case "save as"://**********
              ListViewSelectItem(osrdf.list, item.name);
              osrdf.ok();
              if (maven.strategyExists())
                {
                  Log.Message("Cтратегия "+ item.name+" открылась.");
                  Log.Message("Проверяем сохранение стратегии по кнопкам Save As.");
                  toolbar.saveAs();
                  if (maven.WindowSaveAs()){wSaveAs.cancel();Log.Checkpoint("Toolbar - Открылось окно Save As.");}
                  menu.saveAs();
                  if (maven.WindowSaveAs())
                  {
                    Log.Checkpoint("MainMenu - Открылось окно Save As.");
                    wSaveAs.cancel();
                  }
                  menu.closeStrategy(); 
                }              
                break;
//*********************************************************
 //*******Save All*****************************************
            case "save all"://************************
              Log.Message("Проверка save all");
              
              ListViewSelectItem(osrdf.list, item.name);
              osrdf.ok();
              item = ODT.Data.OpenStrategy.Variables(i-1).Value;
              osrdf = menu.toOpenStrategyRemote(item);
              ListViewSelectItem(osrdf.list, item.name);
              osrdf.ok();
              Log.Checkpoint("Две стратегии открыты");
              
              menu.saveAll();
              Log.Message("Жмем Menu  Save All");
              wSaveAs.cancel();
              wSaveAs.cancel();
              Log.Checkpoint("Два диалога Save as закрыты.");
              
              toolbar.saveAll();
              Log.Message("Жмем Save All на toolbar")
              wSaveAs.cancel();
              wSaveAs.cancel();
              Log.Checkpoint("Два диалога Save as закрыты.");
              menu.closeAllStrategy();
              Log.Checkpoint("Два cтратегии закрыты.");
              break;
//*********************************************************
            case "earlier version"://*****************
              ListViewSelectSubItem(osrdf.list, item);
              osrdf.ok();
              if (maven.strategyExists())
                {
                  Log.Message("Cтратегия " + item.versionName + " открылась.");
                  menu.closeStrategy();
                }
              break;
          
            default://********
            ListViewSelectItem(osrdf.list, item.name);
            osrdf.ok();
            if (maven.strategyExists())
              {
                Log.Message("Cтратегия "+ item.name+" открылась.");
                menu.closeStrategy();
              }
      //    }
          
       // }
        
        
      }  
  EndTestTransaction();
}*/