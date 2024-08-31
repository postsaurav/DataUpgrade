table 915 "ATO Sales Buffer"
{
    Caption = 'ATO Sales Buffer';
    ReplicateData = false;

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionCaption = ',Sale,Total Sale,Assembly,Total Assembly';
            OptionMembers = ,Sale,"Total Sale",Assembly,"Total Assembly";
        }
        field(2; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = SystemMetadata;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = SystemMetadata;
        }
        field(4; "Parent Item No."; Code[20])
        {
            Caption = 'Parent Item No.';
            DataClassification = SystemMetadata;
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = SystemMetadata;
        }
        field(6; "Sales Cost"; Decimal)
        {
            Caption = 'Sales Cost';
            DataClassification = SystemMetadata;
        }
        field(7; "Sales Amount"; Decimal)
        {
            Caption = 'Sales Amount';
            DataClassification = SystemMetadata;
        }
        field(8; "Profit %"; Decimal)
        {
            Caption = 'Profit %';
            DataClassification = SystemMetadata;
        }
        field(9; "Parent Description"; Text[100])
        {
            Caption = 'Parent Description';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; Type, "Order No.", "Item No.", "Parent Item No.")
        {
            Clustered = true;
        }
        key(Key2; "Item No.", Type, "Parent Item No.")
        {
        }
    }

    fieldgroups
    {
    }
}

