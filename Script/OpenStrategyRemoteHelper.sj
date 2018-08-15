//USEUNIT OpenStrategyRemote
//USEUNIT ListView
//USEUNIT ToolbarHelper

var openRemote = new OpenStrategyRemote.OpenStrategyRemote();

function getVersionName(name){return openRemote.list.wItems.Item(name).Items.Item(0).Text}

function openStrRemote_cancel(){openRemote.cancel()}
function openStrRemote_ok(){openRemote.ok()}
function openStrRemote_SelectItem(name){ListViewSelectItem(openRemote.list, name)}
function openStrRemote_SelectSubItem(name){ListViewPickSubVersion(openRemote.list, name)}

function openStrRemote_quickly(name){
  toolbar_openStrategyRemote();
  openStrRemote_SelectItem(name);
  openStrRemote_ok();
  Log.Message("Cтратегия '"+name+"' - открыта.");
}
function openStrRemote_VersionQuickly(name){
  toolbar_openStrategyRemote();
  openStrRemote_SelectSubItem(name);
  openStrRemote_ok();
  Log.Message("Cтратегия '"+name+"' - открыта.");
}