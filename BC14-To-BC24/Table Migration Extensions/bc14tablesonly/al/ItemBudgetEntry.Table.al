table 7134 "Item Budget Entry"
{
    Caption = 'Item Budget Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Analysis Area"; Option)
        {
            Caption = 'Analysis Area';
            NotBlank = true;
            OptionCaption = 'Sales,Purchase';
            OptionMembers = Sales,Purchase;
        }
        field(3; "Budget Name"; Code[10])
        {
            Caption = 'Budget Name';
            TableRelation = "Item Budget Name".Name WHERE ("Analysis Area" = FIELD ("Analysis Area"));
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
            ClosingDates = true;
        }
        field(5; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(6; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Customer,Vendor,Item';
            OptionMembers = " ",Customer,Vendor,Item;
        }
        field(7; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST (Customer)) Customer
            ELSE
            IF ("Source Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Source Type" = CONST (Item)) Item;
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(10; "Cost Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost Amount';
        }
        field(11; "Sales Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Sales Amount';
        }
        field(13; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(14; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(15; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(16; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(17; "Budget Dimension 1 Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Budget Dimension 1 Code';
        }
        field(18; "Budget Dimension 2 Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Budget Dimension 2 Code';
        }
        field(19; "Budget Dimension 3 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Budget Dimension 3 Code';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Analysis Area", "Budget Name", "Item No.", "Source Type", "Source No.", Date, "Location Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Budget Dimension 1 Code", "Budget Dimension 2 Code", "Budget Dimension 3 Code")
        {
            SumIndexFields = "Cost Amount", "Sales Amount", Quantity;
        }
        key(Key3; "Analysis Area", "Budget Name", "Source Type", "Source No.", "Item No.", Date, "Location Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Budget Dimension 1 Code", "Budget Dimension 2 Code", "Budget Dimension 3 Code")
        {
            SumIndexFields = "Cost Amount", "Sales Amount", Quantity;
        }
        key(Key4; "Analysis Area", "Budget Name", "Item No.", Date)
        {
        }
    }

    fieldgroups
    {
    }
}

