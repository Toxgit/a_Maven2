//USEUNIT MainMenu
//USEUNIT Maven
//USEUNIT ODTInitt
//USEUNIT Print
//USEUNIT PrintPreview
//USEUNIT TestLogging
//USEUNIT Toolbar
//USEUNIT WindowSaveAs
//USEUNIT WindowWarning

// создание структуры DDT из файла TestData.xls
function ODTinit(){ ODTInitt.initddt("TestData.xls","NewStrategy");Log.Message("Загружена новая структура ODT для теста по созданию новых стратегий.");}

function NewStrategyTest()
{
  BeginTestTransaction("Create New Strategy","тест проверяет создание стратегии.");
  var maven = new Maven.Maven();
  var nsdf = new NewStrategyDialogForm.NewStrategyDialogForm();
  var menu = new MainMenuControl();
  var toolbar = new Toolbar.Toolbar();
  var wSaveAs = new WindowSaveAs.WindowSaveAs();
  var print = new Print.Print();
  var printPreview = new PrintPreview.PrintPreview();
  var wWarning = new WindowWarning.WindowWarning();

  
  /*if (maven.strategyExists()) 
        menu.closeStrategy();*/
   for (var i=0; i< ODT.Data.NewStrategy.VariableCount; i++)
      {
      logStep("Iteration "+i);
        var item = ODT.Data.NewStrategy.Variables(i).Value;
          
       //Открываем окно создания стратегии
      
      nsdf = menu.toNewStrategy(item);
      
     switch (item.options)
     {
       case "is register independent"://Тест декомпозирован
         nsdf.fillInOk(item);
         item.name = aqString.ToUpper(item.name);
         nsdf = menu.toNewStrategy(item);
         nsdf.fillInOk(item);
         nsdf.verifyStr(item);
         menu.closeAllStrategy();
         break;
         
       case "unique among open strategies"://Тест декомпозирован
         nsdf.fillInOk(item);
         nsdf = menu.toNewStrategy(item);
         nsdf.fillInOk(item);
         nsdf.verifyStr(item);
         menu.closeAllStrategy();
         break;
     
       case "cancel"://Тест декомпозирован
          nsdf.fillInCancel(item);
          if (nsdf.verifyStr(item))menu.closeStrategy();
         break;
         
       case "saveAs cancel"://Тест декомпозирован
          Log.Message("Проверка отмены на окне Сохранить как.");
          nsdf.fillInOk(item);
          menu.closeStr().ok();
          wSaveAs.cancel();
          if (!nsdf.verifyStr(item))break;
          Log.Message("Проверка отмены на окне'do you want to save strategy'");
          menu.closeStr().cancel();
          if (nsdf.verifyStr(item))menu.closeStrategy();
         break;
         
       case "saveAs Ok"://Тест декомпозирован
          Log.Message("Проверяем сохранение стратегии при закрытии.");
          nsdf.fillInOk(item);
          menu.closeStr().ok();
          wSaveAs.setName(item).save().ok();          
          if(maven.WindowInformation()){maven.WindowInformation().ok();Log.Checkpoint("Стратегия с name "+item.name+" успешно сохранена.");}
          menu.closeStrategy();
         break;
         
       case "save"://Тест декомпозирован
          Log.Message("Проверяем сохранение стратегии по кнопкам Save.");
          nsdf.fillInOk(item);
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
          break;
//********************************************************* 
       case "save as"://Тест декомпозирован
              nsdf.fillInOk(item);
              if (maven.strategyExists())
                {
                  Log.Message("Cтратегия "+ item.name+" создана.");
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
       case "save all"://Тест декомпозирован
        Log.Message("Проверка Save All")
        nsdf.ok();
        Log.Checkpoint("Startegy1 создана.");
        menu.toNewStrategy(item);
        nsdf.ok();
        Log.Checkpoint("Startegy2 создана.");
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
        break;
//**********Save Strategy As Image**************************
      case "save image"://Тест декомпозирован
        Log.Message("Проверка Save Image")
        nsdf.fillInOk(item);
        menu.saveImage();
        Log.Message("Проверка потытки сохранить с пустым именем");
        wSaveAs.setMyName("").save();
        Log.Checkpoint("Image c пустым именем не сохранилась.")
        Log.Message("Проверка cansel на шаге сохранения (окно sase as)");
        wSaveAs.cancel();
        Log.Checkpoint("Image не сохранилась.")
        Log.Message("Проверка happy flow для " + item.description);
        toolbar.saveImage();
        wSaveAs.setName(item).save();
        if (maven.WindowConfirmation()){maven.WindowConfirmation().ok();Log.Message("Стратегия существует, перезаписали.") }
        if (maven.WindowInformation())
        {
         Log.Checkpoint("Диалог 'откныть картинку?' - жмем нет.")
         maven.WindowInformation().no();
        }
        menu.closeStrategy();
        Log.Checkpoint("Стратегия закрыта.");
        break; 

//**********print*************************
      case "print": 
        Log.Message("Проверка Print")
        nsdf.fillInOk(item);
        menu.print();
        aqUtils.Delay(15000);
        print.close();
        Log.Checkpoint("Печать через главное меню. закрываем окно Print по кнопке Cancel");
        toolbar.print();
        print.close();
        Log.Checkpoint("Печать через toolbar. закрываем окно Print по кнопке Cancel");
        maven.hotkeys("^p");
        print.close();
        Log.Checkpoint("Печать через hotkey. закрываем окно Print по кнопке Cancel");
        menu.closeStrategy();
        break;      
//**********printPreview*************************
      case "printPreview": 
        Log.Message("Проверка printPreview")
        nsdf.fillInOk(item);
        menu.PrintPreview();
        aqUtils.Delay(15000);
        printPreview.close();
        Log.Checkpoint("Печать через главное меню. закрываем окно Print по кнопке Cancel");
        toolbar.PrintPreview()
        printPreview.close();
        Log.Checkpoint("Печать через toolbar. закрываем окно Print по кнопке Cancel");
        menu.closeStrategy();
        break; 
//**********CloseAll*************************        
      case "closeAll":
        Log.Message("Проверка работы Close All Strategy");
        nsdf.fillInOk(item);
        Log.Checkpoint(item.name +" создана.");
        menu.toNewStrategy(item);
        nsdf.ok();
        Log.Checkpoint("Startegy2 создана.");
        menu.closeAll();
        wWarning.cancel();
        wWarning.cancel();
        Log.Checkpoint("Закрываем два окна Warning по кнопке Cancel");
        Log.Message("Теперь проверяем поведение по кнопке ОК ");
        menu.closeAll();
        wWarning.ok();
        wSaveAs.cancel();
        wWarning.ok();
        wSaveAs.cancel();
        Log.Checkpoint("Два диалога Save as закрыты.");
        menu.closeAllStrategy();
        break;           
//*********************************************************
       
      default:
        //Заполняем форму
        nsdf.fillInOk(item);
        // проверяем создание (Aliases.Maven.MainForm.WorkForm.ChildCount),
        nsdf.verifyStr(item);
        //закрытие стратегииo
        menu.closeStrategy();
     }
  }
  
  EndTestTransaction();
}