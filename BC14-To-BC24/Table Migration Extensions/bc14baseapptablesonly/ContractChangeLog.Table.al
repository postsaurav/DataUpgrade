table 5967 "Contract Change Log"
{
    Caption = 'Contract Change Log';
    DataCaptionFields = "Contract No.";
    Permissions = TableData "Contract Change Log" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; "Contract Type"; Option)
        {
            Caption = 'Contract Type';
            OptionCaption = 'Quote,Contract';
            OptionMembers = Quote,Contract;
        }
        field(2; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            TableRelation = IF ("Contract Type" = CONST (Contract)) "Service Contract Header"."Contract No." WHERE ("Contract Type" = FIELD ("Contract Type"));
        }
        field(3; "Change No."; Integer)
        {
            Caption = 'Change No.';
        }
        field(4; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(5; "Date of Change"; Date)
        {
            Caption = 'Date of Change';
        }
        field(6; "Time of Change"; Time)
        {
            Caption = 'Time of Change';
        }
        field(7; "Contract Part"; Option)
        {
            Caption = 'Contract Part';
            OptionCaption = 'Header,Line,Discount';
            OptionMembers = Header,Line,Discount;
        }
        field(8; "Field Description"; Text[100])
        {
            Caption = 'Field Description';
        }
        field(9; "Old Value"; Text[100])
        {
            Caption = 'Old Value';
        }
        field(10; "New Value"; Text[100])
        {
            Caption = 'New Value';
        }
        field(12; "Type of Change"; Option)
        {
            Caption = 'Type of Change';
            OptionCaption = 'Modify,Insert,Delete,Rename';
            OptionMembers = Modify,Insert,Delete,Rename;
        }
        field(13; "Service Item No."; Code[20])
        {
            Caption = 'Service Item No.';
        }
        field(14; "Serv. Contract Line No."; Integer)
        {
            Caption = 'Serv. Contract Line No.';
        }
    }

    keys
    {
        key(Key1; "Contract No.", "Change No.")
        {
            Clustered = true;
        }
        key(Key2; "Contract Type")
        {
        }
    }

    fieldgroups
    {
    }
}

