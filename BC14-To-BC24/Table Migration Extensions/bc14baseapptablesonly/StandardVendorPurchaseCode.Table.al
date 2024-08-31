table 175 "Standard Vendor Purchase Code"
{
    Caption = 'Standard Vendor Purchase Code';

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            NotBlank = true;
            TableRelation = Vendor;
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
            TableRelation = "Standard Purchase Code";
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(15; "Insert Rec. Lines On Quotes"; Option)
        {
            Caption = 'Insert Rec. Lines On Quotes';
            DataClassification = SystemMetadata;
            OptionCaption = 'Manual,Automatic,Always Ask';
            OptionMembers = Manual,Automatic,"Always Ask";
        }
        field(16; "Insert Rec. Lines On Orders"; Option)
        {
            Caption = 'Insert Rec. Lines On Orders';
            DataClassification = SystemMetadata;
            OptionCaption = 'Manual,Automatic,Always Ask';
            OptionMembers = Manual,Automatic,"Always Ask";
        }
        field(17; "Insert Rec. Lines On Invoices"; Option)
        {
            Caption = 'Insert Rec. Lines On Invoices';
            DataClassification = SystemMetadata;
            OptionCaption = 'Manual,Automatic,Always Ask';
            OptionMembers = Manual,Automatic,"Always Ask";
        }
        field(18; "Insert Rec. Lines On Cr. Memos"; Option)
        {
            Caption = 'Insert Rec. Lines On Cr. Memos';
            DataClassification = SystemMetadata;
            OptionCaption = 'Manual,Automatic,Always Ask';
            OptionMembers = Manual,Automatic,"Always Ask";
        }
    }

    keys
    {
        key(Key1; "Vendor No.", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

