table 1878 "VAT Assisted Setup Templates"
{
    Caption = 'VAT Assisted Setup Templates';

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Default VAT Bus. Posting Grp"; Code[20])
        {
            Caption = 'Default VAT Bus. Posting Grp';
            TableRelation = "VAT Assisted Setup Bus. Grp.".Code WHERE (Selected = CONST (true),
                                                                       Default = CONST (false));
        }
        field(4; "Default VAT Prod. Posting Grp"; Code[20])
        {
            Caption = 'Default VAT Prod. Posting Grp';
            TableRelation = "VAT Setup Posting Groups"."VAT Prod. Posting Group" WHERE (Selected = CONST (true),
                                                                                        Default = CONST (false));
        }
        field(5; "Table ID"; Integer)
        {
            Caption = 'Table ID';
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

