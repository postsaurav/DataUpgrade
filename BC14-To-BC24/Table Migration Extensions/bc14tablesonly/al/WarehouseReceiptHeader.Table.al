table 7316 "Warehouse Receipt Header"
{
    Caption = 'Warehouse Receipt Header';
    Permissions = TableData "Warehouse Receipt Line" = rd;

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
            OptionCaption = ' ,Item,Document,Shelf or Bin,Due Date,Ship-To';
            OptionMembers = " ",Item,Document,"Shelf or Bin","Due Date","Ship-To";
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(8; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(9; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = IF ("Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"))
            ELSE
            IF ("Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                               "Zone Code" = FIELD ("Zone Code"));
        }
        field(10; "Document Status"; Option)
        {
            Caption = 'Document Status';
            Editable = false;
            OptionCaption = ' ,Partially Received,Completely Received';
            OptionMembers = " ","Partially Received","Completely Received";
        }
        field(11; Comment; Boolean)
        {
            CalcFormula = Exist ("Warehouse Comment Line" WHERE ("Table Name" = CONST ("Whse. Receipt"),
                                                                Type = CONST (" "),
                                                                "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(13; "Vendor Shipment No."; Code[35])
        {
            Caption = 'Vendor Shipment No.';
        }
        field(16; "Cross-Dock Zone Code"; Code[10])
        {
            Caption = 'Cross-Dock Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                             "Cross-Dock Bin Zone" = CONST (true));
        }
        field(17; "Cross-Dock Bin Code"; Code[20])
        {
            Caption = 'Cross-Dock Bin Code';
            TableRelation = IF ("Cross-Dock Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                   "Cross-Dock Bin" = CONST (true))
            ELSE
            IF ("Cross-Dock Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                                                                                 "Zone Code" = FIELD ("Cross-Dock Zone Code"),
                                                                                                                                                 "Cross-Dock Bin" = CONST (true));
        }
        field(50; "Create Posted Header"; Boolean)
        {
            Caption = 'Create Posted Header';
        }
        field(51; "Receiving No."; Code[20])
        {
            Caption = 'Receiving No.';
        }
        field(62; "Last Receiving No."; Code[20])
        {
            Caption = 'Last Receiving No.';
            TableRelation = "Posted Whse. Receipt Header";
        }
        field(63; "Receiving No. Series"; Code[20])
        {
            Caption = 'Receiving No. Series';
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
    }

    fieldgroups
    {
    }
}

