table 1704 "Posted Deferral Header"
{
    Caption = 'Posted Deferral Header';

    fields
    {
        field(1; "Deferral Doc. Type"; Option)
        {
            Caption = 'Deferral Doc. Type';
            OptionCaption = 'Purchase,Sales,G/L';
            OptionMembers = Purchase,Sales,"G/L";
        }
        field(2; "Gen. Jnl. Document No."; Code[20])
        {
            Caption = 'Gen. Jnl. Document No.';
        }
        field(3; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = "G/L Account" WHERE (Blocked = CONST (false));
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
        field(15; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency.Code;
        }
        field(16; "Deferral Account"; Code[20])
        {
            Caption = 'Deferral Account';
            NotBlank = true;
            TableRelation = "G/L Account" WHERE ("Account Type" = CONST (Posting),
                                                 Blocked = CONST (false));
        }
        field(17; CustVendorNo; Code[20])
        {
            Caption = 'CustVendorNo';
        }
        field(18; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(19; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(Key1; "Deferral Doc. Type", "Gen. Jnl. Document No.", "Account No.", "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

