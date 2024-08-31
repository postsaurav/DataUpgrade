table 5615 "FA Allocation"
{
    Caption = 'FA Allocation';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = "FA Posting Group";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = "G/L Account";
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(7; "Allocation %"; Decimal)
        {
            Caption = 'Allocation %';
            DecimalPlaces = 1 : 1;
            MaxValue = 100;
            MinValue = 0;
        }
        field(8; "Allocation Type"; Option)
        {
            Caption = 'Allocation Type';
            OptionCaption = 'Acquisition,Depreciation,Write-Down,Appreciation,Custom 1,Custom 2,Disposal,Maintenance,Gain,Loss,Book Value (Gain),Book Value (Loss)';
            OptionMembers = Acquisition,Depreciation,"Write-Down",Appreciation,"Custom 1","Custom 2",Disposal,Maintenance,Gain,Loss,"Book Value (Gain)","Book Value (Loss)";
        }
        field(9; "Account Name"; Text[100])
        {
            CalcFormula = Lookup ("G/L Account".Name WHERE ("No." = FIELD ("Account No.")));
            Caption = 'Account Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "Code", "Allocation Type", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Allocation Type", "Code")
        {
            SumIndexFields = "Allocation %";
        }
    }

    fieldgroups
    {
    }
}

