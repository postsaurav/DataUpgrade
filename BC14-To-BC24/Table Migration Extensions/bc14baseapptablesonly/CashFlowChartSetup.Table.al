table 869 "Cash Flow Chart Setup"
{
    Caption = 'Cash Flow Chart Setup';

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(2; "Period Length"; Option)
        {
            Caption = 'Period Length';
            OptionCaption = 'Day,Week,Month,Quarter,Year';
            OptionMembers = Day,Week,Month,Quarter,Year;
        }
        field(3; Show; Option)
        {
            Caption = 'Show';
            OptionCaption = 'Accumulated Cash,Change in Cash,Combined';
            OptionMembers = "Accumulated Cash","Change in Cash",Combined;
        }
        field(4; "Start Date"; Option)
        {
            Caption = 'Start Date';
            OptionCaption = 'First Entry Date,Working Date';
            OptionMembers = "First Entry Date","Working Date";
        }
        field(5; "Group By"; Option)
        {
            Caption = 'Group By';
            OptionCaption = 'Positive/Negative,Account No.,Source Type';
            OptionMembers = "Positive/Negative","Account No.","Source Type";
        }
        field(6; "Chart Type"; Option)
        {
            Caption = 'Chart Type';
            OptionCaption = 'Step Line,Stacked Area (%),Stacked Column,Stacked Column (%)';
            OptionMembers = "Step Line","Stacked Area (%)","Stacked Column","Stacked Column (%)";
        }
    }

    keys
    {
        key(Key1; "User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

