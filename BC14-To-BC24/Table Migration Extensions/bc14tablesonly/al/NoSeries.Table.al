table 308 "No. Series"
{
    Caption = 'No. Series';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Default Nos."; Boolean)
        {
            Caption = 'Default Nos.';
        }
        field(4; "Manual Nos."; Boolean)
        {
            Caption = 'Manual Nos.';
        }
        field(5; "Date Order"; Boolean)
        {
            Caption = 'Date Order';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

