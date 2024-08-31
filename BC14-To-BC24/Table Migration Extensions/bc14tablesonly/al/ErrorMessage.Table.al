table 700 "Error Message"
{
    Caption = 'Error Message';

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(2; "Record ID"; RecordID)
        {
            Caption = 'Record ID';
            DataClassification = SystemMetadata;
        }
        field(3; "Field Number"; Integer)
        {
            Caption = 'Field Number';
        }
        field(4; "Message Type"; Option)
        {
            Caption = 'Message Type';
            Editable = false;
            OptionCaption = 'Error,Warning,Information';
            OptionMembers = Error,Warning,Information;
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(6; "Additional Information"; Text[250])
        {
            Caption = 'Additional Information';
            Editable = false;
        }
        field(7; "Support Url"; Text[250])
        {
            Caption = 'Support Url';
            Editable = false;
        }
        field(8; "Table Number"; Integer)
        {
            Caption = 'Table Number';
        }
        field(10; "Context Record ID"; RecordID)
        {
            Caption = 'Context Record ID';
            DataClassification = SystemMetadata;
        }
        field(11; "Field Name"; Text[80])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Table Number"),
                                                              "No." = FIELD ("Field Number")));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Table Name"; Text[80])
        {
            CalcFormula = Lookup ("Table Metadata".Caption WHERE (ID = FIELD ("Table Number")));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Context Field Number"; Integer)
        {
            Caption = 'Context Field Number';
            DataClassification = SystemMetadata;
        }
        field(14; "Context Table Number"; Integer)
        {
            Caption = 'Context Table Number';
            DataClassification = SystemMetadata;
        }
        field(15; "Context Field Name"; Text[80])
        {
            CalcFormula = Lookup (Field."Field Caption" WHERE (TableNo = FIELD ("Context Table Number"),
                                                              "No." = FIELD ("Context Field Number")));
            Caption = 'Context Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; "Context Record ID", "Record ID")
        {
        }
        key(Key3; "Message Type", ID)
        {
        }
    }

    fieldgroups
    {
    }
}

