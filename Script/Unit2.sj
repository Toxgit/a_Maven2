﻿//USEUNIT WindowErrorHelper
//USEUNIT ConstraintsHelper
//USEUNIT UpdateDatasetsHelper

function Test5()
{
  Aliases.Maven.UpdateDatasets.List.CheckItem(0, cbUnchecked);
}

function Test1()
{
  updateDatasets_unCheckByIndex(0);
  //Aliases.Maven.UpdateDatasets.List.CheckItem(0, cbChecked);
}