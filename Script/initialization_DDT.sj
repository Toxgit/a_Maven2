//USEUNIT ODTInitt
function runAllDDTinit(){cleanCreateClass();DDTinit1();}

function DDTinit1(){ODTInitt.initddt("TestData.xls","Nodes");Log.Message("Загружена новая структура ODT для теста Nodes");}