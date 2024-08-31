table 99000779 "Production BOM Version"
{
    Caption = 'Production BOM Version';
    DataCaptionFields = "Production BOM No.", "Version Code", Description;

    fields
    {
        field(1; "Production BOM No."; Code[20])
        {
            Caption = 'Production BOM No.';
            NotBlank = true;
            TableRelation = "Production BOM Header";
        }
        field(2; "Version Code"; Code[20])
        {
            Caption = 'Version Code';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(21; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Unit of Measure";
        }
        field(22; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(45; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'New,Certified,Under Development,Closed';
            OptionMembers = New,Certified,"Under Development",Closed;
        }
        field(50; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Production BOM No.", "Version Code")
        {
            Clustered = true;
        }
        key(Key2; "Production BOM No.", "Starting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

