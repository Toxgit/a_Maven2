function checkDisable (object)
{
  if (object.Enabled == false) Log.Checkpoint("Control is Disable");
  else Log.Warning("Control is Enable");
}

function checkEnable (object)
{
  if (object.Enabled == true) Log.Checkpoint("Control is Enable");
  else Log.Warning("Control is Disable");
}