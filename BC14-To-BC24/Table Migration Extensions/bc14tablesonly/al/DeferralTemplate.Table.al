table 1700 "Deferral Template"
{
    Caption = 'Deferral Template';
    ReplicateData = false;

    fields
    {
        field(1; "Deferral Code"; Code[10])
        {
            Caption = 'Deferral Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Deferral Account"; Code[20])
        {
            Caption = 'Deferral Account';
            NotBlank = true;
            TableRelation = "G/L Account" WHERE ("Account Type" = CONST (Posting),
                                                 Blocked = CONST (false));
        }
        field(4; "Deferral %"; Decimal)
        {
            Caption = 'Deferral %';
            DecimalPlaces = 0 : 5;
            InitValue = 100;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5; "Calc. Method"; Option)
        {
            Caption = 'Calc. Method';
            OptionCaption = 'Straight-Line,Equal per Period,Days per Period,User-Defined';
            OptionMembers = "Straight-Line","Equal per Period","Days per Period","User-Defined";
        }
        field(6; "Start Date"; Option)
        {
            Caption = 'Start Date';
            OptionCaption = 'Posting Date,Beginning of Period,End of Period,Beginning of Next Period';
            OptionMembers = "Posting Date","Beginning of Period","End of Period","Beginning of Next Period";
        }
        field(7; "No. of Periods"; Integer)
        {
            BlankZero = true;
            Caption = 'No. of Periods';
            MinValue = 1;
        }
        field(8; "Period Description"; Text[100])
        {
            Caption = 'Period Description';
        }
    }

    keys
    {
        key(Key1; "Deferral Code")
        {
            Clustered = true;
        }
        key(Key2; "Deferral Account")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }
}

