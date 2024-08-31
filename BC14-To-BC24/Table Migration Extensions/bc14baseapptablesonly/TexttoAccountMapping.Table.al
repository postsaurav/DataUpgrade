table 1251 "Text-to-Account Mapping"
{
    Caption = 'Text-to-Account Mapping';
    DataCaptionFields = "Mapping Text";

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(2; "Mapping Text"; Text[250])
        {
            Caption = 'Mapping Text';
            NotBlank = true;
        }
        field(3; "Debit Acc. No."; Code[20])
        {
            Caption = 'Debit Acc. No.';
            TableRelation = "G/L Account" WHERE ("Account Type" = CONST (Posting),
                                                 Blocked = CONST (false),
                                                 "Direct Posting" = CONST (true));
        }
        field(4; "Credit Acc. No."; Code[20])
        {
            Caption = 'Credit Acc. No.';
            TableRelation = "G/L Account" WHERE ("Account Type" = CONST (Posting),
                                                 Blocked = CONST (false),
                                                 "Direct Posting" = CONST (true));
        }
        field(5; "Bal. Source Type"; Option)
        {
            Caption = 'Bal. Source Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account";
        }
        field(6; "Bal. Source No."; Code[20])
        {
            Caption = 'Bal. Source No.';
            TableRelation = IF ("Bal. Source Type" = CONST ("G/L Account")) "G/L Account" WHERE ("Account Type" = CONST (Posting),
                                                                                              Blocked = CONST (false))
            ELSE
            IF ("Bal. Source Type" = CONST (Customer)) Customer
            ELSE
            IF ("Bal. Source Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Bal. Source Type" = CONST ("Bank Account")) "Bank Account";
        }
        field(7; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Mapping Text", "Vendor No.")
        {
            Enabled = false;
        }
    }

    fieldgroups
    {
    }
}

