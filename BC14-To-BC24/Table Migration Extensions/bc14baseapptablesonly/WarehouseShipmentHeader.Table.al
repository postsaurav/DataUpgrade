table 7320 "Warehouse Shipment Header"
{
    Caption = 'Warehouse Shipment Header';
    DataCaptionFields = "No.";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(3; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "Warehouse Employee" WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(4; "Assignment Date"; Date)
        {
            Caption = 'Assignment Date';
            Editable = false;
        }
        field(5; "Assignment Time"; Time)
        {
            Caption = 'Assignment Time';
            Editable = false;
        }
        field(6; "Sorting Method"; Option)
        {
            Caption = 'Sorting Method';
            OptionCaption = ' ,Item,Document,Shelf or Bin,Due Date,Destination';
            OptionMembers = " ",Item,Document,"Shelf or Bin","Due Date",Destination;
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(11; Comment; Boolean)
        {
            CalcFormula = Exist ("Warehouse Comment Line" WHERE ("Table Name" = CONST ("Whse. Shipment"),
                                                                Type = CONST (" "),
                                                                "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = IF ("Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"))
            ELSE
            IF ("Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                               "Zone Code" = FIELD ("Zone Code"));
        }
        field(13; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(34; "Document Status"; Option)
        {
            Caption = 'Document Status';
            Editable = false;
            OptionCaption = ' ,Partially Picked,Partially Shipped,Completely Picked,Completely Shipped';
            OptionMembers = " ","Partially Picked","Partially Shipped","Completely Picked","Completely Shipped";
        }
        field(39; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(41; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(42; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code" = FIELD ("Shipping Agent Code"));
        }
        field(43; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(45; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(46; "Completely Picked"; Boolean)
        {
            CalcFormula = Min ("Warehouse Shipment Line"."Completely Picked" WHERE ("No." = FIELD ("No.")));
            Caption = 'Completely Picked';
            Editable = false;
            FieldClass = FlowField;
        }
        field(47; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;
        }
        field(48; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(50; "Create Posted Header"; Boolean)
        {
            Caption = 'Create Posted Header';
        }
        field(61; "Shipping No."; Code[20])
        {
            Caption = 'Shipping No.';
        }
        field(62; "Last Shipping No."; Code[20])
        {
            Caption = 'Last Shipping No.';
            Editable = false;
            TableRelation = "Posted Whse. Shipment Header";
        }
        field(63; "Shipping No. Series"; Code[20])
        {
            Caption = 'Shipping No. Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Location Code")
        {
        }
        key(Key3; "Shipment Date", "Document Status")
        {
        }
    }

    fieldgroups
    {
    }
}

