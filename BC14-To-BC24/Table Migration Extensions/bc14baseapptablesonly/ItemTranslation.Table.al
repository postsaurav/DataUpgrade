table 30 "Item Translation"
{
    Caption = 'Item Translation';
    DataCaptionFields = "Item No.", "Variant Code", "Language Code", Description;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            NotBlank = true;
            TableRelation = Language;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(5400; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
    }

    keys
    {
        key(Key1; "Item No.", "Variant Code", "Language Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

