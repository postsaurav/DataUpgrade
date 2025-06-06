table 5300 "Outlook Synch. Entity"
{
    Caption = 'Outlook Synch. Entity';
    DataCaptionFields = "Code", Description;
    PasteIsValid = false;
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
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
        field(5; Condition; Text[250])
        {
            Caption = 'Condition';
            Editable = false;
        }
        field(6; "Outlook Item"; Text[80])
        {
            Caption = 'Outlook Item';
        }
        field(7; "Record GUID"; Guid)
        {
            Caption = 'Record GUID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Record GUID")
        {
        }
    }

    fieldgroups
    {
    }
}

