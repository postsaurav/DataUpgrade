table 5301 "Outlook Synch. Entity Element"
{
    Caption = 'Outlook Synch. Entity Element';
    PasteIsValid = false;
    ReplicateData = false;

    fields
    {
        field(1; "Synch. Entity Code"; Code[10])
        {
            Caption = 'Synch. Entity Code';
            NotBlank = true;
            TableRelation = "Outlook Synch. Entity".Code;
        }
        field(2; "Element No."; Integer)
        {
            Caption = 'Element No.';
        }
        field(3; "Table No."; Integer)
        {
            BlankZero = true;
            Caption = 'Table No.';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(4; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Table),
                                                                           "Object ID" = FIELD ("Table No.")));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Table Relation"; Text[250])
        {
            Caption = 'Table Relation';
            Editable = false;
        }
        field(6; "Outlook Collection"; Text[80])
        {
            Caption = 'Outlook Collection';
        }
        field(7; "Master Table No."; Integer)
        {
            CalcFormula = Lookup ("Outlook Synch. Entity"."Table No." WHERE (Code = FIELD ("Synch. Entity Code")));
            Caption = 'Master Table No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Record GUID"; Guid)
        {
            Caption = 'Record GUID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(9; "No. of Dependencies"; Integer)
        {
            CalcFormula = Count ("Outlook Synch. Dependency" WHERE ("Synch. Entity Code" = FIELD ("Synch. Entity Code"),
                                                                   "Element No." = FIELD ("Element No.")));
            Caption = 'No. of Dependencies';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Synch. Entity Code", "Element No.")
        {
            Clustered = true;
        }
        key(Key2; "Table No.")
        {
        }
        key(Key3; "Record GUID")
        {
        }
    }

    fieldgroups
    {
    }
}

