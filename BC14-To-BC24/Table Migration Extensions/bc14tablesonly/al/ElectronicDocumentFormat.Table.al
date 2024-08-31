table 61 "Electronic Document Format"
{
    Caption = 'Electronic Document Format';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Usage; Option)
        {
            Caption = 'Usage';
            OptionCaption = 'Sales Invoice,Sales Credit Memo,Sales Validation,Service Invoice,Service Credit Memo,Service Validation,Job Quote';
            OptionMembers = "Sales Invoice","Sales Credit Memo","Sales Validation","Service Invoice","Service Credit Memo","Service Validation","Job Quote";
        }
        field(4; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(5; "Codeunit ID"; Integer)
        {
            BlankZero = true;
            Caption = 'Codeunit ID';
            NotBlank = true;
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(6; "Codeunit Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Codeunit),
                                                                           "Object ID" = FIELD ("Codeunit ID")));
            Caption = 'Codeunit Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Delivery Codeunit ID"; Integer)
        {
            BlankZero = true;
            Caption = 'Delivery Codeunit ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(8; "Delivery Codeunit Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Codeunit),
                                                                           "Object ID" = FIELD ("Delivery Codeunit ID")));
            Caption = 'Delivery Codeunit Caption';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code", Usage)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

