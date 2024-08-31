table 9650 "Custom Report Layout"
{
    Caption = 'Custom Report Layout';
    DataPerCompany = false;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Report ID"; Integer)
        {
            Caption = 'Report ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Report));
        }
        field(3; "Report Name"; Text[80])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Report),
                                                                           "Object ID" = FIELD ("Report ID")));
            Caption = 'Report Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            TableRelation = Company;
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            InitValue = Word;
            OptionCaption = 'RDLC,Word';
            OptionMembers = RDLC,Word;
        }
        field(7; "Layout"; BLOB)
        {
            Caption = 'Layout';
        }
        field(8; "Last Modified"; DateTime)
        {
            Caption = 'Last Modified';
            Editable = false;
        }
        field(9; "Last Modified by User"; Code[50])
        {
            Caption = 'Last Modified by User';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(10; "File Extension"; Text[30])
        {
            Caption = 'File Extension';
            Editable = false;
        }
        field(11; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(12; "Custom XML Part"; BLOB)
        {
            Caption = 'Custom XML Part';
        }
        field(13; "App ID"; Guid)
        {
            Caption = 'App ID';
            Editable = false;
        }
        field(14; "Built-In"; Boolean)
        {
            Caption = 'Built-In';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Report ID", "Company Name", Type)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Description)
        {
        }
    }
}

