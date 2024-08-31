table 1501 Workflow
{
    Caption = 'Workflow';
    DataCaptionFields = "Code", Description;
    Permissions = TableData "Workflow Step" = rimd,
                  TableData "Workflow Step Instance" = rm;
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Enabled; Boolean)
        {
            Caption = 'Enabled';
        }
        field(4; Template; Boolean)
        {
            Caption = 'Template';
            InitValue = false;
        }
        field(5; Category; Code[20])
        {
            Caption = 'Category';
            TableRelation = "Workflow Category";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Enabled)
        {
        }
    }

    fieldgroups
    {
    }
}

