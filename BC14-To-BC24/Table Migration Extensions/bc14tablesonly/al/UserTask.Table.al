table 1170 "User Task"
{
    Caption = 'User Task';
    DataCaptionFields = Title;

    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
            Editable = false;
        }
        field(2; Title; Text[250])
        {
            Caption = 'Subject';
        }
        field(3; "Created By"; Guid)
        {
            Caption = 'Created By';
            DataClassification = EndUserPseudonymousIdentifiers;
            Editable = false;
            TableRelation = User."User Security ID" WHERE ("License Type" = CONST ("Full User"));
        }
        field(4; "Created DateTime"; DateTime)
        {
            Caption = 'Created Date';
            Editable = false;
        }
        field(5; "Assigned To"; Guid)
        {
            Caption = 'Assigned To';
            TableRelation = User."User Security ID" WHERE ("License Type" = CONST ("Full User"));
        }
        field(7; "Completed By"; Guid)
        {
            Caption = 'Completed By';
            DataClassification = EndUserPseudonymousIdentifiers;
            TableRelation = User."User Security ID" WHERE ("License Type" = CONST ("Full User"));
        }
        field(8; "Completed DateTime"; DateTime)
        {
            Caption = 'Completed Date';
        }
        field(9; "Due DateTime"; DateTime)
        {
            Caption = 'Due Date';
        }
        field(10; "Percent Complete"; Integer)
        {
            Caption = '% Complete';
            MaxValue = 100;
            MinValue = 0;
        }
        field(11; "Start DateTime"; DateTime)
        {
            Caption = 'Start Date';
        }
        field(12; Priority; Option)
        {
            Caption = 'Priority';
            OptionCaption = ',Low,Normal,High';
            OptionMembers = ,Low,Normal,High;
        }
        field(13; Description; BLOB)
        {
            Caption = 'Description';
            SubType = Memo;
        }
        field(14; "Created By User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE ("User Security ID" = FIELD ("Created By"),
                                                         "License Type" = CONST ("Full User")));
            Caption = 'User Created By';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Assigned To User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE ("User Security ID" = FIELD ("Assigned To"),
                                                         "License Type" = CONST ("Full User")));
            Caption = 'User Assigned To';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Completed By User Name"; Code[50])
        {
            CalcFormula = Lookup (User."User Name" WHERE ("User Security ID" = FIELD ("Completed By"),
                                                         "License Type" = CONST ("Full User")));
            Caption = 'User Completed By';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Object Type"; Option)
        {
            Caption = 'Link Task To';
            OptionCaption = ',,,Report,,,,,Page';
            OptionMembers = ,,,"Report",,,,,"Page";
        }
        field(18; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            TableRelation = AllObj."Object ID" WHERE ("Object Type" = FIELD ("Object Type"));
        }
        field(19; "Parent ID"; Integer)
        {
            Caption = 'Parent ID';
        }
        field(20; "User Task Group Assigned To"; Code[20])
        {
            Caption = 'User Task Group Assigned To';
            DataClassification = CustomerContent;
            TableRelation = "User Task Group".Code;
        }
        field(21; ShouldShowPendingTasks; Boolean)
        {
            Caption = 'ShouldShowPendingTasks';
            Editable = false;
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; "Assigned To", "User Task Group Assigned To", "Percent Complete", "Due DateTime")
        {
        }
    }

    fieldgroups
    {
    }
}

