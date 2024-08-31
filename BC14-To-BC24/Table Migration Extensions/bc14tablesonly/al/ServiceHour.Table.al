table 5910 "Service Hour"
{
    Caption = 'Service Hour';

    fields
    {
        field(1; "Service Contract No."; Code[20])
        {
            Caption = 'Service Contract No.';
            TableRelation = IF ("Service Contract Type" = CONST (Contract)) "Service Contract Header"."Contract No." WHERE ("Contract Type" = CONST (Contract))
            ELSE
            IF ("Service Contract Type" = CONST (Quote)) "Service Contract Header"."Contract No." WHERE ("Contract Type" = CONST (Quote));
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(3; Day; Option)
        {
            Caption = 'Day';
            OptionCaption = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(4; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
        }
        field(5; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
        }
        field(6; "Valid on Holidays"; Boolean)
        {
            Caption = 'Valid on Holidays';
        }
        field(7; "Service Contract Type"; Option)
        {
            Caption = 'Service Contract Type';
            OptionCaption = ' ,Quote,Contract';
            OptionMembers = " ",Quote,Contract;
        }
    }

    keys
    {
        key(Key1; "Service Contract Type", "Service Contract No.", Day, "Starting Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

