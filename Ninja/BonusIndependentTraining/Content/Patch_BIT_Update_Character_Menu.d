
func void Patch_BIT_Update_Menu_Item(var string name, var string val)
{
    var  int itPtr ; itPtr = MEM_GetMenuItemByString(name);

    if  (!itPtr)  {
        MEM_Error(ConcatStrings("Update_Menu_Item: Invalid Menu Item: ", name));
        return;
    };
    
    //void __thiscall zCMenuItem::SetText(val = val, line = 0, drawNow = true)

    const int SetText = 5114800;

    CALL_IntParam(true);
    CALL_IntParam(0);
    CALL_zStringPtrParam(val);
    CALL__thiscall(itPtr, SetText);
};

func int Patch_BIT_Min(var int x, var int y)
{
    if (x > y) {
        return y;
    };
    return x;
};

func void Patch_BIT_Update_Attribute(var string menuItem, var int attrib)
{
    var string s; s = IntToString(Patch_BIT_GetAttribute(hero, attrib));
    var int padding_length; padding_length = 4 - Patch_BIT_Min(3, STR_Len(s));
    var string padding;
    if (padding_length == 1) {
        padding = " ";
    } else if (padding_length == 2) {
        padding = "  ";
    } else {
        padding = "   ";
    };

    s = ConcatStrings(padding, s);
    s = ConcatStrings(IntToString(Patch_BIT_GetRealAttribute(hero, attrib)), s);
    Patch_BIT_Update_Menu_Item(menuItem, s);
};

func void Patch_BIT_Update_Fight_Talent(var string menuItem, var int talent)
{
    var string s;
    s = ConcatStrings(IntToString(Patch_BIT_GetRealFightTalentPercent(hero, talent)), "%");
    s = ConcatStrings(s, "/");
    s = ConcatStrings(s, IntToString(Patch_BIT_GetHitChance(hero, talent)));
    s = ConcatStrings(s, "%");
    Patch_BIT_Update_Menu_Item(menuItem, s);
};

func void Patch_BIT_Update_Character_Menu()  {
    Patch_BIT_Update_Attribute("MENU_ITEM_ATTRIBUTE_1", ATR_STRENGTH);
    Patch_BIT_Update_Attribute("MENU_ITEM_ATTRIBUTE_2", ATR_DEXTERITY);
    Patch_BIT_Update_Attribute("MENU_ITEM_ATTRIBUTE_3", ATR_MANA_MAX);
    Patch_BIT_Update_Fight_Talent("MENU_ITEM_TALENT_1", NPC_TALENT_1H);
    Patch_BIT_Update_Fight_Talent("MENU_ITEM_TALENT_2", NPC_TALENT_2H);
    Patch_BIT_Update_Fight_Talent("MENU_ITEM_TALENT_3", NPC_TALENT_BOW);
    Patch_BIT_Update_Fight_Talent("MENU_ITEM_TALENT_4", NPC_TALENT_CROSSBOW);
};
