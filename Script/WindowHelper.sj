//USEUNIT WindowWarning

function maximizeWin(scrin){
  scrin.alias.Maximize();
}

function restoreWin(scrin){
  scrin.alias.Restore();
}
function closeScreenWithWarning(object,objectNameForLog)
{
  var wWarning = new WindowWarning.WindowWarning();
  if (objectNameForLog == undefined)objectName="не указан";
  object.cancel();
  wWarning.ok();
  Log.Message("Screen '"+objectNameForLog+"' закрыт, без сохранения изменений")
}