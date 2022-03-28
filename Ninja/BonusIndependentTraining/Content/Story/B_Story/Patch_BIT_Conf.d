const string PATCH_BIT_INI                        = "NINJA_BONUS-INDEPENDENT-TRAINING";
const string PATCH_BIT_INI_SHOWSTATSWHENTRAINING  = "show_stats_when_training";
const string PATCH_BIT_INIT_TRAINERMAXONEFFECTIVE = "trainer_max_against_effective";

const int Patch_BIT_Show_stats_when_training = FALSE;
const int Patch_BIT_trainer_max_on_effective = FALSE;

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
    if (STR_Compare(boolstr, "false") == STR_EQUAL) { return FALSE; }
    else                                            { return TRUE; };
};

func void Patch_BIT_ApplyINI() {
    var string ini_showStatsWhenTraining;
	var string ini_trainerMaxOnEffective;

    ini_showStatsWhenTraining = Patch_BIT_GothOpt (PATCH_BIT_INI, PATCH_BIT_INI_SHOWSTATSWHENTRAINING, "false");
	ini_trainerMaxOnEffective = Patch_BIT_GothOpt (PATCH_BIT_INI, PATCH_BIT_INIT_TRAINERMAXONEFFECTIVE, "false");

    Patch_BIT_Show_stats_when_training = Patch_BIT_BoolStr_to_int (ini_showStatsWhenTraining);
	Patch_BIT_trainer_max_on_effective = Patch_BIT_BoolStr_to_int (ini_trainerMaxOnEffective);
};
