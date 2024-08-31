table 737 "VAT Return Period"
{
    Caption = 'VAT Return Period';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(3; "Period Key"; Code[10])
        {
            Caption = 'Period Key';
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(6; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(7; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Closed';
            OptionMembers = Open,Closed;
        }
        field(8; "Received Date"; Date)
        {
            Caption = 'Received Date';
        }
        field(20; "VAT Return No."; Code[20])
        {
            Caption = 'VAT Return No.';
            Editable = false;
            TableRelation = IF ("VAT Return No." = FILTER (<> '')) "VAT Report Header"."No." WHERE ("VAT Report Config. Code" = CONST ("VAT Return"),
                                                                                                "No." = FIELD ("VAT Return No."));
            ValidateTableRelation = false;
        }
        field(21; "VAT Return Status"; Option)
        {
            CalcFormula = Lookup ("VAT Report Header".Status WHERE ("VAT Report Config. Code" = CONST ("VAT Return"),
                                                                   "No." = FIELD ("VAT Return No.")));
            Caption = 'VAT Return Status';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Open,Released,Submitted,Accepted,Closed,Rejected,Canceled';
            OptionMembers = Open,Released,Submitted,Accepted,Closed,Rejected,Canceled;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

