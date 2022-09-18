/* Returns the trained and effective values of the character
 */
func string Patch_BIT_GetCharacterValues(var string args)
{
    var int s; s = SB_New();

    SB("Str: "); SBi(Patch_BIT_GetRealAttribute(hero, ATR_STRENGTH));
    SB(" "); SBi(Patch_BIT_GetAttribute(hero, ATR_STRENGTH)); SB("   ");

    SB("Dex: "); SBi(Patch_BIT_GetRealAttribute(hero, ATR_DEXTERITY));
    SB(" "); SBi(Patch_BIT_GetAttribute(hero, ATR_DEXTERITY)); SB("   ");

    SB("Man: "); SBi(Patch_BIT_GetRealAttribute(hero, ATR_MANA_MAX));
    SB(" "); SBi(Patch_BIT_GetAttribute(hero, ATR_MANA_MAX)); SB("\n");

    SB("1H: "); SBi(Patch_BIT_GetRealFightTalentPercent(hero, NPC_TALENT_1H));
    SB("% "); SBi(Patch_BIT_GetHitChance(hero, NPC_TALENT_1H)); SB("%   ");

    SB("2H: "); SBi(Patch_BIT_GetRealFightTalentPercent(hero, NPC_TALENT_2H));
    SB("% "); SBi(Patch_BIT_GetHitChance(hero, NPC_TALENT_2H)); SB("%   ");

    SB("Bow: "); SBi(Patch_BIT_GetRealFightTalentPercent(hero, NPC_TALENT_BOW));
    SB("% "); SBi(Patch_BIT_GetHitChance(hero, NPC_TALENT_BOW)); SB("%   ");

    SB("Crossbow: "); SBi(Patch_BIT_GetRealFightTalentPercent(hero, NPC_TALENT_CROSSBOW));
    SB("% "); SBi(Patch_BIT_GetHitChance(hero, NPC_TALENT_CROSSBOW)); SB("%   ");

    var string ret; ret = SB_ToString();
    SB_Destroy();

    return ret;
};

func string Patch_BIT_SetRealCharacterValue(var string args)
{
    if (Hlp_StrCmp(args, "")) {
        return "Usage: (str|dex|mana|1h|2h|bow|xbow) <new_value>";
    };
    var string attrOrTalent; attrOrTalent = STR_Upper(STR_Split(args, " ", 0));
    var int newValue; newValue = STR_ToInt(STR_Split(args, " ", 1));
    var string attrOrTalentRepr;
    if (Hlp_StrCmp(attrOrTalent, "STR")) {
        hero.aivar[REAL_STRENGTH] = newValue;
        attrOrTalentRepr = "string";
    } else if (Hlp_StrCmp(attrOrTalent, "DEX")) {
        hero.aivar[REAL_DEXTERITY] = newValue;
        attrOrTalentRepr = "dexterity";
    } else if (Hlp_StrCmp(attrOrTalent, "MANA")) {
        hero.aivar[REAL_MANA_MAX] = newValue;
        attrOrTalentRepr = "max mana";
    } else if (Hlp_StrCmp(attrOrTalent, "1H")) {
        hero.aivar[REAL_TALENT_1H] = newValue;
        attrOrTalentRepr = "one-handed";
    } else if (Hlp_StrCmp(attrOrTalent, "2H")) {
        hero.aivar[REAL_TALENT_2H] = newValue;
        attrOrTalentRepr = "two-handed";
    } else if (Hlp_StrCmp(attrOrTalent, "BOW")) {
        hero.aivar[REAL_TALENT_BOW] = newValue;
        attrOrTalentRepr = "bow";
    } else if (Hlp_StrCmp(attrOrTalent, "XBOW")) {
        hero.aivar[REAL_TALENT_CROSSBOW] = newValue;
        attrOrTalentRepr = "crossbow";
    } else {
        return ConcatStrings("Unknown attribute or talent: ", attrOrTalent);
    };
    var int s; s = SB_New();
    SB("Set "); SB(attrOrTalentRepr); SB(" to "); SBi(newValue);
    var string ret; ret = SB_ToString();
    SB_Destroy();
    return ret;
};