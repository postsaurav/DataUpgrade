table 99000773 Family
{
    Caption = 'Family';
    DataCaptionFields = "No.", Description;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(11; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(12; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(13; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(14; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(20; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            TableRelation = "Routing Header";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
    }

    fieldgroups
    {
    }
}

