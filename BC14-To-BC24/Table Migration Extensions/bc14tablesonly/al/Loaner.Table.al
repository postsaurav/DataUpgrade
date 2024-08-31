table 5913 Loaner
{
    Caption = 'Loaner';
    DataCaptionFields = "No.", Description;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(5; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF ("Item No." = CONST ('<>''')) "Item Unit of Measure".Code WHERE ("Item No." = FIELD ("Item No."))
            ELSE
            "Unit of Measure";
        }
        field(6; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(7; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(8; Comment; Boolean)
        {
            CalcFormula = Exist ("Service Comment Line" WHERE ("Table Name" = CONST (Loaner),
                                                              "Table Subtype" = CONST ("0"),
                                                              "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(12; "Document No."; Code[20])
        {
            CalcFormula = Lookup ("Loaner Entry"."Document No." WHERE ("Loaner No." = FIELD ("No."),
                                                                      Lent = CONST (true)));
            Caption = 'Document No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; Lent; Boolean)
        {
            CalcFormula = Exist ("Loaner Entry" WHERE ("Loaner No." = FIELD ("No."),
                                                      Lent = CONST (true)));
            Caption = 'Lent';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
        field(15; "Document Type"; Option)
        {
            CalcFormula = Lookup ("Loaner Entry"."Document Type" WHERE ("Loaner No." = FIELD ("No."),
                                                                       Lent = CONST (true)));
            Caption = 'Document Type';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = ' ,Quote,Order';
            OptionMembers = " ",Quote,"Order";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Description)
        {
        }
        key(Key3; "Item No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "Item No.")
        {
        }
    }
}

