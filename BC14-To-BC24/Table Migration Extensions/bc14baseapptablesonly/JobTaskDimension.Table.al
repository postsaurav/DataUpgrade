table 1002 "Job Task Dimension"
{
    Caption = 'Job Task Dimension';

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            Editable = false;
            NotBlank = true;
            TableRelation = "Job Task"."Job No.";
        }
        field(2; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            NotBlank = true;
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(3; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            TableRelation = Dimension.Code;
        }
        field(4; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = FIELD ("Dimension Code"));
        }
        field(5; "Multiple Selection Action"; Option)
        {
            Caption = 'Multiple Selection Action';
            OptionCaption = ' ,Change,Delete';
            OptionMembers = " ",Change,Delete;
        }
    }

    keys
    {
        key(Key1; "Job No.", "Job Task No.", "Dimension Code")
        {
            Clustered = true;
        }
        key(Key2; "Dimension Code")
        {
        }
    }

    fieldgroups
    {
    }
}

