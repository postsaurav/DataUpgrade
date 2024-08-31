table 7601 "Base Calendar Change"
{
    Caption = 'Base Calendar Change';
    DataCaptionFields = "Base Calendar Code";

    fields
    {
        field(1; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            Editable = false;
            TableRelation = "Base Calendar";
        }
        field(2; "Recurring System"; Option)
        {
            Caption = 'Recurring System';
            OptionCaption = ' ,Annual Recurring,Weekly Recurring';
            OptionMembers = " ","Annual Recurring","Weekly Recurring";
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; Day; Option)
        {
            Caption = 'Day';
            OptionCaption = ' ,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = " ",Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(5; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(6; Nonworking; Boolean)
        {
            Caption = 'Nonworking';
            InitValue = true;
        }
    }

    keys
    {
        key(Key1; "Base Calendar Code", "Recurring System", Date, Day)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

