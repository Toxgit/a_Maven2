//Инициализация ODT драйвера
 function initddt(filename,sheetname){
  var data = OdtRedeclareGroup(sheetname);
  var driver = DDT.ExcelDriver(filename,sheetname);
  while (!driver.EOF()){
    var index = DDT.CurrentDriver.Value(0);
    var classtype = data.AddVarOfClassType(sheetname + index,"ClassDDT");   
    for(var i=1;i<DDT.CurrentDriver.ColumnCount;i++){
      if(DDT.CurrentDriver.Value(i)==null)
        classtype.AddProperty(DDT.CurrentDriver.ColumnName(i),"");
      else 
        classtype.AddProperty(DDT.CurrentDriver.ColumnName(i),DDT.CurrentDriver.Value(i)); 
     }
     driver.Next();  
  }
  DDT.CloseDriver(driver.Name);
 }
 //-------
 function OdtRedeclareGroup(groupname){
 if(OdtGroupExist(groupname))
 ODT.Data.DeleteGroup(groupname);
 return ODT.Data.AddGroup(groupname); 
 }
 function OdtGroupExist(groupname){
  for(var i=0; i<ODT.Data.GroupCount; i++){
    if(ODT.Data.Groups(i).Name == groupname)
      return true;
    }
    return false;
  }
 function cleanCreateClass(){
  ODT.Data.Clear();
	ODT.Classes.Clear();
  ODT.Classes.Declare( "ClassDDT" );
 } 