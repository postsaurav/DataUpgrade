table 5305 "Outlook Synch. User Setup"
{
    Caption = 'Outlook Synch. User Setup';
    PasteIsValid = false;
    ReplicateData = false;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2; "Synch. Entity Code"; Code[10])
        {
            Caption = 'Synch. Entity Code';
            NotBlank = true;
            TableRelation = "Outlook Synch. Entity".Code;
        }
        field(3; Description; Text[80])
        {
            CalcFormula = Lookup ("Outlook Synch. Entity".Description WHERE (Code = FIELD ("Synch. Entity Code")));
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; Condition; Text[250])
        {
            Caption = 'Condition';
            Editable = false;
        }
        field(5; "Synch. Direction"; Option)
        {
            Caption = 'Synch. Direction';
            OptionCaption = 'Bidirectional,Microsoft Dynamics NAV to Outlook,Outlook to Microsoft Dynamics NAV';
            OptionMembers = Bidirectional,"Microsoft Dynamics NAV to Outlook","Outlook to Microsoft Dynamics NAV";
        }
        field(6; "Last Synch. Time"; DateTime)
        {
            Caption = 'Last Synch. Time';
        }
        field(7; "Record GUID"; Guid)
        {
            Caption = 'Record GUID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(8; "No. of Elements"; Integer)
        {
            CalcFormula = Count ("Outlook Synch. Setup Detail" WHERE ("User ID" = FIELD ("User ID"),
                                                                     "Synch. Entity Code" = FIELD ("Synch. Entity Code"),
                                                                     "Outlook Collection" = FILTER (<> '')));
            Caption = 'No. of Elements';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "User ID", "Synch. Entity Code")
        {
            Clustered = true;
        }
        key(Key2; "Record GUID")
        {
        }
    }

    fieldgroups
    {
    }
}

