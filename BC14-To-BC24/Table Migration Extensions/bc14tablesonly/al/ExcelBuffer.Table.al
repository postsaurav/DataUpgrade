table 370 "Excel Buffer"
{
    Caption = 'Excel Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Row No."; Integer)
        {
            Caption = 'Row No.';
            DataClassification = SystemMetadata;
        }
        field(2; xlRowID; Text[10])
        {
            Caption = 'xlRowID';
            DataClassification = SystemMetadata;
        }
        field(3; "Column No."; Integer)
        {
            Caption = 'Column No.';
            DataClassification = SystemMetadata;
        }
        field(4; xlColID; Text[10])
        {
            Caption = 'xlColID';
            DataClassification = SystemMetadata;
        }
        field(5; "Cell Value as Text"; Text[250])
        {
            Caption = 'Cell Value as Text';
            DataClassification = SystemMetadata;
        }
        field(6; Comment; Text[250])
        {
            Caption = 'Comment';
            DataClassification = SystemMetadata;
        }
        field(7; Formula; Text[250])
        {
            Caption = 'Formula';
            DataClassification = SystemMetadata;
        }
        field(8; Bold; Boolean)
        {
            Caption = 'Bold';
            DataClassification = SystemMetadata;
        }
        field(9; Italic; Boolean)
        {
            Caption = 'Italic';
            DataClassification = SystemMetadata;
        }
        field(10; Underline; Boolean)
        {
            Caption = 'Underline';
            DataClassification = SystemMetadata;
        }
        field(11; NumberFormat; Text[30])
        {
            Caption = 'NumberFormat';
            DataClassification = SystemMetadata;
        }
        field(12; Formula2; Text[250])
        {
            Caption = 'Formula2';
            DataClassification = SystemMetadata;
        }
        field(13; Formula3; Text[250])
        {
            Caption = 'Formula3';
            DataClassification = SystemMetadata;
        }
        field(14; Formula4; Text[250])
        {
            Caption = 'Formula4';
            DataClassification = SystemMetadata;
        }
        field(15; "Cell Type"; Option)
        {
            Caption = 'Cell Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Number,Text,Date,Time';
            OptionMembers = Number,Text,Date,Time;
        }
        field(16; "Double Underline"; Boolean)
        {
            Caption = 'Double Underline';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Row No.", "Column No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

