//USEUNIT WindowSaveAs
//USEUNIT WindowErrorHelper

var winSaveAs = new WindowSaveAs.WindowSaveAs();

function windowSaveAs_ok(){winSaveAs.ok()}
function windowSaveAs_cancel(){winSaveAs.cancel()}
function windowSaveAs_setName(name){winSaveAs.setName(name)}
function windowSaveAs_exists(){if(winSaveAs.alias.Exists) return true}

function windowSaveAs_fillInOk_replace_ok(name){
  windowSaveAs_setName(name);
  windowSaveAs_ok();
  winConfirmation_exists_ok();
  info_ok();
  Log.Message("Strategy сохранена в окне SaveAs.")
}

function windowSaveAs_replace_ok(){
  windowSaveAs_ok();
  winConfirmation_exists_ok();
  info_ok();
  Log.Message("Strategy сохр.")
}