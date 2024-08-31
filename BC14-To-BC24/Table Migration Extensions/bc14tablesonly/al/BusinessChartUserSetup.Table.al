table 487 "Business Chart User Setup"
{
    Caption = 'Business Chart User Setup';
    ReplicateData = false;

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(2; "Object Type"; Option)
        {
            Caption = 'Object Type';
            OptionCaption = ' ,Table,,Report,,Codeunit,XMLport,,Page';
            OptionMembers = " ","Table",,"Report",,"Codeunit","XMLport",,"Page";
        }
        field(3; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            TableRelation = IF ("Object Type" = FILTER (> " ")) AllObj."Object ID" WHERE ("Object Type" = FIELD ("Object Type"));
        }
        field(4; "Period Length"; Option)
        {
            Caption = 'Period Length';
            OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period,None';
            OptionMembers = Day,Week,Month,Quarter,Year,"Accounting Period","None";
        }
    }

    keys
    {
        key(Key1; "User ID", "Object Type", "Object ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

