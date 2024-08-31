table 747 "VAT Report Archive"
{
    Caption = 'VAT Report Archive';
    Permissions = TableData "VAT Report Archive" = rimd;

    fields
    {
        field(1; "VAT Report Type"; Option)
        {
            Caption = 'VAT Report Type';
            OptionCaption = 'EC Sales List,VAT Return';
            OptionMembers = "EC Sales List","VAT Return";
        }
        field(2; "VAT Report No."; Code[20])
        {
            Caption = 'VAT Report No.';
            TableRelation = "VAT Report Header"."No.";
        }
        field(4; "Submitted By"; Code[50])
        {
            Caption = 'Submitted By';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(5; "Submission Message BLOB"; BLOB)
        {
            Caption = 'Submission Message BLOB';
        }
        field(6; "Submittion Date"; Date)
        {
            Caption = 'Submittion Date';
        }
        field(7; "Response Message BLOB"; BLOB)
        {
            Caption = 'Response Message BLOB';
        }
        field(8; "Response Received Date"; DateTime)
        {
            Caption = 'Response Received Date';
        }
        field(10500; "Xml Part ID"; Guid)
        {
            Caption = 'Xml Part ID';
        }
    }

    keys
    {
        key(Key1; "VAT Report Type", "VAT Report No.", "Xml Part ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

