table 5430 "Planning Error Log"
{
    Caption = 'Planning Error Log';
    ReplicateData = false;

    fields
    {
        field(1; "Worksheet Template Name"; Code[10])
        {
            Caption = 'Worksheet Template Name';
            TableRelation = "Req. Wksh. Template";
        }
        field(2; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Requisition Wksh. Name".Name WHERE ("Worksheet Template Name" = FIELD ("Worksheet Template Name"));
        }
        field(3; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(5; "Error Description"; Text[250])
        {
            Caption = 'Error Description';
        }
        field(6; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(7; "Table Position"; Text[250])
        {
            Caption = 'Table Position';
        }
    }

    keys
    {
        key(Key1; "Worksheet Template Name", "Journal Batch Name", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

