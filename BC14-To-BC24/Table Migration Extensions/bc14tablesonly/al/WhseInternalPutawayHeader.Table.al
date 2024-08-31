table 7331 "Whse. Internal Put-away Header"
{
    Caption = 'Whse. Internal Put-away Header';

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
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(7; Comment; Boolean)
        {
            CalcFormula = Exist ("Warehouse Comment Line" WHERE ("Table Name" = CONST ("Internal Put-away"),
                                                                Type = CONST (" "),
                                                                "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "From Bin Code"; Code[20])
        {
            Caption = 'From Bin Code';
            TableRelation = IF ("From Zone Code" = FILTER ('')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"))
            ELSE
            IF ("From Zone Code" = FILTER (<> '')) Bin.Code WHERE ("Location Code" = FIELD ("Location Code"),
                                                                                    "Zone Code" = FIELD ("From Zone Code"));
        }
        field(9; "From Zone Code"; Code[10])
        {
            Caption = 'From Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(10; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(11; "Document Status"; Option)
        {
            Caption = 'Document Status';
            Editable = false;
            OptionCaption = ' ,Partially Put Away,Completely Put Away';
            OptionMembers = " ","Partially Put Away","Completely Put Away";
        }
        field(12; "Sorting Method"; Option)
        {
            Caption = 'Sorting Method';
            OptionCaption = ' ,Item,Shelf or Bin,Due Date';
            OptionMembers = " ",Item,"Shelf or Bin","Due Date";
        }
        field(13; Status; Option)
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

