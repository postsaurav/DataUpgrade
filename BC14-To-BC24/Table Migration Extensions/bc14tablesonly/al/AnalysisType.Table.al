table 7113 "Analysis Type"
{
    Caption = 'Analysis Type';
    DataCaptionFields = "Code", Name;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "Value Type"; Option)
        {
            Caption = 'Value Type';
            OptionCaption = ' ,Quantity,Sales Amount,Cost Amount,Non-Invntble Amount,Unit Price,Standard Cost,Indirect Cost,Unit Cost';
            OptionMembers = " ",Quantity,"Sales Amount","Cost Amount","Non-Invntble Amount","Unit Price","Standard Cost","Indirect Cost","Unit Cost";
        }
        field(4; "Item Ledger Entry Type Filter"; Text[250])
        {
            Caption = 'Item Ledger Entry Type Filter';
        }
        field(5; "Value Entry Type Filter"; Text[250])
        {
            Caption = 'Value Entry Type Filter';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

