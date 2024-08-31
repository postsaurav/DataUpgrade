table 6084 "Service Line Price Adjmt."
{
    Caption = 'Service Line Price Adjmt.';

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order';
            OptionMembers = Quote,"Order";
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; "Service Line No."; Integer)
        {
            Caption = 'Service Line No.';
        }
        field(4; "Service Item Line No."; Integer)
        {
            Caption = 'Service Item Line No.';
        }
        field(5; "Service Item No."; Code[20])
        {
            Caption = 'Service Item No.';
            TableRelation = "Service Item";
        }
        field(6; "Serv. Price Adjmt. Gr. Code"; Code[10])
        {
            Caption = 'Serv. Price Adjmt. Gr. Code';
            TableRelation = "Service Price Adjustment Group";
        }
        field(7; Type; Option)
        {
            Caption = 'Type';
            Editable = false;
            OptionCaption = ' ,Item,Resource,Cost,G/L Account';
            OptionMembers = " ",Item,Resource,Cost,"G/L Account";
        }
        field(8; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
            TableRelation = IF (Type = CONST (Item)) Item
            ELSE
            IF (Type = CONST (Resource)) Resource
            ELSE
            IF (Type = CONST (Cost)) "Service Cost";
        }
        field(9; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(10; Quantity; Decimal)
        {
            Caption = 'Quantity';
            Editable = false;
        }
        field(14; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
            Editable = false;
        }
        field(15; "New Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'New Amount';
        }
        field(16; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            Editable = false;
        }
        field(17; "New Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Unit Price';
        }
        field(18; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            Editable = false;
        }
        field(19; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            Editable = false;
        }
        field(20; "Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Discount Amount';
            Editable = false;
        }
        field(21; "Amount incl. VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount incl. VAT';
            Editable = false;
        }
        field(22; "New Amount incl. VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'New Amount incl. VAT';
        }
        field(24; Weight; Decimal)
        {
            Caption = 'Weight';
            Editable = false;
        }
        field(25; "Adjustment Type"; Option)
        {
            Caption = 'Adjustment Type';
            Editable = false;
            OptionCaption = 'Fixed,Maximum,Minimum';
            OptionMembers = "Fixed",Maximum,Minimum;
        }
        field(26; "Service Price Group Code"; Code[10])
        {
            Caption = 'Service Price Group Code';
            Editable = false;
            TableRelation = "Service Price Group";
        }
        field(27; "Manually Adjusted"; Boolean)
        {
            Caption = 'Manually Adjusted';
            Editable = false;
        }
        field(28; "Vat %"; Decimal)
        {
            Caption = 'Vat %';
            Editable = false;
        }
        field(29; "New Amount Excl. VAT"; Decimal)
        {
            Caption = 'New Amount Excl. VAT';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Service Item Line No.", "Service Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

