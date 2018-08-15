//USEUNIT restartApp

function GeneralEvents_OnLogError(Sender, LogParams)
{
  //if (maven_strategyExists()) restart();
  //Runner.Halt();
  //Runner.Stop(True);
   //Runner.Stop();
   //restart();
}

function GeneralEvents_OnUnexpectedWindow(Sender, Window, LogParams)
{
  LogParams.Locked = true;
  Window.Close();
  Log.Warning("UnexpectedWindow");
}
