//USEUNIT Logging
function stop()
{
  // Obtains the notepad.exe process
  p = Sys.Process("Maven");
  p.Close();
  if (p.Exists) p.Terminate();
  logMessage("App is stoped.")
}