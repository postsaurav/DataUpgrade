table 5815 "Inventory Period Entry"
{
    Caption = 'Inventory Period Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            NotBlank = true;
        }
        field(2; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            NotBlank = true;
            TableRelation = "Inventory Period";
        }
        field(3; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(5; "Creation Time"; Time)
        {
            Caption = 'Creation Time';
        }
        field(6; "Closing Item Register No."; Integer)
        {
            Caption = 'Closing Item Register No.';
            TableRelation = "Item Register";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(7; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            Editable = false;
            OptionCaption = 'Close,Re-open';
            OptionMembers = Close,"Re-open";
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Ending Date", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

