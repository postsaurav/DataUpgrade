table 405 "Change Log Entry"
{
    Caption = 'Change Log Entry';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Date and Time"; DateTime)
        {
            Caption = 'Date and Time';
        }
        field(3; Time; Time)
        {
            Caption = 'Time';
        }
        field(4; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(5; "Table No."; Integer)
        {
            Caption = 'Table No.';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(6; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Table),
                                                                           "Object ID" = FIELD ("Table No.")));
            Caption = 'Table Caption';
            FieldClass = FlowField;
        }
        field(7; "Field No."; Integer)
        {
            Caption = 'Field No.';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table No."));
        }
        field(8; "Field Caption"; Text[80])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table No."),
                                                              "No." = FIELD ("Field No.")));
            Caption = 'Field Caption';
            FieldClass = FlowField;
        }
        field(9; "Type of Change"; Option)
        {
            Caption = 'Type of Change';
            OptionCaption = 'Insertion,Modification,Deletion';
            OptionMembers = Insertion,Modification,Deletion;
        }
        field(10; "Old Value"; Text[2048])
        {
            Caption = 'Old Value';
        }
        field(11; "New Value"; Text[2048])
        {
            Caption = 'New Value';
        }
        field(12; "Primary Key"; Text[250])
        {
            Caption = 'Primary Key';
        }
        field(13; "Primary Key Field 1 No."; Integer)
        {
            Caption = 'Primary Key Field 1 No.';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table No."));
        }
        field(14; "Primary Key Field 1 Caption"; Text[80])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table No."),
                                                              "No." = FIELD ("Primary Key Field 1 No.")));
            Caption = 'Primary Key Field 1 Caption';
            FieldClass = FlowField;
        }
        field(15; "Primary Key Field 1 Value"; Text[50])
        {
            Caption = 'Primary Key Field 1 Value';
        }
        field(16; "Primary Key Field 2 No."; Integer)
        {
            Caption = 'Primary Key Field 2 No.';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table No."));
        }
        field(17; "Primary Key Field 2 Caption"; Text[80])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table No."),
                                                              "No." = FIELD ("Primary Key Field 2 No.")));
            Caption = 'Primary Key Field 2 Caption';
            FieldClass = FlowField;
        }
        field(18; "Primary Key Field 2 Value"; Text[50])
        {
            Caption = 'Primary Key Field 2 Value';
        }
        field(19; "Primary Key Field 3 No."; Integer)
        {
            Caption = 'Primary Key Field 3 No.';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table No."));
        }
        field(20; "Primary Key Field 3 Caption"; Text[80])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table No."),
                                                              "No." = FIELD ("Primary Key Field 3 No.")));
            Caption = 'Primary Key Field 3 Caption';
            FieldClass = FlowField;
        }
        field(21; "Primary Key Field 3 Value"; Text[50])
        {
            Caption = 'Primary Key Field 3 Value';
        }
        field(22; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Table No.", "Primary Key Field 1 Value")
        {
        }
        key(Key3; "Table No.", "Date and Time")
        {
        }
    }

    fieldgroups
    {
    }
}

