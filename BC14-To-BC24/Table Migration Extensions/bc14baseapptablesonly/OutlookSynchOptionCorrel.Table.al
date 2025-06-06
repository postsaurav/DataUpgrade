table 5307 "Outlook Synch. Option Correl."
{
    Caption = 'Outlook Synch. Option Correl.';
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
        field(3; "Field Line No."; Integer)
        {
            Caption = 'Field Line No.';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; "Outlook Object"; Text[80])
        {
            Caption = 'Outlook Object';
        }
        field(6; "Outlook Property"; Text[80])
        {
            Caption = 'Outlook Property';
        }
        field(7; "Outlook Value"; Text[80])
        {
            Caption = 'Outlook Value';
        }
        field(8; "Table No."; Integer)
        {
            Caption = 'Table No.';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(9; "Field No."; Integer)
        {
            Caption = 'Field No.';
            TableRelation = Field."No." WHERE (TableNo = FIELD ("Table No."));
        }
        field(11; "Option No."; Integer)
        {
            Caption = 'Option No.';
            Editable = false;
        }
        field(12; "Enumeration No."; Integer)
        {
            Caption = 'Enumeration No.';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Synch. Entity Code", "Element No.", "Field Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

