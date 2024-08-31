table 763 "Acc. Sched. Chart Setup Line"
{
    Caption = 'Acc. Sched. Chart Setup Line';

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = "Account Schedules Chart Setup"."User ID" WHERE (Name = FIELD (Name));
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
            Editable = false;
            TableRelation = "Account Schedules Chart Setup".Name WHERE ("User ID" = FIELD ("User ID"));
        }
        field(3; "Account Schedule Name"; Code[10])
        {
            Caption = 'Account Schedule Name';
            Editable = false;
            TableRelation = "Acc. Schedule Name".Name;
        }
        field(4; "Account Schedule Line No."; Integer)
        {
            Caption = 'Account Schedule Line No.';
            Editable = false;
            TableRelation = "Acc. Schedule Line"."Line No." WHERE ("Schedule Name" = FIELD ("Account Schedule Name"));
        }
        field(5; "Column Layout Name"; Code[10])
        {
            Caption = 'Column Layout Name';
            Editable = false;
            TableRelation = "Column Layout Name".Name;
        }
        field(6; "Column Layout Line No."; Integer)
        {
            Caption = 'Column Layout Line No.';
            Editable = false;
            TableRelation = "Column Layout"."Line No." WHERE ("Column Layout Name" = FIELD ("Column Layout Name"));
        }
        field(10; "Original Measure Name"; Text[111])
        {
            Caption = 'Original Measure Name';
            Editable = false;
        }
        field(15; "Measure Name"; Text[111])
        {
            Caption = 'Measure Name';
        }
        field(20; "Measure Value"; Text[30])
        {
            Caption = 'Measure Value';
            Editable = false;
        }
        field(40; "Chart Type"; Option)
        {
            Caption = 'Chart Type';
            OptionCaption = ' ,Line,StepLine,Column,StackedColumn';
            OptionMembers = " ",Line,StepLine,Column,StackedColumn;
        }
    }

    keys
    {
        key(Key1; "User ID", Name, "Account Schedule Line No.", "Column Layout Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

