table 313 "Inventory Setup"
{
    Caption = 'Inventory Setup';
    Permissions = TableData "Inventory Adjmt. Entry (Order)" = m;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Automatic Cost Posting"; Boolean)
        {
            Caption = 'Automatic Cost Posting';
        }
        field(3; "Location Mandatory"; Boolean)
        {
            AccessByPermission = TableData Location = R;
            Caption = 'Location Mandatory';
        }
        field(4; "Item Nos."; Code[20])
        {
            Caption = 'Item Nos.';
            TableRelation = "No. Series";
        }
        field(30; "Automatic Cost Adjustment"; Option)
        {
            Caption = 'Automatic Cost Adjustment';
            OptionCaption = 'Never,Day,Week,Month,Quarter,Year,Always';
            OptionMembers = Never,Day,Week,Month,Quarter,Year,Always;
        }
        field(40; "Prevent Negative Inventory"; Boolean)
        {
            Caption = 'Prevent Negative Inventory';
        }
        field(50; "Skip Prompt to Create Item"; Boolean)
        {
            Caption = 'Skip Prompt to Create Item';
            DataClassification = SystemMetadata;
        }
        field(51; "Copy Item Descr. to Entries"; Boolean)
        {
            Caption = 'Copy Item Descr. to Entries';
            DataClassification = SystemMetadata;
        }
        field(5700; "Transfer Order Nos."; Code[20])
        {
            AccessByPermission = TableData "Transfer Header" = R;
            Caption = 'Transfer Order Nos.';
            TableRelation = "No. Series";
        }
        field(5701; "Posted Transfer Shpt. Nos."; Code[20])
        {
            AccessByPermission = TableData "Transfer Header" = R;
            Caption = 'Posted Transfer Shpt. Nos.';
            TableRelation = "No. Series";
        }
        field(5702; "Posted Transfer Rcpt. Nos."; Code[20])
        {
            AccessByPermission = TableData "Transfer Header" = R;
            Caption = 'Posted Transfer Rcpt. Nos.';
            TableRelation = "No. Series";
        }
        field(5703; "Copy Comments Order to Shpt."; Boolean)
        {
            AccessByPermission = TableData "Transfer Header" = R;
            Caption = 'Copy Comments Order to Shpt.';
            InitValue = true;
        }
        field(5704; "Copy Comments Order to Rcpt."; Boolean)
        {
            AccessByPermission = TableData "Transfer Header" = R;
            Caption = 'Copy Comments Order to Rcpt.';
            InitValue = true;
        }
        field(5718; "Nonstock Item Nos."; Code[20])
        {
            AccessByPermission = TableData "Nonstock Item" = R;
            Caption = 'Catalog Item Nos.';
            TableRelation = "No. Series";
        }
        field(5790; "Outbound Whse. Handling Time"; DateFormula)
        {
            AccessByPermission = TableData Location = R;
            Caption = 'Outbound Whse. Handling Time';
        }
        field(5791; "Inbound Whse. Handling Time"; DateFormula)
        {
            AccessByPermission = TableData Location = R;
            Caption = 'Inbound Whse. Handling Time';
        }
        field(5800; "Expected Cost Posting to G/L"; Boolean)
        {
            Caption = 'Expected Cost Posting to G/L';
        }
        field(5801; "Default Costing Method"; Option)
        {
            Caption = 'Default Costing Method';
            OptionCaption = 'FIFO,LIFO,Specific,Average,Standard';
            OptionMembers = FIFO,LIFO,Specific,"Average",Standard;
        }
        field(5804; "Average Cost Calc. Type"; Option)
        {
            Caption = 'Average Cost Calc. Type';
            InitValue = "Item & Location & Variant";
            NotBlank = true;
            OptionCaption = ' ,Item,Item & Location & Variant';
            OptionMembers = " ",Item,"Item & Location & Variant";
        }
        field(5805; "Average Cost Period"; Option)
        {
            Caption = 'Average Cost Period';
            InitValue = Day;
            NotBlank = true;
            OptionCaption = ' ,Day,Week,Month,Quarter,Year,Accounting Period';
            OptionMembers = " ",Day,Week,Month,Quarter,Year,"Accounting Period";
        }
        field(5875; "Phys. Invt. Order Nos."; Code[20])
        {
            AccessByPermission = TableData "Phys. Invt. Order Header" = R;
            Caption = 'Phys. Invt. Order Nos.';
            TableRelation = "No. Series";
        }
        field(5876; "Posted Phys. Invt. Order Nos."; Code[20])
        {
            AccessByPermission = TableData "Phys. Invt. Order Header" = R;
            Caption = 'Posted Phys. Invt. Order Nos.';
            TableRelation = "No. Series";
        }
        field(7101; "Item Group Dimension Code"; Code[20])
        {
            Caption = 'Item Group Dimension Code';
            TableRelation = Dimension;
        }
        field(7300; "Inventory Put-away Nos."; Code[20])
        {
            AccessByPermission = TableData "Posted Invt. Put-away Header" = R;
            Caption = 'Inventory Put-away Nos.';
            TableRelation = "No. Series";
        }
        field(7301; "Inventory Pick Nos."; Code[20])
        {
            AccessByPermission = TableData "Posted Invt. Pick Header" = R;
            Caption = 'Inventory Pick Nos.';
            TableRelation = "No. Series";
        }
        field(7302; "Posted Invt. Put-away Nos."; Code[20])
        {
            AccessByPermission = TableData "Posted Invt. Put-away Header" = R;
            Caption = 'Posted Invt. Put-away Nos.';
            TableRelation = "No. Series";
        }
        field(7303; "Posted Invt. Pick Nos."; Code[20])
        {
            AccessByPermission = TableData "Posted Invt. Pick Header" = R;
            Caption = 'Posted Invt. Pick Nos.';
            TableRelation = "No. Series";
        }
        field(7304; "Inventory Movement Nos."; Code[20])
        {
            AccessByPermission = TableData "Whse. Internal Put-away Header" = R;
            Caption = 'Inventory Movement Nos.';
            TableRelation = "No. Series";
        }
        field(7305; "Registered Invt. Movement Nos."; Code[20])
        {
            AccessByPermission = TableData "Whse. Internal Put-away Header" = R;
            Caption = 'Registered Invt. Movement Nos.';
            TableRelation = "No. Series";
        }
        field(7306; "Internal Movement Nos."; Code[20])
        {
            AccessByPermission = TableData "Whse. Internal Put-away Header" = R;
            Caption = 'Internal Movement Nos.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

