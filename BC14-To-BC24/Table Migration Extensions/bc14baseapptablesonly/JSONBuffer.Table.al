table 1236 "JSON Buffer"
{
    Caption = 'JSON Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; Depth; Integer)
        {
            Caption = 'Depth';
            DataClassification = SystemMetadata;
        }
        field(3; "Token type"; Option)
        {
            Caption = 'Token type';
            DataClassification = SystemMetadata;
            OptionCaption = 'None,Start Object,Start Array,Start Constructor,Property Name,Comment,Raw,Integer,Decimal,String,Boolean,Null,Undefined,End Object,End Array,End Constructor,Date,Bytes';
            OptionMembers = "None","Start Object","Start Array","Start Constructor","Property Name",Comment,Raw,"Integer",Decimal,String,Boolean,Null,Undefined,"End Object","End Array","End Constructor",Date,Bytes;
        }
        field(4; Value; Text[250])
        {
            Caption = 'Value';
            DataClassification = SystemMetadata;
        }
        field(5; "Value Type"; Text[50])
        {
            Caption = 'Value Type';
            DataClassification = SystemMetadata;
        }
        field(6; Path; Text[250])
        {
            Caption = 'Path';
            DataClassification = SystemMetadata;
        }
        field(7; "Value BLOB"; BLOB)
        {
            Caption = 'Value BLOB';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

