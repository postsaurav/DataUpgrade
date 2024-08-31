table 1207 "Direct Debit Collection"
{
    Caption = 'Direct Debit Collection';
    DataCaptionFields = Identifier, "Created Date-Time";

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; Identifier; Code[20])
        {
            Caption = 'Identifier';
        }
        field(3; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
        }
        field(4; "Created by User"; Code[50])
        {
            Caption = 'Created by User';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
        }
        field(5; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'New,Canceled,File Created,Posted,Closed';
            OptionMembers = New,Canceled,"File Created",Posted,Closed;
        }
        field(6; "No. of Transfers"; Integer)
        {
            CalcFormula = Count ("Direct Debit Collection Entry" WHERE ("Direct Debit Collection No." = FIELD ("No.")));
            Caption = 'No. of Transfers';
            FieldClass = FlowField;
        }
        field(7; "To Bank Account No."; Code[20])
        {
            Caption = 'To Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(8; "To Bank Account Name"; Text[100])
        {
            CalcFormula = Lookup ("Bank Account".Name WHERE ("No." = FIELD ("To Bank Account No.")));
            Caption = 'To Bank Account Name';
            FieldClass = FlowField;
        }
        field(9; "Message ID"; Code[35])
        {
            Caption = 'Message ID';
        }
        field(10; "Partner Type"; Option)
        {
            Caption = 'Partner Type';
            Editable = false;
            OptionCaption = ' ,Company,Person';
            OptionMembers = " ",Company,Person;
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

