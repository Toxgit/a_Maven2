//new
//USEUNIT Menu

var menu = new Menu.Menu();

function menu_newStrategy(){menu.newStrategy()}
function menu_openStr(){menu.openStrategy()}
function menu_openStrategyRemote(){menu.openStrategyRemote()}
function menu_saveStrategy(){menu.saveStrategy()}
function menu_saveStrategyAs(){menu.saveStrategyAs()}
function menu_saveAll(){menu.saveAll()}
function menu_options(){menu.options()}
function menu_RemoveUnusedVariables(){menu.RemoveUnusedVariables()}
function menu_exit(){menu.exit()}
//*********View*******
function setView (view, value){
  var actualState = findStateView(view)
  if (actualState == 3){Log.Warning(aqString.Format("View - %s не найдена в приложении", view));}
  else{ 
    if (value != actualState) menu.alias.wItems.Item("View").Items.Item(view).Click();
    if (value == 1)Log.Checkpoint(aqString.Format("View - %s открытa.", view));
    else Log.Checkpoint(aqString.Format("View - %s закрыта.", view));
  } 
}
function findStateView(view){
  for(var i=0; i < menu.alias.wItems.Item("view").Items.Count; i++){
    var theView = menu.alias.wItems.Item("view").Items.Item(i).Text;
    var theState = menu.alias.wItems.Item("view").Items.Item(i).State;
    if(theView == view){return theState;} 
  }
  return 3;
}
function openOnlyNodesNav (){
  setView ("Strategy Navigator", 0);
  setView ("Tree Strategies", 0);
  setView ("Nodes Navigator", 1);
}
function openOnlyNodesCon(){
  setView ("Properties", 0);
  setView ("Nodes Container", 1);
}

function openOnlyDebugVariables(){
  setView ("Output", 0);
  setView ("Debug: Column Strategy Variables", 0);
  setView ("Debug: Call Stack", 0);
  setView ("Debug: Strategy Variables", 1);
}
//********Debug*********
function setDebugOnSrv (value){
  var actualState = menu.alias.wItems.Item("Debug").Items.Item("Debugging on the server").State;
  if (value != actualState) menu.alias.wItems.Item("Debug").Items.Item("Debugging on the server").Click();                          
  if (value == 1)Log.Checkpoint("Debug on srv - включен.");
    else Log.Checkpoint("Debug on srv - выключен.");   
}
