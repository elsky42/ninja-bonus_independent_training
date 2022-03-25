/// Init-function called by Ninja
func void Ninja_BonusIndependentTraining_Init() {
	// Initialize Ikarus
	MEM_InitAll();
	
    HookDaedalusFuncS("B_TeachFightTalentPercent", "Patch_BIT_TeachFightTalentPercent_Wrapper");
    HookDaedalusFuncS("B_TeachAttributePoints", "Patch_BIT_TeachAttributePoints_Wrapper");
};