table 6083 "Serv. Price Adjustment Detail"
{
    Caption = 'Serv. Price Adjustment Detail';

    fields
    {
        field(1; "Serv. Price Adjmt. Gr. Code"; Code[10])
        {
            Caption = 'Serv. Price Adjmt. Gr. Code';
            NotBlank = true;
            TableRelation = "Service Price Adjustment Group";
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Item,Resource,Resource Group,Service Cost,G/L Account';
            OptionMembers = Item,Resource,"Resource Group","Service Cost","G/L Account";
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST (Item)) Item
            ELSE
            IF (Type = CONST (Resource)) Resource
            ELSE
            IF (Type = CONST ("Resource Group")) "Resource Group"
            ELSE
            IF (Type = CONST ("Service Cost")) "Service Cost"
            ELSE
            IF (Type = CONST ("G/L Account")) "G/L Account";
        }
        field(4; "Work Type"; Code[10])
        {
            Caption = 'Work Type';
            TableRelation = "Work Type";
        }
        field(5; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Serv. Price Adjmt. Gr. Code", Type, "No.", "Work Type", "Gen. Prod. Posting Group")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

