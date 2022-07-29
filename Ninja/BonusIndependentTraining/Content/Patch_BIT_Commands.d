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
