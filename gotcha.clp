// ** Settings ************************************************************


SETTINGS :: Settings (VOID)
: ththSettings (apse, PSZ_PROFILENAME, L_PROFILEVERSION)
{
    swpMain.x = 98; swpMain.y = 66;

    // get main window data
    ULONG ul = sizeof (swpMain);
    PrfQueryProfileData (hini, "Window", "SWP", PVOID (&swpMain), &ul);
    ul = sizeof (usMain);
    PrfQueryProfileData (hini, "Window", "US", PVOID (&usMain), &ul);

    // get snapshot window data
    ul = sizeof (swp);
    PrfQueryProfileData (hini, "Snapshot", "SWP", PVOID (&swp), &ul);
    ul = sizeof (us);
    PrfQueryProfileData (hini, "Snapshot", "US", PVOID (&us), &ul);
}

// ** ~Settings ***********************************************************

SETTINGS :: ~Settings (VOID)
{
    PrfWriteProfileData (hini, "Snapshot", "SWP",
                         PVOID (&swp), sizeof (swp));
    PrfWriteProfileData (hini, "Snapshot", "US",
                         PVOID (&us), sizeof (us));

    PrfWriteProfileData (hini, "Window", "SWP",
                         PVOID (&swp), sizeof (swpMain));
    PrfWriteProfileData (hini, "Window", "US",
                         PVOID (&us), sizeof (usMain));

    this->ththSettings::~ththSettings ();
}
