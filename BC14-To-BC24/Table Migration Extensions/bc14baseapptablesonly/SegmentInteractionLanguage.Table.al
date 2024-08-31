table 5104 "Segment Interaction Language"
{
    Caption = 'Segment Interaction Language';

    fields
    {
        field(1; "Segment No."; Code[20])
        {
            Caption = 'Segment No.';
            TableRelation = "Segment Header";
        }
        field(2; "Segment Line No."; Integer)
        {
            Caption = 'Segment Line No.';
            TableRelation = "Segment Line"."Line No." WHERE ("Segment No." = FIELD ("Segment No."));
        }
        field(3; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Attachment No."; Integer)
        {
            Caption = 'Attachment No.';
        }
        field(6; Subject; Text[100])
        {
            Caption = 'Subject';
        }
    }

    keys
    {
        key(Key1; "Segment No.", "Segment Line No.", "Language Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

