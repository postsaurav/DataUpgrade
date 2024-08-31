table 7325 "Whse. Pick Request"
{
    Caption = 'Whse. Pick Request';

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Shipment,Internal Pick,Production,Assembly';
            OptionMembers = Shipment,"Internal Pick",Production,Assembly;
        }
        field(2; "Document Subtype"; Option)
        {
            Caption = 'Document Subtype';
            OptionCaption = '0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            NotBlank = true;
            TableRelation = IF ("Document Type" = CONST (Shipment)) "Warehouse Shipment Header"."No."
            ELSE
            IF ("Document Type" = CONST ("Internal Pick")) "Whse. Internal Pick Header"."No."
            ELSE
            IF ("Document Type" = CONST (Production)) "Production Order"."No." WHERE (Status = FIELD ("Document Subtype"))
            ELSE
            IF ("Document Type" = CONST (Assembly)) "Assembly Header"."No." WHERE ("Document Type" = FIELD ("Document Subtype"));
        }
        field(4; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(5; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(6; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = IF ("Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"))
            ELSE
            IF ("Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                               "Zone Code" = FIELD ("Zone Code"));
        }
        field(7; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;
        }
        field(8; "Completely Picked"; Boolean)
        {
            Caption = 'Completely Picked';
        }
        field(9; "Shipment Method Code"; Code[10])
        {
            CalcFormula = Lookup ("Warehouse Shipment Header"."Shipment Method Code" WHERE ("No." = FIELD ("Document No.")));
            Caption = 'Shipment Method Code';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Shipment Method";
        }
        field(10; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            CalcFormula = Lookup ("Warehouse Shipment Header"."Shipping Agent Code" WHERE ("No." = FIELD ("Document No.")));
            Caption = 'Shipping Agent Code';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Shipping Agent";
        }
        field(11; "Shipping Agent Service Code"; Code[10])
        {
            CalcFormula = Lookup ("Warehouse Shipment Header"."Shipping Agent Service Code" WHERE ("No." = FIELD ("Document No.")));
            Caption = 'Shipping Agent Service Code';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code" = FIELD ("Shipping Agent Code"));
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document Subtype", "Document No.", "Location Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

