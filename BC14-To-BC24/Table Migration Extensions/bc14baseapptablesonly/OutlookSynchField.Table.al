table 5304 "Outlook Synch. Field"
{
    Caption = 'Outlook Synch. Field';
    DataCaptionFields = "Synch. Entity Code";
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
            TableRelation = "Outlook Synch. Entity Element"."Element No." WHERE ("Synch. Entity Code" = FIELD ("Synch. Entity Code"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Master Table No."; Integer)
        {
            Caption = 'Master Table No.';
            Editable = false;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(5; "Outlook Object"; Text[80])
        {
            Caption = 'Outlook Object';
            Editable = false;
        }
        field(6; "Outlook Property"; Text[80])
        {
            Caption = 'Outlook Property';
        }
        field(7; "User-Defined"; Boolean)
        {
            Caption = 'User-Defined';
        }
        field(8; "Search Field"; Boolean)
        {
            Caption = 'Search Field';
        }
        field(9; Condition; Text[250])
        {
            Caption = 'Condition';
            Editable = false;
        }
        field(10; "Table No."; Integer)
        {
            BlankZero = true;
            Caption = 'Table No.';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(11; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Table),
                                                                           "Object ID" = FIELD ("Table No.")));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Table Relation"; Text[250])
        {
            Caption = 'Table Relation';
            Editable = false;
        }
        field(13; "Field No."; Integer)
        {
            BlankZero = true;
            Caption = 'Field No.';
        }
        field(15; "Read-Only Status"; Option)
        {
            Caption = 'Read-Only Status';
            Editable = false;
            OptionCaption = ' ,Read-Only in Microsoft Dynamics NAV,Read-Only in Outlook';
            OptionMembers = " ","Read-Only in Microsoft Dynamics NAV","Read-Only in Outlook";
        }
        field(16; "Field Default Value"; Text[250])
        {
            Caption = 'Field Default Value';
        }
        field(17; "Record GUID"; Guid)
        {
            Caption = 'Record GUID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(99; DefaultValueExpression; Text[250])
        {
            Caption = 'DefaultValueExpression';
        }
    }

    keys
    {
        key(Key1; "Synch. Entity Code", "Element No.", "Line No.")
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

