table 6502 "Item Tracking Code"
{
    Caption = 'Item Tracking Code';
    DataCaptionFields = "Code", Description;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Warranty Date Formula"; DateFormula)
        {
            Caption = 'Warranty Date Formula';
        }
        field(5; "Man. Warranty Date Entry Reqd."; Boolean)
        {
            Caption = 'Man. Warranty Date Entry Reqd.';
        }
        field(6; "Man. Expir. Date Entry Reqd."; Boolean)
        {
            Caption = 'Man. Expir. Date Entry Reqd.';
        }
        field(8; "Strict Expiration Posting"; Boolean)
        {
            Caption = 'Strict Expiration Posting';
        }
        field(11; "SN Specific Tracking"; Boolean)
        {
            Caption = 'SN Specific Tracking';
        }
        field(13; "SN Info. Inbound Must Exist"; Boolean)
        {
            Caption = 'SN Info. Inbound Must Exist';
        }
        field(14; "SN Info. Outbound Must Exist"; Boolean)
        {
            Caption = 'SN Info. Outbound Must Exist';
        }
        field(15; "SN Warehouse Tracking"; Boolean)
        {
            AccessByPermission = TableData Location = R;
            Caption = 'SN Warehouse Tracking';
        }
        field(21; "SN Purchase Inbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'SN Purchase Inbound Tracking';
        }
        field(22; "SN Purchase Outbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'SN Purchase Outbound Tracking';
        }
        field(23; "SN Sales Inbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            Caption = 'SN Sales Inbound Tracking';
        }
        field(24; "SN Sales Outbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'SN Sales Outbound Tracking';
        }
        field(25; "SN Pos. Adjmt. Inb. Tracking"; Boolean)
        {
            Caption = 'SN Pos. Adjmt. Inb. Tracking';
        }
        field(26; "SN Pos. Adjmt. Outb. Tracking"; Boolean)
        {
            Caption = 'SN Pos. Adjmt. Outb. Tracking';
        }
        field(27; "SN Neg. Adjmt. Inb. Tracking"; Boolean)
        {
            Caption = 'SN Neg. Adjmt. Inb. Tracking';
        }
        field(28; "SN Neg. Adjmt. Outb. Tracking"; Boolean)
        {
            Caption = 'SN Neg. Adjmt. Outb. Tracking';
        }
        field(29; "SN Transfer Tracking"; Boolean)
        {
            AccessByPermission = TableData Location = R;
            Caption = 'SN Transfer Tracking';
        }
        field(30; "SN Manuf. Inbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'SN Manuf. Inbound Tracking';
        }
        field(31; "SN Manuf. Outbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'SN Manuf. Outbound Tracking';
        }
        field(32; "SN Assembly Inbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "BOM Component" = R;
            Caption = 'SN Assembly Inbound Tracking';
        }
        field(33; "SN Assembly Outbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "BOM Component" = R;
            Caption = 'SN Assembly Outbound Tracking';
        }
        field(41; "Lot Specific Tracking"; Boolean)
        {
            Caption = 'Lot Specific Tracking';
        }
        field(43; "Lot Info. Inbound Must Exist"; Boolean)
        {
            Caption = 'Lot Info. Inbound Must Exist';
        }
        field(44; "Lot Info. Outbound Must Exist"; Boolean)
        {
            Caption = 'Lot Info. Outbound Must Exist';
        }
        field(45; "Lot Warehouse Tracking"; Boolean)
        {
            Caption = 'Lot Warehouse Tracking';
        }
        field(51; "Lot Purchase Inbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Lot Purchase Inbound Tracking';
        }
        field(52; "Lot Purchase Outbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Lot Purchase Outbound Tracking';
        }
        field(53; "Lot Sales Inbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Lot Sales Inbound Tracking';
        }
        field(54; "Lot Sales Outbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Lot Sales Outbound Tracking';
        }
        field(55; "Lot Pos. Adjmt. Inb. Tracking"; Boolean)
        {
            Caption = 'Lot Pos. Adjmt. Inb. Tracking';
        }
        field(56; "Lot Pos. Adjmt. Outb. Tracking"; Boolean)
        {
            Caption = 'Lot Pos. Adjmt. Outb. Tracking';
        }
        field(57; "Lot Neg. Adjmt. Inb. Tracking"; Boolean)
        {
            Caption = 'Lot Neg. Adjmt. Inb. Tracking';
        }
        field(58; "Lot Neg. Adjmt. Outb. Tracking"; Boolean)
        {
            Caption = 'Lot Neg. Adjmt. Outb. Tracking';
        }
        field(59; "Lot Transfer Tracking"; Boolean)
        {
            Caption = 'Lot Transfer Tracking';
        }
        field(60; "Lot Manuf. Inbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Lot Manuf. Inbound Tracking';
        }
        field(61; "Lot Manuf. Outbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Lot Manuf. Outbound Tracking';
        }
        field(62; "Lot Assembly Inbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "BOM Component" = R;
            Caption = 'Lot Assembly Inbound Tracking';
        }
        field(63; "Lot Assembly Outbound Tracking"; Boolean)
        {
            AccessByPermission = TableData "BOM Component" = R;
            Caption = 'Lot Assembly Outbound Tracking';
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

