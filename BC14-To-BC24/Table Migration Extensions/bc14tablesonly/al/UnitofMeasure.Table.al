table 204 "Unit of Measure"
{
    Caption = 'Unit of Measure';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "International Standard Code"; Code[10])
        {
            Caption = 'International Standard Code';
        }
        field(4; Symbol; Text[10])
        {
            Caption = 'Symbol';
        }
        field(5; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Description)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Code", Description, "International Standard Code")
        {
        }
    }
}

