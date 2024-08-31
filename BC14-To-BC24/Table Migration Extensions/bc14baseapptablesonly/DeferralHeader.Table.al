table 1701 "Deferral Header"
{
    Caption = 'Deferral Header';
    DataCaptionFields = "Schedule Description";

    fields
    {
        field(1; "Deferral Doc. Type"; Option)
        {
            Caption = 'Deferral Doc. Type';
            OptionCaption = 'Purchase,Sales,G/L';
            OptionMembers = Purchase,Sales,"G/L";
        }
        field(2; "Gen. Jnl. Template Name"; Code[10])
        {
            Caption = 'Gen. Jnl. Template Name';
        }
        field(3; "Gen. Jnl. Batch Name"; Code[10])
        {
            Caption = 'Gen. Jnl. Batch Name';
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
        field(20; "Schedule Line Total"; Decimal)
        {
            CalcFormula = Sum ("Deferral Line".Amount WHERE ("Deferral Doc. Type" = FIELD ("Deferral Doc. Type"),
                                                            "Gen. Jnl. Template Name" = FIELD ("Gen. Jnl. Template Name"),
                                                            "Gen. Jnl. Batch Name" = FIELD ("Gen. Jnl. Batch Name"),
                                                            "Document Type" = FIELD ("Document Type"),
                                                            "Document No." = FIELD ("Document No."),
                                                            "Line No." = FIELD ("Line No.")));
            Caption = 'Schedule Line Total';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Deferral Doc. Type", "Gen. Jnl. Template Name", "Gen. Jnl. Batch Name", "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

