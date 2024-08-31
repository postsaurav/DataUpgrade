table 1231 "Positive Pay Entry"
{
    Caption = 'Positive Pay Entry';

    fields
    {
        field(1; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            NotBlank = false;
            TableRelation = "Bank Account"."No.";
        }
        field(2; "Upload Date-Time"; DateTime)
        {
            Caption = 'Upload Date-Time';
            Editable = false;
        }
        field(5; "Last Upload Date"; Date)
        {
            Caption = 'Last Upload Date';
        }
        field(6; "Last Upload Time"; Time)
        {
            Caption = 'Last Upload Time';
        }
        field(7; "Number of Uploads"; Integer)
        {
            Caption = 'Number of Uploads';
        }
        field(8; "Number of Checks"; Integer)
        {
            Caption = 'Number of Checks';
        }
        field(9; "Number of Voids"; Integer)
        {
            Caption = 'Number of Voids';
        }
        field(10; "Check Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Check Amount';
        }
        field(11; "Void Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Void Amount';
        }
        field(12; "Confirmation Number"; Text[20])
        {
            Caption = 'Confirmation Number';
        }
        field(13; "Exported File"; BLOB)
        {
            Caption = 'Exported File';
        }
    }

    keys
    {
        key(Key1; "Bank Account No.", "Upload Date-Time")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

