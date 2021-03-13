msgbox, au "ok" vous devrez entrez les coordonees
FunctionPremierCalcul()
return

FunctionPremierCalcul()
{
    IniFile = C:\Users\%A_UserName%\AppData\Roaming\IniEnder.ini
    while(confirmation != 1)
    {
        confirmation = 0
        inputbox, XaA,, entrez le premier point de lancer de l'enderpearl X
        inputbox, ZaA,, entrez le premier point de lancer de l'enderpearl Z
        msgbox, 4,,  etes vous sur de vos nombres ? x%XaA% z%ZaA%
        ifmsgbox Yes
            confirmation = 1
        Else
            confirmation = 0
    }
    confirmation = 0
    while(confirmation != 1)
    {
        confirmation = 0
        inputbox, XaB,, entrez premier point de retombee de l'enderpearl en X
        inputbox, ZaB,, entrez premier point de retombee de l'enderpearl en Z
        msgbox, 4,,  etes vous sur de vos nombres ? x%XaB% z%ZaB%
        ifmsgbox Yes
            confirmation = 1
        Else
            confirmation = 0
    }
    FileAppend
    (
    point lancé 1 : :%XaA%
    point lancé 1 : :%ZaA%
    point retombée 1 :%XaB%
    point retombée 1 :%ZaB%
    ), %IniFiles%

        /*
            XaA est égal à la coordonée du premier lancé sur l'axe x en mathématique (X sur Minecraft)
            ZaA est égal à la coordonée du premier lancé sur l'axe y en mathématique (Z sur Minecraft)
            XaB est égal à la coordonée du la première retombée sur l'axe x en mathématique (X sur Minecraft)
            ZaB est égal à la coordonée du la première retombée sur l'axe y en mathématique (Z sur Minecraft)

            PenteA est égal à la pente (angle) entre les coordonnées du premier lancé et l'arrivée
            ConstandeDeDroiteA est égal à la ligne définissant le point de départ
            */
    PenteA := (ZaB-ZaA)/(XaB-XaA)
    ConstanteDroiteA := ZaA-(PenteA*XaA)
    FunctionDeuxiemeCalcul(PenteA, ConstanteDroiteA, IniFile)
}

FunctionDeuxiemeCalcul(PenteA, ConstanteDroiteA, IniFiles)
{
    confirmation = 0
    while(confirmation != 1)
    {
        confirmation = 0
        inputbox, XbA,, entrez le deuxième point de lancer de l'enderpearl X
        inputbox, ZbA,, entrez le deuxième point de lancer de l'enderpearl Z
        msgbox, 4,,  etes vous sur de vos nombres ? x%XbA% z%ZbA%
        ifmsgbox Yes
            confirmation = 1
        Else
            confirmation = 0
    }
    confirmation = 0
    while(confirmation != 1)
    {
        confirmation = 0
        inputbox, XbB,, entrez premier point de retombee de l'enderpearl en X
        inputbox, ZbB,, entrez premier point de retombee de l'enderpearl en Z
        msgbox, 4,,  etes vous sur de vos nombres ? x%XbB% z%ZbB%
        ifmsgbox Yes
            confirmation = 1
        Else
            confirmation = 0
    }
        /*
            XbA est égal à la coordonée du deuxième lancé sur l'axe x en mathématique (X sur Minecraft)
            ZbA est égal à la coordonée du deuxième lancé sur l'axe y en mathématique (Z sur Minecraft)
            XbB est égal à la coordonée du la deuxième retombée sur l'axe x en mathématique (X sur Minecraft)
            ZbB est égal à la coordonée du la deuxième retombée sur l'axe y en mathématique (Z sur Minecraft)

            PenteA est égal à la pente (angle) entre les coordonnées du premier lancé et l'arrivée
            ConstandeDeDroiteA est égal à la ligne définissant le point de départ
        */
    PenteB := (ZbB-ZbA)/(XbB-XbA)
    ConstanteDroiteB := ZbA-(PenteB*XbA)
        /*
            InterSectionX est égal au point yI en mathématique (X sur Minecraft)
            DeltaPente est égal **JE SAIS PAS COMMENT LE TRADUIRE <3**
            PointzI est égal à la position en x en mathémathique (Z sur minecraft) ((position en Z du stronghold))
            PointxI est égal à la position en y en mathémathique (X sur minecraft) ((position en x du stronghold))
            */
    InterSectionX := (ConstanteDroiteA-ConstanteDroiteB)
    DeltaPente := (PenteB-PenteA)
    PointxI := (InterSectionX/DeltaPente)
    PointzI := (PenteA*PointxI)+(ConstanteDroiteA)
    FileAppend
    (
    point lancé 2 :%XaA%
    point lancé 2 :%ZaA%
    point retombée 2 :%XaB%
    point retombée 2 :%ZaB%
    point final - X : %PointxI% Y : %PointzI%
    ),%IniFiles%
    msgbox, x%PointxI% y%PointzI%
}