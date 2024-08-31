table 1205 "Credit Transfer Register"
{
    Caption = 'Credit Transfer Register';
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
            Editable = false;
            OptionCaption = 'Canceled,File Created,File Re-exported';
            OptionMembers = Canceled,"File Created","File Re-exported";
        }
        field(6; "No. of Transfers"; Integer)
        {
            CalcFormula = Count ("Credit Transfer Entry" WHERE ("Credit Transfer Register No." = FIELD ("No.")));
            Caption = 'No. of Transfers';
            FieldClass = FlowField;
        }
        field(7; "From Bank Account No."; Code[20])
        {
            Caption = 'From Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(8; "From Bank Account Name"; Text[100])
        {
            CalcFormula = Lookup ("Bank Account".Name WHERE ("No." = FIELD ("From Bank Account No.")));
            Caption = 'From Bank Account Name';
            FieldClass = FlowField;
        }
        field(9; "Exported File"; BLOB)
        {
            Caption = 'Exported File';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Status)
        {
        }
    }

    fieldgroups
    {
    }
}

