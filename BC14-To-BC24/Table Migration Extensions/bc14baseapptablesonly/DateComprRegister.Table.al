table 87 "Date Compr. Register"
{
    Caption = 'Date Compr. Register';
    DataCaptionFields = "No.";

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(3; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Table),
                                                                           "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Period Length"; Option)
        {
            Caption = 'Period Length';
            OptionCaption = 'Day,Week,Month,Quarter,Year,Period';
            OptionMembers = Day,Week,Month,Quarter,Year,Period;
        }
        field(5; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            ClosingDates = true;
        }
        field(6; "No. of New Records"; Integer)
        {
            Caption = 'No. of New Records';
        }
        field(7; "No. Records Deleted"; Integer)
        {
            Caption = 'No. Records Deleted';
        }
        field(8; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(9; "Filter"; Text[250])
        {
            Caption = 'Filter';
        }
        field(10; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            ClosingDates = true;
        }
        field(11; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(12; "Register No."; Integer)
        {
            Caption = 'Register No.';
            TableRelation = IF ("Table ID" = CONST (17)) "G/L Register"
            ELSE
            IF ("Table ID" = CONST (21)) "G/L Register"
            ELSE
            IF ("Table ID" = CONST (25)) "G/L Register"
            ELSE
            IF ("Table ID" = CONST (254)) "G/L Register"
            ELSE
            IF ("Table ID" = CONST (32)) "Item Register"
            ELSE
            IF ("Table ID" = CONST (203)) "Resource Register"
            ELSE
            IF ("Table ID" = CONST (169)) "Job Register"
            ELSE
            IF ("Table ID" = CONST (5601)) "FA Register"
            ELSE
            IF ("Table ID" = CONST (5629)) "Insurance Register"
            ELSE
            IF ("Table ID" = CONST (5625)) "FA Register"
            ELSE
            IF ("Table ID" = CONST (7312)) "Warehouse Register";
        }
        field(13; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(14; "Retain Field Contents"; Text[80])
        {
            Caption = 'Retain Field Contents';
        }
        field(15; "Retain Totals"; Text[80])
        {
            Caption = 'Retain Totals';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Table ID")
        {
        }
        key(Key3; "Table ID", "Ending Date")
        {
        }
    }

    fieldgroups
    {
    }
}

