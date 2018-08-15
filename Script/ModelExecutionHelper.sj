//USEUNIT ModelExecution

var modelExecution = new ModelExecution.ModelExecution();

function modelExecution_cancel(){modelExecution.cancel()}

function modelExecution_Exists_cancel(){
  if(modelExecution.alias.Exists)
    modelExecution_cancel();
}