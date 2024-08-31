table 5310 "Outlook Synch. Setup Detail"
{
    Caption = 'Outlook Synch. Setup Detail';
    ReplicateData = false;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            NotBlank = true;
            TableRelation = "Outlook Synch. User Setup"."User ID";
        }
        field(2; "Synch. Entity Code"; Code[10])
        {
            Caption = 'Synch. Entity Code';
            Editable = false;
            TableRelation = "Outlook Synch. Entity Element"."Synch. Entity Code";
        }
        field(3; "Element No."; Integer)
        {
            Caption = 'Element No.';
            Editable = false;
            TableRelation = "Outlook Synch. Entity Element"."Element No.";
        }
        field(4; "Outlook Collection"; Text[80])
        {
            CalcFormula = Lookup ("Outlook Synch. Entity Element"."Outlook Collection" WHERE ("Synch. Entity Code" = FIELD ("Synch. Entity Code"),
                                                                                             "Element No." = FIELD ("Element No.")));
            Caption = 'Outlook Collection';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Table No."; Integer)
        {
            Caption = 'Table No.';
        }
    }

    keys
    {
        key(Key1; "User ID", "Synch. Entity Code", "Element No.")
        {
            Clustered = true;
        }
        key(Key2; "Table No.")
        {
        }
    }

    fieldgroups
    {
    }
}

