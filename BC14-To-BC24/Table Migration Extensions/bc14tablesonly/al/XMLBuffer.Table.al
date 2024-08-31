table 1235 "XML Buffer"
{
    Caption = 'XML Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionCaption = ' ,Element,Attribute,Processing Instruction';
            OptionMembers = " ",Element,Attribute,"Processing Instruction";
        }
        field(3; Name; Text[250])
        {
            Caption = 'Name';
            DataClassification = SystemMetadata;
        }
        field(4; Path; Text[250])
        {
            Caption = 'Path';
            DataClassification = SystemMetadata;
        }
        field(5; Value; Text[250])
        {
            Caption = 'Value';
            DataClassification = SystemMetadata;
        }
        field(6; Depth; Integer)
        {
            Caption = 'Depth';
            DataClassification = SystemMetadata;
        }
        field(7; "Parent Entry No."; Integer)
        {
            Caption = 'Parent Entry No.';
            DataClassification = SystemMetadata;
        }
        field(8; "Is Parent"; Boolean)
        {
            Caption = 'Is Parent';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Is not used anomore';
            ObsoleteState = Pending;
        }
        field(9; "Data Type"; Option)
        {
            Caption = 'Data Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Text,Date,Decimal,DateTime';
            OptionMembers = Text,Date,Decimal,DateTime;
        }
        field(10; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Is not used anymore';
            ObsoleteState = Pending;
        }
        field(11; "Node Name"; Text[250])
        {
            Caption = 'Node Name';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Is not used anymore';
            ObsoleteState = Pending;
        }
        field(12; "Has Attributes"; Boolean)
        {
            Caption = 'Has Attributes';
            DataClassification = SystemMetadata;
            Editable = false;
            ObsoleteReason = 'Is not used anymore';
            ObsoleteState = Pending;
        }
        field(13; "Node Number"; Integer)
        {
            Caption = 'Node Number';
            DataClassification = SystemMetadata;
        }
        field(14; Namespace; Text[250])
        {
            Caption = 'Namespace';
            DataClassification = SystemMetadata;
        }
        field(15; "Import ID"; Guid)
        {
            Caption = 'Import ID';
            DataClassification = SystemMetadata;
        }
        field(16; "Value BLOB"; BLOB)
        {
            Caption = 'Value BLOB';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Parent Entry No.", Type, "Node Number")
        {
        }
    }

    fieldgroups
    {
    }
}

