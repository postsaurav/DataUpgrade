table 279 "Extended Text Header"
{
    Caption = 'Extended Text Header';
    DataCaptionFields = "No.", "Language Code", "Text No.";

    fields
    {
        field(1; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionCaption = 'Standard Text,G/L Account,Item,Resource';
            OptionMembers = "Standard Text","G/L Account",Item,Resource;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF ("Table Name" = CONST ("Standard Text")) "Standard Text"
            ELSE
            IF ("Table Name" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Table Name" = CONST (Item)) Item
            ELSE
            IF ("Table Name" = CONST (Resource)) Resource;
        }
        field(3; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(4; "Text No."; Integer)
        {
            Caption = 'Text No.';
            Editable = false;
        }
        field(5; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(6; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(7; "All Language Codes"; Boolean)
        {
            Caption = 'All Language Codes';
            InitValue = true;
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(11; "Sales Quote"; Boolean)
        {
            AccessByPermission = TableData "Sales Header" = R;
            Caption = 'Sales Quote';
            InitValue = true;
        }
        field(12; "Sales Invoice"; Boolean)
        {
            AccessByPermission = TableData "Sales Header" = R;
            Caption = 'Sales Invoice';
            InitValue = true;
        }
        field(13; "Sales Order"; Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Sales Order';
            InitValue = true;
        }
        field(14; "Sales Credit Memo"; Boolean)
        {
            AccessByPermission = TableData "Sales Header" = R;
            Caption = 'Sales Credit Memo';
            InitValue = true;
        }
        field(15; "Purchase Quote"; Boolean)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            Caption = 'Purchase Quote';
            InitValue = true;
        }
        field(16; "Purchase Invoice"; Boolean)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            Caption = 'Purchase Invoice';
            InitValue = true;
        }
        field(17; "Purchase Order"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Purchase Order';
            InitValue = true;
        }
        field(18; "Purchase Credit Memo"; Boolean)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            Caption = 'Purchase Credit Memo';
            InitValue = true;
        }
        field(19; Reminder; Boolean)
        {
            AccessByPermission = TableData Customer = R;
            Caption = 'Reminder';
            InitValue = true;
        }
        field(20; "Finance Charge Memo"; Boolean)
        {
            AccessByPermission = TableData Customer = R;
            Caption = 'Finance Charge Memo';
            InitValue = true;
        }
        field(21; "Sales Blanket Order"; Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Sales Blanket Order';
            InitValue = true;
        }
        field(22; "Purchase Blanket Order"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Purchase Blanket Order';
            InitValue = true;
        }
        field(23; "Prepmt. Sales Invoice"; Boolean)
        {
            AccessByPermission = TableData "Sales Header" = R;
            Caption = 'Prepmt. Sales Invoice';
            InitValue = true;
        }
        field(24; "Prepmt. Sales Credit Memo"; Boolean)
        {
            AccessByPermission = TableData "Sales Header" = R;
            Caption = 'Prepmt. Sales Credit Memo';
            InitValue = true;
        }
        field(25; "Prepmt. Purchase Invoice"; Boolean)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            Caption = 'Prepmt. Purchase Invoice';
            InitValue = true;
        }
        field(26; "Prepmt. Purchase Credit Memo"; Boolean)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            Caption = 'Prepmt. Purchase Credit Memo';
            InitValue = true;
        }
        field(5900; "Service Order"; Boolean)
        {
            AccessByPermission = TableData "Service Header" = R;
            Caption = 'Service Order';
            InitValue = true;
        }
        field(5901; "Service Quote"; Boolean)
        {
            AccessByPermission = TableData "Service Header" = R;
            Caption = 'Service Quote';
            InitValue = true;
        }
        field(5902; "Service Invoice"; Boolean)
        {
            AccessByPermission = TableData "Service Header" = R;
            Caption = 'Service Invoice';
            InitValue = true;
        }
        field(5903; "Service Credit Memo"; Boolean)
        {
            AccessByPermission = TableData "Service Header" = R;
            Caption = 'Service Credit Memo';
            InitValue = true;
        }
        field(6600; "Sales Return Order"; Boolean)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            Caption = 'Sales Return Order';
            InitValue = true;
        }
        field(6605; "Purchase Return Order"; Boolean)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Purchase Return Order';
            InitValue = true;
        }
    }

    keys
    {
        key(Key1; "Table Name", "No.", "Language Code", "Text No.")
        {
            Clustered = true;
        }
        key(Key2; "Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date")
        {
        }
    }

    fieldgroups
    {
    }
}

