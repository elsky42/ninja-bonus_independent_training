const string Patch_BIT_ID = "BonusIndependentTraining";

/// Init-function called by Ninja
func void Ninja_BonusIndependentTraining_Init() {
	// Initialize Ikarus
	MEM_InitAll();
	
    const int once = 1;
    if (once) {
        MEM_Info(ConcatStrings(ConcatStrings(Patch_BIT_ID, ": " ), "Applying Gothic.INI."));
        Patch_BIT_ApplyINI();
        MEM_Info(ConcatStrings(ConcatStrings(Patch_BIT_ID, ": " ), "Gothic.INI applied"));	
        once = 0;
    };

    HookDaedalusFuncS("B_TeachFightTalentPercent", "Patch_BIT_TeachFightTalentPercent_Wrapper");
    HookDaedalusFuncS("B_TeachAttributePoints", "Patch_BIT_TeachAttributePoints_Wrapper");

    MEM_Info(ConcatStrings(Patch_BIT_ID, " was initialized successfully."));
};