function checkBoxSetChecked(chkBox, value)
{
  if (value != chkBox.Checked)
  {
    chkBox.ClickButton();
  }
}

function radiobuttonSetChecked(radiobutton, value)
{
  if (value != radiobutton.wState)
  {
    radiobutton.Click(7, 8);
  }
}