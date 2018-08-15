//USEUNIT MainForm

var mainForm = new MainForm.MainForm();

function mainForm_exists(){
  if(mainForm.alias.Exists) return true;
}

function wait_mainForm(){
  for (var l=0; l<50; l++){
   if (mainForm.alias.Exists){
    break;
   }
  }
}