//USEUNIT Toolbar
//USEUNIT WindowErrorHelper
//USEUNIT MavenHelper

var toolbar = new Toolbar.Toolbar();

function toolbar_newStr(){toolbar.newStrategy()}
function toolbar_openStr(){toolbar.openStrategy()}
function toolbar_openStrategyRemote(){toolbar.openStrategyRemote()}
function toolbar_fullRunDebugMode(){toolbar.alias.Debug.wItems.Item("Full Run Debug Mode").Click()}

function toolbar_variables(){toolbar.variables()}
function toolbar_constraints(){toolbar.constraint()}
function toolbar_UpdateSelectedNodes(){toolbar.UpdateSelectedNodes()}

function toolbar_save(){toolbar.save()}
function toolbar_saveAs(){toolbar.saveAs()}
function toolbar_saveAll(){toolbar.saveAll()}
function toolbar_saveImg(){toolbar.saveImage()}
function toolbar_close(){toolbar.close()}
function toolbar_closeAll(){toolbar.closeAll()}

function toolbar_close_andSave(){
  toolbar.close();
  warning_ok();
}
function toolbar_close_withoutSave(){
  toolbar.close();
  warning_no();
}
function toolbar_closeAll_withoutSave(){
  if (!maven_strategyExists()) return false;
  toolbar_closeAll();
  while (warning_exists()){
    warning_no();
    Log.Message("Стратегия закрыта без сохранения изменений.");
  }
}
