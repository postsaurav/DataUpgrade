table 5127 "Deferral Header Archive"
{
    Caption = 'Deferral Header Archive';

    fields
    {
        field(1; "Deferral Doc. Type"; Option)
        {
            Caption = 'Deferral Doc. Type';
            OptionCaption = 'Purchase,Sales,G/L';
            OptionMembers = Purchase,Sales,"G/L";
        }
        field(4; "Document Type"; Integer)
        {
            Caption = 'Document Type';
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(7; "Deferral Code"; Code[10])
        {
            Caption = 'Deferral Code';
            NotBlank = true;
        }
        field(8; "Amount to Defer"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount to Defer';
        }
        field(9; "Amount to Defer (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount to Defer (LCY)';
        }
        field(10; "Calc. Method"; Option)
        {
            Caption = 'Calc. Method';
            OptionCaption = 'Straight-Line,Equal per Period,Days per Period,User-Defined';
            OptionMembers = "Straight-Line","Equal per Period","Days per Period","User-Defined";
        }
        field(11; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(12; "No. of Periods"; Integer)
        {
            BlankZero = true;
            Caption = 'No. of Periods';
            NotBlank = true;
        }
        field(13; "Schedule Description"; Text[100])
        {
            Caption = 'Schedule Description';
        }
        field(14; "Initial Amount to Defer"; Decimal)
        {
            Caption = 'Initial Amount to Defer';
        }
        field(15; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency.Code;
        }
        field(5047; "Version No."; Integer)
        {
            Caption = 'Version No.';
        }
        field(5048; "Doc. No. Occurrence"; Integer)
        {
            Caption = 'Doc. No. Occurrence';
        }
    }

    keys
    {
        key(Key1; "Deferral Doc. Type", "Document Type", "Document No.", "Doc. No. Occurrence", "Version No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

