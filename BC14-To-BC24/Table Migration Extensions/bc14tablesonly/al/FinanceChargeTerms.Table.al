table 5 "Finance Charge Terms"
{
    Caption = 'Finance Charge Terms';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Interest Rate"; Decimal)
        {
            Caption = 'Interest Rate';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(3; "Minimum Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Minimum Amount (LCY)';
            MinValue = 0;
        }
        field(5; "Additional Fee (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Additional Fee (LCY)';
            MinValue = 0;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Interest Calculation Method"; Option)
        {
            Caption = 'Interest Calculation Method';
            OptionCaption = 'Average Daily Balance,Balance Due';
            OptionMembers = "Average Daily Balance","Balance Due";
        }
        field(9; "Interest Period (Days)"; Integer)
        {
            Caption = 'Interest Period (Days)';
        }
        field(10; "Grace Period"; DateFormula)
        {
            Caption = 'Grace Period';
        }
        field(11; "Due Date Calculation"; DateFormula)
        {
            Caption = 'Due Date Calculation';
        }
        field(12; "Interest Calculation"; Option)
        {
            Caption = 'Interest Calculation';
            OptionCaption = 'Open Entries,Closed Entries,All Entries';
            OptionMembers = "Open Entries","Closed Entries","All Entries";
        }
        field(13; "Post Interest"; Boolean)
        {
            Caption = 'Post Interest';
            InitValue = true;
        }
        field(14; "Post Additional Fee"; Boolean)
        {
            Caption = 'Post Additional Fee';
            InitValue = true;
        }
        field(15; "Line Description"; Text[100])
        {
            Caption = 'Line Description';
        }
        field(16; "Add. Line Fee in Interest"; Boolean)
        {
            Caption = 'Add. Line Fee in Interest';
        }
        field(30; "Detailed Lines Description"; Text[100])
        {
            Caption = 'Detailed Lines Description';
        }
        field(10555; "Multiple Lines Description"; Text[50])
        {
            Caption = 'Multiple Lines Description';
            ObsoleteReason = 'Merged to W1';
            ObsoleteState = Removed;
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
        fieldgroup(DropDown; "Code", Description, "Interest Rate")
        {
        }
    }
}

