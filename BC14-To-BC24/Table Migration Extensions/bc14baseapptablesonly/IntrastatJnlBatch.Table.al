table 262 "Intrastat Jnl. Batch"
{
    Caption = 'Intrastat Jnl. Batch';
    DataCaptionFields = Name, Description;

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            NotBlank = true;
            TableRelation = "Intrastat Jnl. Template";
        }
        field(2; Name; Code[10])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(13; Reported; Boolean)
        {
            Caption = 'Reported';
        }
        field(14; "Statistics Period"; Code[10])
        {
            Caption = 'Statistics Period';
        }
        field(15; "Amounts in Add. Currency"; Boolean)
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Amounts in Add. Currency';
        }
        field(16; "Currency Identifier"; Code[10])
        {
            AccessByPermission = TableData Currency = R;
            Caption = 'Currency Identifier';
        }
        field(10500; "Arrivals Reported"; Boolean)
        {
            Caption = 'Arrivals Reported';
        }
        field(10501; "Dispatches Reported"; Boolean)
        {
            Caption = 'Dispatches Reported';
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

