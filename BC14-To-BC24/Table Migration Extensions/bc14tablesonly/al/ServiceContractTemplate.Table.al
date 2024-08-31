table 5968 "Service Contract Template"
{
    Caption = 'Service Contract Template';
    DataCaptionFields = "No.", Description;
    ReplicateData = false;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Invoice Period"; Option)
        {
            Caption = 'Invoice Period';
            OptionCaption = 'Month,Two Months,Quarter,Half Year,Year,None';
            OptionMembers = Month,"Two Months",Quarter,"Half Year",Year,"None";
        }
        field(4; "Max. Labor Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Max. Labor Unit Price';
        }
        field(5; "Combine Invoices"; Boolean)
        {
            Caption = 'Combine Invoices';
        }
        field(6; Prepaid; Boolean)
        {
            Caption = 'Prepaid';
        }
        field(7; "Service Zone Code"; Code[10])
        {
            Caption = 'Service Zone Code';
            TableRelation = "Service Zone";
        }
        field(8; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(9; "Default Response Time (Hours)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Default Response Time (Hours)';
            DecimalPlaces = 0 : 5;
        }
        field(10; "Contract Lines on Invoice"; Boolean)
        {
            Caption = 'Contract Lines on Invoice';
        }
        field(11; "Default Service Period"; DateFormula)
        {
            Caption = 'Default Service Period';
        }
        field(14; "Invoice after Service"; Boolean)
        {
            Caption = 'Invoice after Service';
        }
        field(15; "Allow Unbalanced Amounts"; Boolean)
        {
            Caption = 'Allow Unbalanced Amounts';
        }
        field(16; "Contract Group Code"; Code[10])
        {
            Caption = 'Contract Group Code';
            TableRelation = "Contract Group";
        }
        field(17; "Service Order Type"; Code[10])
        {
            Caption = 'Service Order Type';
            TableRelation = "Service Order Type";
        }
        field(18; "Automatic Credit Memos"; Boolean)
        {
            Caption = 'Automatic Credit Memos';
        }
        field(20; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(21; "Price Update Period"; DateFormula)
        {
            Caption = 'Price Update Period';
        }
        field(22; "Price Inv. Increase Code"; Code[20])
        {
            Caption = 'Price Inv. Increase Code';
            TableRelation = "Standard Text";
        }
        field(23; "Serv. Contract Acc. Gr. Code"; Code[10])
        {
            Caption = 'Serv. Contract Acc. Gr. Code';
            TableRelation = "Service Contract Account Group".Code;
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

