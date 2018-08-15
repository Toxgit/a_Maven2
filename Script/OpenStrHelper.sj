//new
//USEUNIT OpenStrategy
//USEUNIT ToolbarHelper

var winOpen = new  OpenStrategy.OpenStrategy();

function openStr_ok(){winOpen.ok()}
function openStr_cancel(){winOpen.cancel()}

function openStrategy_quickly(name){
  toolbar_openStr();
  winOpen.setProjPath(name);
  winOpen.ok();
  Log.Message("Cтратегия '"+name+"' - открыта.");
}
function openStrategy_testingData(name){
  toolbar_openStr();
  winOpen.setProjPath("TestingData\\"+name);
  winOpen.ok();
  Log.Message("Cтратегия '"+name+"' - открыта.");
}

function openStr_setProjPath(name){
  winOpen.setProjPath(name);
}
function openStrategy_enterPath_ok(name){
  winOpen.setProjPath(name);
  winOpen.ok();
  Log.Message("Cтратегия '"+name+"' - открыта.");
}