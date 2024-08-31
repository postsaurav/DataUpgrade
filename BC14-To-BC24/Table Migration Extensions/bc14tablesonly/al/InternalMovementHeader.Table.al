table 7346 "Internal Movement Header"
{
    Caption = 'Internal Movement Header';

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
            CalcFormula = Exist ("Warehouse Comment Line" WHERE ("Table Name" = CONST ("Internal Movement"),
                                                                Type = CONST (" "),
                                                                "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "To Bin Code"; Code[20])
        {
            Caption = 'To Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(10; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(12; "Sorting Method"; Option)
        {
            Caption = 'Sorting Method';
            OptionCaption = ' ,Item,Shelf or Bin,Due Date';
            OptionMembers = " ",Item,"Shelf or Bin","Due Date";
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

