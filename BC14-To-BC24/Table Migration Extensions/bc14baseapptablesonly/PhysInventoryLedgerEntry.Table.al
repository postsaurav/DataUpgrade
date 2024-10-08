table 281 "Phys. Inventory Ledger Entry"
{
    Caption = 'Phys. Inventory Ledger Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            OptionCaption = 'Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ,Assembly Consumption,Assembly Output';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ","Assembly Consumption","Assembly Output";
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(9; "Inventory Posting Group"; Code[20])
        {
            Caption = 'Inventory Posting Group';
            TableRelation = "Inventory Posting Group";
        }
        field(12; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(15; "Unit Amount"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Amount';
        }
        field(16; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
        }
        field(17; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(22; "Salespers./Purch. Code"; Code[20])
        {
            Caption = 'Salespers./Purch. Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(24; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(25; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(33; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(34; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(45; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(46; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(54; "Qty. (Calculated)"; Decimal)
        {
            Caption = 'Qty. (Calculated)';
            DecimalPlaces = 0 : 5;
        }
        field(55; "Qty. (Phys. Inventory)"; Decimal)
        {
            Caption = 'Qty. (Phys. Inventory)';
            DecimalPlaces = 0 : 5;
        }
        field(56; "Last Item Ledger Entry No."; Integer)
        {
            Caption = 'Last Item Ledger Entry No.';
            TableRelation = "Item Ledger Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(60; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(61; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(64; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(5407; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(7380; "Phys Invt Counting Period Code"; Code[10])
        {
            Caption = 'Phys Invt Counting Period Code';
            Editable = false;
            TableRelation = "Phys. Invt. Counting Period";
        }
        field(7381; "Phys Invt Counting Period Type"; Option)
        {
            Caption = 'Phys Invt Counting Period Type';
            Editable = false;
            OptionCaption = ' ,Item,SKU';
            OptionMembers = " ",Item,SKU;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Item No.", "Variant Code", "Location Code", "Posting Date")
        {
            SumIndexFields = Quantity;
        }
        key(Key3; "Item No.", "Variant Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Location Code", "Posting Date")
        {
            SumIndexFields = Quantity;
        }
        key(Key4; "Document No.", "Posting Date")
        {
        }
        key(Key5; "Item No.", "Phys Invt Counting Period Type", "Posting Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Item No.", "Posting Date", "Entry Type", "Document No.")
        {
        }
    }
}

