table 1230 "SEPA Direct Debit Mandate"
{
    Caption = 'SEPA Direct Debit Mandate';
    DataCaptionFields = ID, "Customer Bank Account Code";

    fields
    {
        field(1; ID; Code[35])
        {
            Caption = 'ID';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            NotBlank = true;
            TableRelation = Customer;
        }
        field(3; "Customer Bank Account Code"; Code[20])
        {
            Caption = 'Customer Bank Account Code';
            NotBlank = true;
            TableRelation = "Customer Bank Account".Code WHERE ("Customer No." = FIELD ("Customer No."));
        }
        field(4; "Valid From"; Date)
        {
            Caption = 'Valid From';
        }
        field(5; "Valid To"; Date)
        {
            Caption = 'Valid To';
        }
        field(6; "Date of Signature"; Date)
        {
            Caption = 'Date of Signature';
            NotBlank = true;
        }
        field(7; "Type of Payment"; Option)
        {
            Caption = 'Type of Payment';
            OptionCaption = 'OneOff,Recurrent';
            OptionMembers = OneOff,Recurrent;
        }
        field(8; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(9; "Expected Number of Debits"; Integer)
        {
            Caption = 'Expected Number of Debits';
            InitValue = 1;
            MinValue = 1;
        }
        field(10; "Debit Counter"; Integer)
        {
            Caption = 'Debit Counter';
            Editable = false;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(12; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; "Customer No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; ID, "Customer Bank Account Code", "Valid From", "Valid To", "Type of Payment")
        {
        }
    }
}

