table 293 "Reminder Level"
{
    Caption = 'Reminder Level';
    DataCaptionFields = "Reminder Terms Code", "No.";

    fields
    {
        field(1; "Reminder Terms Code"; Code[10])
        {
            Caption = 'Reminder Terms Code';
            NotBlank = true;
            TableRelation = "Reminder Terms";
        }
        field(2; "No."; Integer)
        {
            Caption = 'No.';
            MinValue = 1;
            NotBlank = true;
        }
        field(3; "Grace Period"; DateFormula)
        {
            Caption = 'Grace Period';
        }
        field(4; "Additional Fee (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Additional Fee (LCY)';
            MinValue = 0;
        }
        field(5; "Calculate Interest"; Boolean)
        {
            Caption = 'Calculate Interest';
        }
        field(6; "Due Date Calculation"; DateFormula)
        {
            Caption = 'Due Date Calculation';
        }
        field(7; "Add. Fee per Line Amount (LCY)"; Decimal)
        {
            Caption = 'Add. Fee per Line Amount (LCY)';
            MinValue = 0;
        }
        field(8; "Add. Fee per Line Description"; Text[100])
        {
            Caption = 'Add. Fee per Line Description';
        }
        field(9; "Add. Fee Calculation Type"; Option)
        {
            Caption = 'Add. Fee Calculation Type';
            OptionCaption = 'Fixed,Single Dynamic,Accumulated Dynamic';
            OptionMembers = "Fixed","Single Dynamic","Accumulated Dynamic";
        }
    }

    keys
    {
        key(Key1; "Reminder Terms Code", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

