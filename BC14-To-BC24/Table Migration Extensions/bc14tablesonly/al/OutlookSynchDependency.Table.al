table 5311 "Outlook Synch. Dependency"
{
    Caption = 'Outlook Synch. Dependency';
    DataCaptionFields = "Synch. Entity Code";
    PasteIsValid = false;
    ReplicateData = false;

    fields
    {
        field(1; "Synch. Entity Code"; Code[10])
        {
            Caption = 'Synch. Entity Code';
            NotBlank = true;
            TableRelation = "Outlook Synch. Entity Element"."Synch. Entity Code";
        }
        field(2; "Element No."; Integer)
        {
            Caption = 'Element No.';
        }
        field(3; "Depend. Synch. Entity Code"; Code[10])
        {
            Caption = 'Depend. Synch. Entity Code';
            TableRelation = "Outlook Synch. Entity".Code;
        }
        field(4; Description; Text[80])
        {
            CalcFormula = Lookup ("Outlook Synch. Entity".Description WHERE (Code = FIELD ("Depend. Synch. Entity Code")));
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Condition; Text[250])
        {
            Caption = 'Condition';
            Editable = false;
        }
        field(6; "Table Relation"; Text[250])
        {
            Caption = 'Table Relation';
            Editable = false;
        }
        field(7; "Record GUID"; Guid)
        {
            Caption = 'Record GUID';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(8; "Depend. Synch. Entity Tab. No."; Integer)
        {
            CalcFormula = Lookup ("Outlook Synch. Entity"."Table No." WHERE (Code = FIELD ("Depend. Synch. Entity Code")));
            Caption = 'Depend. Synch. Entity Tab. No.';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Synch. Entity Code", "Element No.", "Depend. Synch. Entity Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

