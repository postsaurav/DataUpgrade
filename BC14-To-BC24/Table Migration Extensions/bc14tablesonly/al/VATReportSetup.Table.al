table 743 "VAT Report Setup"
{
    Caption = 'VAT Report Setup';

    fields
    {
        field(1; "Primary key"; Code[10])
        {
            Caption = 'Primary key';
        }
        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(3; "Modify Submitted Reports"; Boolean)
        {
            Caption = 'Allow Modification';
        }
        field(4; "VAT Return No. Series"; Code[20])
        {
            Caption = 'VAT Return No. Series';
            TableRelation = "No. Series";
        }
        field(20; "VAT Return Period No. Series"; Code[20])
        {
            Caption = 'VAT Return Period No. Series';
            TableRelation = "No. Series";
        }
        field(21; "Report Version"; Code[10])
        {
            Caption = 'Report Version';
            TableRelation = "VAT Reports Configuration"."VAT Report Version" WHERE ("VAT Report Type" = CONST ("VAT Return"));
        }
        field(22; "Period Reminder Time"; Integer)
        {
            Caption = 'Period Reminder Time';
            MinValue = 0;
            ObsoleteReason = 'Redesigned to a new field "Period Reminder Calculation"';
            ObsoleteState = Pending;
        }
        field(23; "Update Period Job Frequency"; Option)
        {
            Caption = 'Update Period Job Frequency';
            OptionCaption = 'Never,Daily,Weekly';
            OptionMembers = Never,Daily,Weekly;
        }
        field(24; "Manual Receive Period CU ID"; Integer)
        {
            Caption = 'Manual Receive Period CU ID';
            TableRelation = "CodeUnit Metadata".ID;
        }
        field(25; "Manual Receive Period CU Cap"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Codeunit),
                                                                           "Object ID" = FIELD ("Manual Receive Period CU ID")));
            Caption = 'Manual Receive Period CU Cap';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Auto Receive Period CU ID"; Integer)
        {
            Caption = 'Auto Receive Period CU ID';
            TableRelation = "CodeUnit Metadata".ID;
        }
        field(27; "Auto Receive Period CU Cap"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Codeunit),
                                                                           "Object ID" = FIELD ("Auto Receive Period CU ID")));
            Caption = 'Auto Receive Period CU Cap';
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Receive Submitted Return CU ID"; Integer)
        {
            Caption = 'Receive Submitted Return CU ID';
            TableRelation = "CodeUnit Metadata".ID;
        }
        field(29; "Receive Submitted Return CUCap"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Codeunit),
                                                                           "Object ID" = FIELD ("Receive Submitted Return CU ID")));
            Caption = 'Receive Submitted Return CUCap';
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Period Reminder Calculation"; DateFormula)
        {
            Caption = 'Period Reminder Calculation';
        }
    }

    keys
    {
        key(Key1; "Primary key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

