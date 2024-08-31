table 5841 "Standard Cost Worksheet"
{
    Caption = 'Standard Cost Worksheet';

    fields
    {
        field(2; "Standard Cost Worksheet Name"; Code[10])
        {
            Caption = 'Standard Cost Worksheet Name';
            TableRelation = "Standard Cost Worksheet Name";
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Item,Work Center,Machine Center,Resource';
            OptionMembers = Item,"Work Center","Machine Center",Resource;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            TableRelation = IF (Type = CONST (Item)) Item
            ELSE
            IF (Type = CONST ("Machine Center")) "Machine Center"
            ELSE
            IF (Type = CONST ("Work Center")) "Work Center"
            ELSE
            IF (Type = CONST (Resource)) Resource;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; Implemented; Boolean)
        {
            Caption = 'Implemented';
            Editable = false;
        }
        field(7; "Replenishment System"; Option)
        {
            Caption = 'Replenishment System';
            Editable = false;
            OptionCaption = 'Purchase,Prod. Order, ,Assembly';
            OptionMembers = Purchase,"Prod. Order"," ",Assembly;
        }
        field(11; "Standard Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Standard Cost';
            Editable = false;
            MinValue = 0;
        }
        field(12; "New Standard Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Standard Cost';
            MinValue = 0;
        }
        field(13; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MinValue = 0;
        }
        field(14; "New Indirect Cost %"; Decimal)
        {
            Caption = 'New Indirect Cost %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(15; "Overhead Rate"; Decimal)
        {
            Caption = 'Overhead Rate';
            DecimalPlaces = 2 : 5;
            Editable = false;
        }
        field(16; "New Overhead Rate"; Decimal)
        {
            Caption = 'New Overhead Rate';
            DecimalPlaces = 2 : 5;
        }
        field(21; "Single-Lvl Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Lvl Material Cost';
            Editable = false;
        }
        field(22; "New Single-Lvl Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Single-Lvl Material Cost';
            Editable = false;
        }
        field(23; "Single-Lvl Cap. Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Lvl Cap. Cost';
            Editable = false;
        }
        field(24; "New Single-Lvl Cap. Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Single-Lvl Cap. Cost';
            Editable = false;
        }
        field(25; "Single-Lvl Subcontrd Cost"; Decimal)
        {
            AccessByPermission = TableData "Machine Center" = R;
            AutoFormatType = 2;
            Caption = 'Single-Lvl Subcontrd Cost';
            Editable = false;
        }
        field(26; "New Single-Lvl Subcontrd Cost"; Decimal)
        {
            AccessByPermission = TableData "Machine Center" = R;
            AutoFormatType = 2;
            Caption = 'New Single-Lvl Subcontrd Cost';
            Editable = false;
        }
        field(27; "Single-Lvl Cap. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Lvl Cap. Ovhd Cost';
            Editable = false;
        }
        field(28; "New Single-Lvl Cap. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Single-Lvl Cap. Ovhd Cost';
            Editable = false;
        }
        field(29; "Single-Lvl Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Single-Lvl Mfg. Ovhd Cost';
            Editable = false;
        }
        field(30; "New Single-Lvl Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Single-Lvl Mfg. Ovhd Cost';
            Editable = false;
        }
        field(41; "Rolled-up Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Material Cost';
            Editable = false;
        }
        field(42; "New Rolled-up Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Rolled-up Material Cost';
            Editable = false;
        }
        field(43; "Rolled-up Cap. Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Cap. Cost';
            Editable = false;
        }
        field(44; "New Rolled-up Cap. Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Rolled-up Cap. Cost';
            Editable = false;
        }
        field(45; "Rolled-up Subcontrd Cost"; Decimal)
        {
            AccessByPermission = TableData "Machine Center" = R;
            AutoFormatType = 2;
            Caption = 'Rolled-up Subcontrd Cost';
            Editable = false;
        }
        field(46; "New Rolled-up Subcontrd Cost"; Decimal)
        {
            AccessByPermission = TableData "Machine Center" = R;
            AutoFormatType = 2;
            Caption = 'New Rolled-up Subcontrd Cost';
            Editable = false;
        }
        field(47; "Rolled-up Cap. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Cap. Ovhd Cost';
            Editable = false;
        }
        field(48; "New Rolled-up Cap. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Rolled-up Cap. Ovhd Cost';
            Editable = false;
        }
        field(49; "Rolled-up Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Rolled-up Mfg. Ovhd Cost';
            Editable = false;
        }
        field(50; "New Rolled-up Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'New Rolled-up Mfg. Ovhd Cost';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Standard Cost Worksheet Name", Type, "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

