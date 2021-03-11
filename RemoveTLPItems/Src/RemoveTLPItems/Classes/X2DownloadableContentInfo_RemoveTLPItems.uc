//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_RemoveTLPItems.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_RemoveTLPItems extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame() {}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState) {}

static event OnPostTemplatesCreated() { // Use OPTC to modify TLP Items

	RemoveTLPWeapons();

	RemoveTLPArmors();
	
}

static function RemoveTLPWeapons() {
	
	local X2ItemTemplateManager TemplateManager; // Create Item Manager to access Weapon Templates
	local array<name> WeaponTemplateNames;
	local name WeaponTemplateName;
	local X2WeaponTemplate WeaponTemplate;

	// Access Item Template Manager:
	TemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager(); 

	// Add Weapon Template Names to list:
	WeaponTemplateNames.AddItem('TLE_AssaultRifle_CV');
	WeaponTemplateNames.AddItem('TLE_Cannon_CV');
	WeaponTemplateNames.AddItem('TLE_Pistol_CV');
	WeaponTemplateNames.AddItem('TLE_SniperRifle_CV');
	WeaponTemplateNames.AddItem('TLE_Shotgun_CV');
	WeaponTemplateNames.AddItem('TLE_Sword_CV');
	WeaponTemplateNames.AddItem('TLE_AssaultRifle_MG');
	WeaponTemplateNames.AddItem('TLE_Cannon_MG');
	WeaponTemplateNames.AddItem('TLE_Pistol_MG');
	WeaponTemplateNames.AddItem('TLE_SniperRifle_MG');
	WeaponTemplateNames.AddItem('TLE_Shotgun_MG');
	WeaponTemplateNames.AddItem('TLE_Sword_MG');
	WeaponTemplateNames.AddItem('TLE_AssaultRifle_BM');
	WeaponTemplateNames.AddItem('TLE_Cannon_BM');
	WeaponTemplateNames.AddItem('TLE_Pistol_BM');
	WeaponTemplateNames.AddItem('TLE_SniperRifle_BM');
	WeaponTemplateNames.AddItem('TLE_Shotgun_BM');
	WeaponTemplateNames.AddItem('TLE_Sword_BM');
	
	// Iterate through list:
	foreach WeaponTemplateNames(WeaponTemplateName) {
		
		// Modify Weapon Template:
		WeaponTemplate = X2WeaponTemplate(TemplateManager.FindItemTemplate(WeaponTemplateName));
		WeaponTemplate.StartingItem = false;
		WeaponTemplate.CreatorTemplateName = ''; // Set Schematic to an empty name
		WeaponTemplate.BaseItem = ''; // Set Item to empty name

	}
}

static function RemoveTLPArmors() {

	local X2ItemTemplateManager TemplateManager; // Create Item Manager to access Armor Templates
	local array<name> ArmorTemplateNames;
	local name ArmorTemplateName;
	local X2ArmorTemplate ArmorTemplate;

	// Access Item Template Manager:
	TemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager(); 

	// Add Armor Template Names to list:
	ArmorTemplateNames.AddItem('RangerKevlarArmor');
	ArmorTemplateNames.AddItem('SpecialistKevlarArmor');
	ArmorTemplateNames.AddItem('GrenadierKevlarArmor');
	ArmorTemplateNames.AddItem('SharpshooterKevlarArmor');
	ArmorTemplateNames.AddItem('PsiOperativeKevlarArmor');
	ArmorTemplateNames.AddItem('RangerPlatedArmor');
	ArmorTemplateNames.AddItem('SpecialistPlatedArmor');
	ArmorTemplateNames.AddItem('GrenadierPlatedArmor');
	ArmorTemplateNames.AddItem('SharpshooterPlatedArmor');
	ArmorTemplateNames.AddItem('PsiOperativePlatedArmor');
	ArmorTemplateNames.AddItem('RangerPoweredArmor');
	ArmorTemplateNames.AddItem('SpecialistPoweredArmor');
	ArmorTemplateNames.AddItem('GrenadierPoweredArmor');
	ArmorTemplateNames.AddItem('SharpshooterPoweredArmor');
	ArmorTemplateNames.AddItem('PsiOperativePoweredArmor');
	
	// Iterate through list:
	foreach ArmorTemplateNames(ArmorTemplateName) {
		
		// Modify Armor Template:
		ArmorTemplate = X2ArmorTemplate(TemplateManager.FindItemTemplate(ArmorTemplateName));
		ArmorTemplate.StartingItem = false;
		ArmorTemplate.CreatorTemplateName = ''; // Set Schematic to an empty name
		ArmorTemplate.BaseItem = ''; // Set Item to empty name

	}
}