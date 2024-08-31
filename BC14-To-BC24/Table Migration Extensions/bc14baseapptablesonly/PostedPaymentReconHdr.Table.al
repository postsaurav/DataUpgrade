table 1295 "Posted Payment Recon. Hdr"
{
    Caption = 'Posted Payment Recon. Hdr';
    DataCaptionFields = "Bank Account No.", "Statement No.";

    fields
    {
        field(1; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            NotBlank = true;
            TableRelation = "Bank Account";
        }
        field(2; "Statement No."; Code[20])
        {
            Caption = 'Statement No.';
            NotBlank = true;
        }
        field(3; "Statement Ending Balance"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Statement Ending Balance';
        }
        field(4; "Statement Date"; Date)
        {
            Caption = 'Statement Date';
        }
        field(6; "Bank Statement"; BLOB)
        {
            Caption = 'Bank Statement';
        }
    }

    keys
    {
        key(Key1; "Bank Account No.", "Statement No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

