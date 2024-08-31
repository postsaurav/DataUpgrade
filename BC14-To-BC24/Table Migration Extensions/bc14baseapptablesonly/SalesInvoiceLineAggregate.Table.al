table 5476 "Sales Invoice Line Aggregate"
{
    Caption = 'Sales Invoice Line Aggregate';

    fields
    {
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(10; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(12; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(17; "Qty. to Invoice"; Decimal)
        {
            Caption = 'Qty. to Invoice';
            DecimalPlaces = 0 : 5;
        }
        field(18; "Qty. to Ship"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Qty. to Ship';
            DecimalPlaces = 0 : 5;
        }
        field(22; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
        }
        field(25; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
        }
        field(27; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(28; "Line Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Discount Amount';
        }
        field(29; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(30; "Amount Including VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Including VAT';
        }
        field(60; "Quantity Shipped"; Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Quantity Shipped';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(61; "Quantity Invoiced"; Decimal)
        {
            Caption = 'Quantity Invoiced';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(69; "Inv. Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Discount Amount';
            Editable = false;
        }
        field(87; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";
        }
        field(90; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(91; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(99; "VAT Base Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base Amount';
        }
        field(103; "Line Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount';
        }
        field(180; "Line Discount Calculation"; Option)
        {
            Caption = 'Line Discount Calculation';
            OptionCaption = 'None,%,Amount';
            OptionMembers = "None","%",Amount;
        }
        field(5407; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST (Item),
                                "No." = FILTER (<> '')) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("No."))
            ELSE
            IF (Type = CONST (Resource),
                                         "No." = FILTER (<> '')) "Resource Unit of Measure".Code WHERE ("Resource No." = FIELD ("No."))
            ELSE
            "Unit of Measure";
        }
        field(8000; "Document Id"; Guid)
        {
            Caption = 'Document Id';
        }
        field(8001; Id; Text[50])
        {
            Caption = 'Id';
        }
        field(9020; "Tax Code"; Code[50])
        {
            Caption = 'Tax Code';
        }
        field(9021; "Tax Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Tax Amount';
        }
        field(9022; "Discount Applied Before Tax"; Boolean)
        {
            Caption = 'Discount Applied Before Tax';
        }
        field(9029; "API Type"; Option)
        {
            Caption = 'API Type';
            OptionCaption = 'Comment,Account,Item,Resource,Fixed Asset,Charge';
            OptionMembers = Comment,Account,Item,Resource,"Fixed Asset",Charge;
        }
        field(9030; "Item Id"; Guid)
        {
            Caption = 'Item Id';
            TableRelation = Item.Id;
        }
        field(9031; "Account Id"; Guid)
        {
            Caption = 'Account Id';
            TableRelation = "G/L Account".Id;
        }
        field(9032; "Unit of Measure Id"; Guid)
        {
            Caption = 'Unit of Measure Id';
            TableRelation = "Unit of Measure".Id;
        }
        field(9039; "Line Tax Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Tax Amount';
        }
        field(9040; "Line Amount Including Tax"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount Including Tax';
        }
        field(9041; "Line Amount Excluding Tax"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount Excluding Tax';
        }
        field(9042; "Prices Including Tax"; Boolean)
        {
            Caption = 'Prices Including Tax';
        }
        field(9043; "Inv. Discount Amount Excl. VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Discount Amount Excl. VAT';
        }
        field(9044; "Tax Id"; Guid)
        {
            Caption = 'Tax Id';
        }
        field(9050; "Line Discount Value"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Discount Value';
        }
    }

    keys
    {
        key(Key1; "Document Id", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; Id)
        {
        }
    }

    fieldgroups
    {
    }
}

