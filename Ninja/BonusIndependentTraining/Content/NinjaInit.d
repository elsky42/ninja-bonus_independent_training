const string Patch_BIT_ID = "BonusIndependentTraining";

/// Init-function called by Ninja
func void Ninja_BonusIndependentTraining_Init() {
	// Initialize Ikarus
	MEM_InitAll();
    LeGo_MergeFlags(LeGo_ConsoleCommands);
	
    const int once = 1;
    if (once) {
        MEM_Info(ConcatStrings(ConcatStrings(Patch_BIT_ID, ": " ), "Applying Gothic.INI."));
        Patch_BIT_ApplyINI();
        MEM_Info(ConcatStrings(ConcatStrings(Patch_BIT_ID, ": " ), "Gothic.INI applied"));
        if (PATCH_BIT_show_real_stats_in_char_menu) {
            HookEngineF(4712608, 7, Patch_BIT_Update_Character_Menu);
        };

        CC_Register(Patch_BIT_GetCharacterValues, "BIT getcharactervalues", "Return trained and effective attributes and fight talents");
        CC_Register(Patch_BIT_SetRealCharacterValue, "BIT setrealcharactervalue ", "Set the hero attribute or talent to the given value");

        once = 0;
    };

    HookDaedalusFuncS("B_TeachFightTalentPercent", "Patch_BIT_TeachFightTalentPercent");
    HookDaedalusFuncS("B_TeachAttributePoints", "Patch_BIT_TeachAttributePoints");
    HookDaedalusFuncS("B_RaiseFightTalent", "Patch_BIT_B_RaiseFightTalent");
    HookDaedalusFuncS("B_RaiseAttribute", "Patch_BIT_B_RaiseAttribute");
    HookDaedalusFuncS("B_BlessAttribute", "Patch_BIT_B_BlessAttribute");

    MEM_Info(ConcatStrings(Patch_BIT_ID, " was initialized successfully."));
};