table 1006 "Job WIP Method"
{
    Caption = 'Job WIP Method';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "WIP Cost"; Boolean)
        {
            Caption = 'WIP Cost';
            InitValue = true;
        }
        field(4; "WIP Sales"; Boolean)
        {
            Caption = 'WIP Sales';
            InitValue = true;
        }
        field(5; "Recognized Costs"; Option)
        {
            Caption = 'Recognized Costs';
            OptionCaption = 'At Completion,Cost of Sales,Cost Value,Contract (Invoiced Cost),Usage (Total Cost)';
            OptionMembers = "At Completion","Cost of Sales","Cost Value","Contract (Invoiced Cost)","Usage (Total Cost)";
        }
        field(6; "Recognized Sales"; Option)
        {
            Caption = 'Recognized Sales';
            OptionCaption = 'At Completion,Contract (Invoiced Price),Usage (Total Cost),Usage (Total Price),Percentage of Completion,Sales Value';
            OptionMembers = "At Completion","Contract (Invoiced Price)","Usage (Total Cost)","Usage (Total Price)","Percentage of Completion","Sales Value";
        }
        field(7; Valid; Boolean)
        {
            Caption = 'Valid';
            InitValue = true;
        }
        field(8; "System Defined"; Boolean)
        {
            Caption = 'System Defined';
            Editable = false;
            InitValue = false;
        }
        field(9; "System-Defined Index"; Integer)
        {
            Caption = 'System-Defined Index';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Valid)
        {
        }
    }

    fieldgroups
    {
    }
}

