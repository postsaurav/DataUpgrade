table 99000800 "Sales Planning Line"
{
    Caption = 'Sales Planning Line';
    DataCaptionFields = "Sales Order No.";

    fields
    {
        field(1; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            TableRelation = "Sales Header"."No." WHERE ("Document Type" = CONST (Order));
        }
        field(2; "Sales Order Line No."; Integer)
        {
            Caption = 'Sales Order Line No.';
            TableRelation = "Sales Line"."Line No." WHERE ("Document Type" = CONST (Order),
                                                           "Document No." = FIELD ("Sales Order No."));
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(6; Available; Decimal)
        {
            Caption = 'Available';
            DecimalPlaces = 0 : 5;
        }
        field(7; "Next Planning Date"; Date)
        {
            Caption = 'Next Planning Date';
        }
        field(8; "Expected Delivery Date"; Date)
        {
            Caption = 'Expected Delivery Date';
        }
        field(9; "Planning Status"; Option)
        {
            Caption = 'Planning Status';
            OptionCaption = 'None,Simulated,Planned,Firm Planned,Released,Inventory';
            OptionMembers = "None",Simulated,Planned,"Firm Planned",Released,Inventory;
        }
        field(10; "Needs Replanning"; Boolean)
        {
            Caption = 'Needs Replanning';
        }
        field(11; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."),
                                                       Code = FIELD ("Variant Code"));
        }
        field(12; "Planned Quantity"; Decimal)
        {
            Caption = 'Planned Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(15; "Low-Level Code"; Integer)
        {
            Caption = 'Low-Level Code';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Sales Order No.", "Sales Order Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Low-Level Code")
        {
        }
    }

    fieldgroups
    {
    }
}

