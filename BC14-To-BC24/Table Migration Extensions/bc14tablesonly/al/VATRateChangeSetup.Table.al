table 550 "VAT Rate Change Setup"
{
    Caption = 'VAT Rate Change Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(10; "Update Gen. Prod. Post. Groups"; Option)
        {
            Caption = 'Update Gen. Prod. Post. Groups';
            InitValue = "VAT Prod. Posting Group";
            OptionCaption = 'VAT Prod. Posting Group,,,No';
            OptionMembers = "VAT Prod. Posting Group",,,No;
        }
        field(15; "Update G/L Accounts"; Option)
        {
            Caption = 'Update G/L Accounts';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(17; "Update Items"; Option)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Update Items';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(18; "Update Item Templates"; Option)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Update Item Templates';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(19; "Update Item Charges"; Option)
        {
            AccessByPermission = TableData "Item Charge" = R;
            Caption = 'Update Item Charges';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(21; "Update Resources"; Option)
        {
            AccessByPermission = TableData Resource = R;
            Caption = 'Update Resources';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(30; "Update Gen. Journal Lines"; Option)
        {
            Caption = 'Update Gen. Journal Lines';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(31; "Update Gen. Journal Allocation"; Option)
        {
            AccessByPermission = TableData "Gen. Jnl. Allocation" = R;
            Caption = 'Update Gen. Journal Allocation';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(32; "Update Std. Gen. Jnl. Lines"; Option)
        {
            Caption = 'Update Std. Gen. Jnl. Lines';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(33; "Update Res. Journal Lines"; Option)
        {
            AccessByPermission = TableData Resource = R;
            Caption = 'Update Res. Journal Lines';
            InitValue = "Gen. Prod. Posting Group";
            OptionCaption = ',Gen. Prod. Posting Group,,No';
            OptionMembers = ,"Gen. Prod. Posting Group",,No;
        }
        field(35; "Update Job Journal Lines"; Option)
        {
            AccessByPermission = TableData Job = R;
            Caption = 'Update Job Journal Lines';
            InitValue = "Gen. Prod. Posting Group";
            OptionCaption = ',Gen. Prod. Posting Group,,No';
            OptionMembers = ,"Gen. Prod. Posting Group",,No;
        }
        field(37; "Update Requisition Lines"; Option)
        {
            AccessByPermission = TableData "Req. Wksh. Template" = R;
            Caption = 'Update Requisition Lines';
            InitValue = "Gen. Prod. Posting Group";
            OptionCaption = ',Gen. Prod. Posting Group,,No';
            OptionMembers = ,"Gen. Prod. Posting Group",,No;
        }
        field(39; "Update Std. Item Jnl. Lines"; Option)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Update Std. Item Jnl. Lines';
            InitValue = "Gen. Prod. Posting Group";
            OptionCaption = ',Gen. Prod. Posting Group,,No';
            OptionMembers = ,"Gen. Prod. Posting Group",,No;
        }
        field(41; "Update Service Docs."; Option)
        {
            AccessByPermission = TableData "Service Header" = R;
            Caption = 'Update Service Docs.';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(43; "Update Serv. Price Adj. Detail"; Option)
        {
            AccessByPermission = TableData "Service Header" = R;
            Caption = 'Update Serv. Price Adj. Detail';
            InitValue = "Gen. Prod. Posting Group";
            OptionCaption = ',Gen. Prod. Posting Group,,No';
            OptionMembers = ,"Gen. Prod. Posting Group",,No;
        }
        field(50; "Update Sales Documents"; Option)
        {
            AccessByPermission = TableData "Sales Header" = R;
            Caption = 'Update Sales Documents';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(55; "Update Purchase Documents"; Option)
        {
            AccessByPermission = TableData "Purchase Header" = R;
            Caption = 'Update Purchase Documents';
            InitValue = Both;
            OptionCaption = 'VAT Prod. Posting Group,Gen. Prod. Posting Group,Both,No';
            OptionMembers = "VAT Prod. Posting Group","Gen. Prod. Posting Group",Both,No;
        }
        field(60; "Update Production Orders"; Option)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Update Production Orders';
            InitValue = "Gen. Prod. Posting Group";
            OptionCaption = ',Gen. Prod. Posting Group,,No';
            OptionMembers = ,"Gen. Prod. Posting Group",,No;
        }
        field(62; "Update Work Centers"; Option)
        {
            AccessByPermission = TableData "Machine Center" = R;
            Caption = 'Update Work Centers';
            InitValue = "Gen. Prod. Posting Group";
            OptionCaption = ',Gen. Prod. Posting Group,,No';
            OptionMembers = ,"Gen. Prod. Posting Group",,No;
        }
        field(64; "Update Machine Centers"; Option)
        {
            AccessByPermission = TableData "Machine Center" = R;
            Caption = 'Update Machine Centers';
            InitValue = "Gen. Prod. Posting Group";
            OptionCaption = ',Gen. Prod. Posting Group,,No';
            OptionMembers = ,"Gen. Prod. Posting Group",,No;
        }
        field(70; "Update Reminders"; Option)
        {
            AccessByPermission = TableData "Sales Header" = R;
            Caption = 'Update Reminders';
            InitValue = "VAT Prod. Posting Group";
            OptionCaption = 'VAT Prod. Posting Group,,,No';
            OptionMembers = "VAT Prod. Posting Group",,,No;
        }
        field(75; "Update Finance Charge Memos"; Option)
        {
            Caption = 'Update Finance Charge Memos';
            InitValue = "VAT Prod. Posting Group";
            OptionCaption = 'VAT Prod. Posting Group,,,No';
            OptionMembers = "VAT Prod. Posting Group",,,No;
        }
        field(90; "VAT Rate Change Tool Completed"; Boolean)
        {
            Caption = 'VAT Rate Change Tool Completed';
            InitValue = false;
        }
        field(91; "Ignore Status on Sales Docs."; Boolean)
        {
            Caption = 'Ignore Status on Sales Docs.';
            InitValue = true;
        }
        field(92; "Ignore Status on Purch. Docs."; Boolean)
        {
            Caption = 'Ignore Status on Purch. Docs.';
            InitValue = true;
        }
        field(93; "Perform Conversion"; Boolean)
        {
            Caption = 'Perform Conversion';
        }
        field(100; "Item Filter"; Text[250])
        {
            Caption = 'Item Filter';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(101; "Account Filter"; Text[250])
        {
            Caption = 'Account Filter';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(102; "Resource Filter"; Text[250])
        {
            Caption = 'Resource Filter';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(103; "Ignore Status on Service Docs."; Boolean)
        {
            Caption = 'Ignore Status on Service Docs.';
            InitValue = true;
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

