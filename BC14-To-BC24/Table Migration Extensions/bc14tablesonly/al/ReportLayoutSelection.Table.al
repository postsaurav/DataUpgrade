table 9651 "Report Layout Selection"
{
    Caption = 'Report Layout Selection';
    DataPerCompany = false;

    fields
    {
        field(1; "Report ID"; Integer)
        {
            Caption = 'Report ID';
        }
        field(2; "Report Name"; Text[80])
        {
            Caption = 'Report Name';
            Editable = false;
        }
        field(3; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            TableRelation = Company;
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'RDLC (built-in),Word (built-in),Custom Layout';
            OptionMembers = "RDLC (built-in)","Word (built-in)","Custom Layout";
        }
        field(6; "Custom Report Layout Code"; Code[20])
        {
            Caption = 'Custom Report Layout Code';
            TableRelation = "Custom Report Layout" WHERE ("Report ID" = FIELD ("Report ID"));
        }
        field(7; "Report Layout Description"; Text[250])
        {
            CalcFormula = Lookup ("Custom Report Layout".Description WHERE (Code = FIELD ("Custom Report Layout Code")));
            Caption = 'Report Layout Description';
            FieldClass = FlowField;
        }
        field(8; "Report Caption"; Text[80])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Report),
                                                                           "Object ID" = FIELD ("Report ID")));
            Caption = 'Report Caption';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Report ID", "Company Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

