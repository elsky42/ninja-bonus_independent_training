
func void Patch_BIT_B_RaiseAttribute (var C_NPC oth, var int attrib, var int points)
{
    var int oldReal; oldReal = Patch_BIT_GetRealAttribute (oth, attrib);

    PassArgumentN (oth);
    PassArgumentI (attrib);
    PassArgumentI (points);
    ContinueCall ();

    if (oldReal != -1) {
        var int diff; diff = Patch_BIT_GetRealAttribute (oth, attrib) - oldReal;
        B_RaiseRealAttributeLearnCounter (oth, attrib, -diff);
    };
};
