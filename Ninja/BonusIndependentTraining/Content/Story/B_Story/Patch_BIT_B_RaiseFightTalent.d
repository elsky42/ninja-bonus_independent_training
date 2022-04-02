
func void Patch_BIT_B_RaiseFightTalent (var C_NPC oth, var int talent, var int percent)
{
    var int oldReal; oldReal = Patch_BIT_GetRealFightTalentPercent (oth, talent);
    
    PassArgumentN (oth);
    PassArgumentI (talent);
    PassArgumentI (percent);
    ContinueCall ();

    if (oldReal != -1) {
        var int diff; diff = Patch_BIT_GetRealFightTalentPercent (oth, talent) - oldReal;
        B_RaiseRealFightTalentPercent (oth, talent, -diff);
    };
};
