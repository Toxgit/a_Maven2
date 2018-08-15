//USEUNIT UpdateDatasets

var updateDatasets = new UpdateDatasets.UpdateDatasets();

function upDatasets_ok(){updateDatasets.ok();}
function upDatasets_no(){updateDatasets.no();}

function updateDatasets_exists(){
  if(updateDatasets.alias.Exists)Log.Checkpoint("Открылось окно updateDatasets");
  else Log.Warning("Окно updateDatasets не открылось") 
}
function updateDatasets_checkByIndex(index){
    updateDatasets.check(index);
}
function updateDatasets_unCheckByIndex(index){
    updateDatasets.unCheck(index);
}
