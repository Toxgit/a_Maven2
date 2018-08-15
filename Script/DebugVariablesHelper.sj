//USEUNIT DebugVariables
//USEUNIT ListView

var debugVariables = new DebugVariables.DebugVariables();

function debugVariables_clickRow(name){clickListRowByName(debugVariables, name);}
function debugVariables_checkValue( name, title, value){checkValueOfField(debugVariables, name, title, value);}