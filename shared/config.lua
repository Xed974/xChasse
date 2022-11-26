xChasse = xChasse or {}

xChasse = {
    MarkerType = 21, -- https://docs.fivem.net/docs/game-references/markers/
    MarkerColorR = 0, -- https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 0, -- https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 0, -- https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 200, 
    MarkerSizeLargeur = 0.3,
    MarkerSizeEpaisseur = 0.3,
    MarkerSizeHauteur = 0.3,
    MarkerSaute = false, 
    MarkerTourne = false,
    Blips = {
        Pos = vector3(-1491.62, 4981.42, 63.29),
        Id = 160,
        Display = 4,
        Scale = 0.7,
        Colour = 0,
        Title = "Activité | Chasse"
    },
    Blips_Vente = {
        Pos = vector3(961.57, -2111.53, 31.94),
        Id = 605,
        Display = 4,
        Scale = 0.7,
        Colour = 0,
        Title = "Activité | Chasse - Vente"
    },
    Position = {
        Chasse = {vector3(-1491.62, 4981.42, 63.29)},
        Animal = {
            [1] = vector3(-1570.55, 4848.40, 61.34),
            [2] = vector3(-1630.63, 4753.22, 52.46),
        },
        Vente = {vector3(961.57, -2111.53, 31.94)}
    },
    ItemChasse = "musket", -- Item utilisé pour tué les animaux
    ItemForDepecer = "knife", -- Item couteau utilisé pour dépecer les animaux mort
    ItemViande = "viande_cru", -- Item reçu après avoir dépecer un animal mort
    PriceViande = 9, -- Prix de la viande à la revente (prix unitaire)
    Animal = {
        [1] = "a_c_boar",
        [2] = "a_c_deer",
        [3] = "a_c_coyote"
    }
}

--- Xed#1188 | https://discord.gg/HvfAsbgVpM