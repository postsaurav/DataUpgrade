table 7333 "Whse. Internal Pick Header"
{
    Caption = 'Whse. Internal Pick Header';
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
            OptionCaption = ' ,Item,Shelf or Bin,Due Date';
            OptionMembers = " ",Item,"Shelf or Bin","Due Date";
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(11; Comment; Boolean)
        {
            CalcFormula = Exist ("Warehouse Comment Line" WHERE ("Table Name" = CONST ("Internal Pick"),
                                                                Type = CONST (" "),
                                                                "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "To Bin Code"; Code[20])
        {
            Caption = 'To Bin Code';
            TableRelation = IF ("To Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"))
            ELSE
            IF ("To Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                  "Zone Code" = FIELD ("To Zone Code"));
        }
        field(13; "To Zone Code"; Code[10])
        {
            Caption = 'To Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(34; "Document Status"; Option)
        {
            Caption = 'Document Status';
            Editable = false;
            OptionCaption = ' ,Partially Picked,Completely Picked';
            OptionMembers = " ","Partially Picked","Completely Picked";
        }
        field(36; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(47; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

