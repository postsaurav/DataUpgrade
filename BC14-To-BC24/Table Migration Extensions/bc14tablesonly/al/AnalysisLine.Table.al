table 7114 "Analysis Line"
{
    Caption = 'Analysis Line';

    fields
    {
        field(1; "Analysis Area"; Option)
        {
            Caption = 'Analysis Area';
            OptionCaption = 'Sales,Purchase,Inventory';
            OptionMembers = Sales,Purchase,Inventory;
        }
        field(2; "Analysis Line Template Name"; Code[10])
        {
            Caption = 'Analysis Line Template Name';
            TableRelation = "Analysis Line Template".Name WHERE ("Analysis Area" = FIELD ("Analysis Area"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Row Ref. No."; Code[20])
        {
            Caption = 'Row Ref. No.';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Item,Item Group,Customer,Customer Group,Vendor,Sales/Purchase person,Formula';
            OptionMembers = Item,"Item Group",Customer,"Customer Group",Vendor,"Sales/Purchase person",Formula;
        }
        field(7; Range; Text[250])
        {
            Caption = 'Range';
            TableRelation = IF (Type = CONST (Item)) Item
            ELSE
            IF (Type = CONST (Customer)) Customer
            ELSE
            IF (Type = CONST (Vendor)) Vendor
            ELSE
            IF (Type = CONST ("Item Group")) "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Group Dimension Code"))
            ELSE
            IF (Type = CONST ("Customer Group")) "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Group Dimension Code"))
            ELSE
            IF (Type = CONST ("Sales/Purchase person")) "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Group Dimension Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(9; Show; Option)
        {
            Caption = 'Show';
            OptionCaption = 'Yes,No,If Any Column Not Zero';
            OptionMembers = Yes,No,"If Any Column Not Zero";
        }
        field(10; Bold; Boolean)
        {
            Caption = 'Bold';
        }
        field(11; Italic; Boolean)
        {
            Caption = 'Italic';
        }
        field(12; Underline; Boolean)
        {
            Caption = 'Underline';
        }
        field(13; "Show Opposite Sign"; Boolean)
        {
            Caption = 'Show Opposite Sign';
        }
        field(14; "Source Type Filter"; Option)
        {
            Caption = 'Source Type Filter';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Customer,Vendor,Item';
            OptionMembers = " ",Customer,Vendor,Item;
        }
        field(15; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(16; "Item Budget Filter"; Code[10])
        {
            Caption = 'Item Budget Filter';
            FieldClass = FlowFilter;
            TableRelation = "Item Budget Name".Name WHERE ("Analysis Area" = FIELD ("Analysis Area"));
        }
        field(17; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(18; "Dimension 1 Filter"; Code[20])
        {
            Caption = 'Dimension 1 Filter';
            FieldClass = FlowFilter;
        }
        field(19; "Dimension 2 Filter"; Code[20])
        {
            Caption = 'Dimension 2 Filter';
            FieldClass = FlowFilter;
        }
        field(20; "Dimension 3 Filter"; Code[20])
        {
            Caption = 'Dimension 3 Filter';
            FieldClass = FlowFilter;
        }
        field(21; "Dimension 1 Totaling"; Text[80])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 1 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(22; "Dimension 2 Totaling"; Text[80])
        {
            AccessByPermission = TableData Dimension = R;
            Caption = 'Dimension 2 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(23; "Dimension 3 Totaling"; Text[80])
        {
            AccessByPermission = TableData "Dimension Combination" = R;
            Caption = 'Dimension 3 Totaling';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(24; "Source No. Filter"; Code[20])
        {
            Caption = 'Source No. Filter';
            FieldClass = FlowFilter;
            TableRelation = IF ("Source Type Filter" = CONST (Customer)) Customer
            ELSE
            IF ("Source Type Filter" = CONST (Vendor)) Vendor
            ELSE
            IF ("Source Type Filter" = CONST (Item)) Item;
        }
        field(25; "Group Dimension Code"; Code[20])
        {
            Caption = 'Group Dimension Code';
            TableRelation = Dimension;
        }
        field(26; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Analysis Area", "Analysis Line Template Name", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

