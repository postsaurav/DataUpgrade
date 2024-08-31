table 730 "Standard Address"
{
    Caption = 'Standard Address';

    fields
    {
        field(1; "Related RecordID"; RecordID)
        {
            Caption = 'Related RecordID';
            DataClassification = SystemMetadata;
        }
        field(2; "Address Type"; Option)
        {
            Caption = 'Address Type';
            OptionCaption = ' ,Sell-to,Bill-to';
            OptionMembers = " ","Sell-to","Bill-to";
        }
        field(3; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(4; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(5; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(6; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(7; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; County; Text[30])
        {
            Caption = 'County';
        }
    }

    keys
    {
        key(Key1; "Related RecordID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

