{
  vim = 
    let
      mkLKeyBind = keys: "<leader>" + keys;
      mkCmdAction = action: "<cmd>" + action + "<CR>";
    in 
    {
      mkLKeyBind = mkLKeyBind;
      mkCmdAction = mkCmdAction;
    };
}
