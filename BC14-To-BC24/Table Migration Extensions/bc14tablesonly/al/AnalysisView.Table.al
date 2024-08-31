table 363 "Analysis View"
{
    Caption = 'Analysis View';
    DataCaptionFields = "Code", Name;
    Permissions = TableData "Analysis View Entry" = rimd,
                  TableData "Analysis View Budget Entry" = rimd;

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
        field(3; "Account Source"; Option)
        {
            Caption = 'Account Source';
            OptionCaption = 'G/L Account,Cash Flow Account';
            OptionMembers = "G/L Account","Cash Flow Account";
        }
        field(4; "Last Entry No."; Integer)
        {
            Caption = 'Last Entry No.';
        }
        field(5; "Last Budget Entry No."; Integer)
        {
            Caption = 'Last Budget Entry No.';
        }
        field(6; "Last Date Updated"; Date)
        {
            Caption = 'Last Date Updated';
        }
        field(7; "Update on Posting"; Boolean)
        {
            Caption = 'Update on Posting';
            Editable = false;
        }
        field(8; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(9; "Account Filter"; Code[250])
        {
            Caption = 'Account Filter';
            TableRelation = IF ("Account Source" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Account Source" = CONST ("Cash Flow Account")) "Cash Flow Account";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10; "Business Unit Filter"; Code[250])
        {
            Caption = 'Business Unit Filter';
            TableRelation = "Business Unit";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(11; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(12; "Date Compression"; Option)
        {
            Caption = 'Date Compression';
            InitValue = Day;
            OptionCaption = 'None,Day,Week,Month,Quarter,Year,Period';
            OptionMembers = "None",Day,Week,Month,Quarter,Year,Period;
        }
        field(13; "Dimension 1 Code"; Code[20])
        {
            Caption = 'Dimension 1 Code';
            TableRelation = Dimension;
        }
        field(14; "Dimension 2 Code"; Code[20])
        {
            Caption = 'Dimension 2 Code';
            TableRelation = Dimension;
        }
        field(15; "Dimension 3 Code"; Code[20])
        {
            Caption = 'Dimension 3 Code';
            TableRelation = Dimension;
        }
        field(16; "Dimension 4 Code"; Code[20])
        {
            Caption = 'Dimension 4 Code';
            TableRelation = Dimension;
        }
        field(17; "Include Budgets"; Boolean)
        {
            AccessByPermission = TableData "G/L Budget Name" = R;
            Caption = 'Include Budgets';
        }
        field(18; "Refresh When Unblocked"; Boolean)
        {
            Caption = 'Refresh When Unblocked';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Account Source")
        {
        }
    }

    fieldgroups
    {
    }
}

