function GetTooltipsText()
{
  var i, p, w, startTime, timeout, tooltips, tooltipText, tooltipFound;
  
  timeout = 6000;
  
  p = Sys.Process("Maven");
  tooltipsText = new Array();
  startTime = GetTickCount();
  do {
    p.Refresh();
    tooltips = GetTooltips(p);
    for(i = 0; i < tooltips.length; i++) {
      if (!tooltips[i].Visible) {
        continue;
      } 
      if (aqObject.IsSupported(tooltips[i], "wText")) {
        if ("" != tooltips[i].wText) {
          tooltipsText[tooltipsText.length] = tooltips[i].wText;
        }
      }
      else if (aqObject.IsSupported(tooltips[i], "Text")) {
        if ("" != tooltips[i].AccessibleName) {
          tooltipsText[tooltipsText.length] = tooltips[i].AccessibleName;
        }
      }
    }
  }while((0 == tooltipsText.length) && (timeout > GetTickCount() - startTime));
  
  for(i = 0; i < tooltipsText.length; i++) {
   Log.Message("The text of tooltip #" + i + " is:\r\n" + tooltipsText[i]);
  }
  Log.Message(tooltipsText.length);//не обязательно  ,создано для теста
}
 
function GetTooltips(p)
{
  var i, objectIndex, tempObjects, tooltips;
  
  tooltips = new Array();
  
  for(i = 0; i < 2; i++) {
    switch(i) {
      case 0:
        tempObjects = VBArray(p.FindAllChildren("WndClass", 
                                "*tooltips_class32*")).toArray();
        break;
        
      case 1:
        tempObjects = VBArray(p.FindAllChildren("ClrClassName", 
                                "ToolTipFormEx")).toArray();
        break;
        
      default:
        Log.Error("The " + i + " index is not known");
        break;
    }
    for(objectIndex = 0; objectIndex < tempObjects.length; objectIndex++) {
      tooltips[tooltips.length] = tempObjects[objectIndex];
    }
  }
  return tooltips;
}

























/*
function getTooltipText()
{
  var i, p, w, startTime, timeout, tooltips, tooltipText, tooltipFound;
  timeout = 30000;
  p = NameMapping.Sys.Maven;
  tooltipText = new Array();
  
  startTime = GetTickCount();
  do{
    p.Refresh();
    tooltips = GetTooltips(p);
    
    for (i=0; tooltips.length; i++)
    {
      if (!tooltips[i].Visible)continue;
      if(aqObject.IsSupported(tooltips[i],"wText"))
      {
        if(tooltips[i].wText !="")
        {
          return tooltips[i].wText;
        }
      }
      else if (aqObject.IsSupported(tooltips[i],"Text"))
      {
        if(tooltips[i].AccessibleName !="")
        {
          return tooltips[i].AccessibleName;
        }
      }
    }
  }while (timeout > GetTickCount() - startTime);
  
  Log.Warning("Tooltips were not found withing timeout");
  return "";
}
function GetTooltips(p)
{
  var i, objectIndex, tempObjects, tooltips;
  tooltips = new Array();
  for (i=0; i<2;i++)
  {
    switch (i)
    {
      case 0:
        tempObjects = VBArray(p.FindAllChildren("WndClass","*tooltips_class32*")).toArray();
        break;
    
      case 1:
        tempObjects = VBArray(p.FindAllChildren("ClrClassName","ToolTipFormEx")).toArray();
        break;
    
      default:
          Log.Error("The "+i+" index is not known")
          break;
    }
    for (objectIndex=0; objectIndex<tempObjects.length; objectIndex++)
    {
      tooltips[tooltips.length] = tempObjects[objectIndex];
    }
  }
  return tooltips;
}*/