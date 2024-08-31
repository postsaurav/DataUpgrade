table 484 "Change Global Dim. Header"
{
    Caption = 'Change Global Dim. Header';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Old Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Old Global Dimension 1 Code';
            DataClassification = SystemMetadata;
            TableRelation = Dimension;
        }
        field(3; "Old Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Old Global Dimension 2 Code';
            DataClassification = SystemMetadata;
            TableRelation = Dimension;
        }
        field(4; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = SystemMetadata;
            TableRelation = Dimension;
        }
        field(5; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = SystemMetadata;
            TableRelation = Dimension;
        }
        field(6; "Parallel Processing"; Boolean)
        {
            Caption = 'Parallel Processing';
            DataClassification = SystemMetadata;
        }
        field(7; "Change Type 1"; Option)
        {
            Caption = 'Change Type 1';
            DataClassification = SystemMetadata;
            OptionCaption = 'None,Blank,Replace,New';
            OptionMembers = "None",Blank,Replace,New;
        }
        field(8; "Change Type 2"; Option)
        {
            Caption = 'Change Type 2';
            DataClassification = SystemMetadata;
            OptionCaption = 'None,Blank,Replace,New';
            OptionMembers = "None",Blank,Replace,New;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

