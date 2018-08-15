//USEUNIT MainMenuHelper
function open_dafaultSetOfViews()
{
  Log.Message("Данный скрипт открыл дефолтный набор вьюх.")
  for (var i=0; i< ODT.Data.Default_views.VariableCount; i++)
    {
      var item = ODT.Data.Default_views.Variables(i).Value;
      setView (item.View, item.State);
    }
}