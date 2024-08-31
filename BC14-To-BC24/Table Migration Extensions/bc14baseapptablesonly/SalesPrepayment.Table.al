table 459 "Sales Prepayment %"
{
    Caption = 'Sales Prepayment %';

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Sales Type"; Option)
        {
            Caption = 'Sales Type';
            OptionCaption = 'Customer,Customer Price Group,All Customers';
            OptionMembers = Customer,"Customer Price Group","All Customers";
        }
        field(3; "Sales Code"; Code[20])
        {
            Caption = 'Sales Code';
            TableRelation = IF ("Sales Type" = CONST (Customer)) Customer
            ELSE
            IF ("Sales Type" = CONST ("Customer Price Group")) "Customer Price Group";
        }
        field(4; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(5; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(6; "Prepayment %"; Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Item No.", "Sales Type", "Sales Code", "Starting Date")
        {
            Clustered = true;
        }
        key(Key2; "Sales Type", "Sales Code")
        {
        }
    }

    fieldgroups
    {
    }
}

