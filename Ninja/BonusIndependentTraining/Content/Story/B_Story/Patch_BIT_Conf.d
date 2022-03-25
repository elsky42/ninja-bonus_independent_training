const string PATCH_BIT_INI                       = "NINJA_BONUS-INDEPENDENT-TRAINING";
const string PATCH_BIT_INI_SHOWSTATSWHENTRAINING = "show_stats_when_training";

const int Patch_BIT_Show_stats_when_training = 0;

func string Patch_BIT_GothOpt(var string section, var string option, var string default) {
	if (!MEM_GothOptExists(section, option)) {
		MEM_SetGothOpt(section, option, default);
		return default;
	};
	var string opt; opt = MEM_GetGothOpt(section, option);
	return opt;
};

func int Patch_BIT_BoolStr_to_int(var string boolstr)
{
    if (STR_Compare(boolstr, "false") == STR_EQUAL) { return 0; }
    else                                            { return 1; };
};

func void Patch_BIT_ApplyINI() {
    var string ini_showStatsWhenTraining;

    ini_showStatsWhenTraining = Patch_BIT_GothOpt (PATCH_BIT_INI, PATCH_BIT_INI_SHOWSTATSWHENTRAINING, "false");

    Patch_BIT_Show_stats_when_training = Patch_BIT_BoolStr_to_int (ini_showStatsWhenTraining);
};
