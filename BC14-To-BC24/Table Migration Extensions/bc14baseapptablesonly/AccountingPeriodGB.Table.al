table 10560 "Accounting Period GB"
{
    Caption = 'Accounting Period GB';

    fields
    {
        field(1; "Period Type"; Option)
        {
            Caption = 'Period Type';
            OptionCaption = 'Day,Week,Month,Quarter,Year';
            OptionMembers = Day,Week,Month,Quarter,Year;
        }
        field(2; "Period Start"; Date)
        {
            Caption = 'Period Start';
            NotBlank = true;
        }
        field(3; "Period End"; Date)
        {
            Caption = 'Period End';
            ClosingDates = true;
        }
        field(4; "Period No."; Integer)
        {
            Caption = 'Period No.';
        }
        field(5; "Period Name"; Text[30])
        {
            Caption = 'Period Name';
        }
        field(5804; "Average Cost Calc. Type"; Option)
        {
            Caption = 'Average Cost Calc. Type';
            Editable = false;
            OptionCaption = ' ,Item,Item & Location & Variant';
            OptionMembers = " ",Item,"Item & Location & Variant";
        }
        field(5805; "Average Cost Period"; Option)
        {
            Caption = 'Average Cost Period';
            Editable = false;
            OptionCaption = ' ,Day,Week,Month,Quarter,Year,Accounting Period';
            OptionMembers = " ",Day,Week,Month,Quarter,Year,"Accounting Period";
        }
        field(10500; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = false;
        }
        field(10501; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
    }

    keys
    {
        key(Key1; "Period Type", "Period Start")
        {
            Clustered = true;
        }
        key(Key2; "Period Start", "Line No.")
        {
        }
        key(Key3; Closed)
        {
        }
    }

    fieldgroups
    {
    }
}

