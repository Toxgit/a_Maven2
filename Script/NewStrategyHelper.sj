//USEUNIT NewStrategy
//USEUNIT TextBox
//USEUNIT MainMenuHelper
//USEUNIT WindowErrorHelper
//USEUNIT ToolbarHelper

var menu = new Menu.Menu();
var newStrategy = new NewStrategy.NewStrategy();

function newStrategy_ok(){newStrategy.ok()}
function newStrategy_cancel(){newStrategy.cancel()}
function newStrategy_setName(name){textBoxSet(newStrategy.alias.Name, name)}

function createNewStrategy(){
  toolbar_newStr();
  newStrategy_ok();
  Log.Message("Создана новая default стратегия.")
}
function newStrategy_fillInOk(item){
  textBoxSet(newStrategy.alias.Name, item.name);
  textBoxSet(newStrategy.alias.Description, item.Description);
  textBoxSet(newStrategy.alias.StrategyType, item.StrategyType);
  newStrategy_ok();
}
function newStrategy_fillInCancel(item){
  textBoxSet(newStrategy.alias.Name, item.name);
  textBoxSet(newStrategy.alias.Description, item.Description);
  textBoxSet(newStrategy.alias.StrategyType, item.StrategyType);
  newStrategy_cancel();
}
function newStrategy_verify(item){ 
  var maven = Runner.CallMethod("Maven.NewMaven"); 
  if (item.expectedResult == "Fail"){
    if (winError_exists()){
      Log.Checkpoint(aqString.Format("Strategy не создана!  '%s' ", item.name));
      //("Проверка сообщения об ошибке.");
      if (winError_text() == item.error)Log.Checkpoint(aqString.Format("Текст ошибки правильный.'%s' ", item.error));//Блок проверки валид. сообщения 
      else {Log.Warning("Текст ошибки неправильный.");Log.Message(winError_text());Log.Message(item.error);}
      winError_close();
      newStrategy_cancel();
    }else{
      if (maven_strategyExists()){
        Log.Warning(aqString.Format("Strategy  - создана, хотя не должна. '%s'", item.name));
        toolbar_close_withoutSave();
      }else{
        Log.Checkpoint(aqString.Format("Strategy  не создана. '%s'", item.name));
      }
    }
  }else{//блок для Pass
    if (maven_strategyExists()){
      Log.Checkpoint(aqString.Format("Strategy  - '%s' Exists.", item.name));
      toolbar_close_withoutSave();
      Log.Message("Закрыли стратегию без сохранения.")
      return true;
    }else{
        Log.Warning(aqString.Format("Strategy  - '%s' не создана, хотя должна.", item.name));
        return false;
    }
  }
}