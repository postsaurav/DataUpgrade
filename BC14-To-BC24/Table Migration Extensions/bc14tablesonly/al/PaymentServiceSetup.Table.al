table 1060 "Payment Service Setup"
{
    Caption = 'Payment Service Setup';
    Permissions = TableData "Sales Invoice Header" = rimd,
                  TableData "Payment Reporting Argument" = rimd;

    fields
    {
        field(1; "No."; Text[250])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            NotBlank = true;
        }
        field(4; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(5; "Always Include on Documents"; Boolean)
        {
            Caption = 'Always Include on Documents';
        }
        field(6; "Setup Record ID"; RecordID)
        {
            Caption = 'Setup Record ID';
            DataClassification = SystemMetadata;
        }
        field(7; "Setup Page ID"; Integer)
        {
            Caption = 'Setup Page ID';
        }
        field(8; "Terms of Service"; Text[250])
        {
            Caption = 'Terms of Service';
            Editable = false;
            ExtendedDatatype = URL;
        }
        field(100; Available; Boolean)
        {
            Caption = 'Available';
        }
        field(101; "Management Codeunit ID"; Integer)
        {
            Caption = 'Management Codeunit ID';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

