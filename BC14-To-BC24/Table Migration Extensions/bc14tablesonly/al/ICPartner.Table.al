table 413 "IC Partner"
{
    Caption = 'IC Partner';
    Permissions = TableData "G/L Entry" = rm;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency.Code;
        }
        field(4; "Inbox Type"; Option)
        {
            Caption = 'Inbox Type';
            InitValue = Database;
            OptionCaption = 'File Location,Database,Email,No IC Transfer';
            OptionMembers = "File Location",Database,Email,"No IC Transfer";
        }
        field(5; "Inbox Details"; Text[250])
        {
            Caption = 'Inbox Details';
            TableRelation = IF ("Inbox Type" = CONST (Database)) Company.Name;
        }
        field(6; "Receivables Account"; Code[20])
        {
            Caption = 'Receivables Account';
            TableRelation = "G/L Account"."No.";
        }
        field(7; "Payables Account"; Code[20])
        {
            Caption = 'Payables Account';
            TableRelation = "G/L Account"."No.";
        }
        field(10; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(11; Comment; Boolean)
        {
            CalcFormula = Exist ("Comment Line" WHERE ("Table Name" = CONST ("IC Partner"),
                                                      "No." = FIELD (Code)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(13; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(14; "Outbound Sales Item No. Type"; Option)
        {
            Caption = 'Outbound Sales Item No. Type';
            OptionCaption = 'Internal No.,Common Item No.,Cross Reference';
            OptionMembers = "Internal No.","Common Item No.","Cross Reference";
        }
        field(15; "Outbound Purch. Item No. Type"; Option)
        {
            Caption = 'Outbound Purch. Item No. Type';
            OptionCaption = 'Internal No.,Common Item No.,Cross Reference,Vendor Item No.';
            OptionMembers = "Internal No.","Common Item No.","Cross Reference","Vendor Item No.";
        }
        field(16; "Cost Distribution in LCY"; Boolean)
        {
            Caption = 'Cost Distribution in LCY';
        }
        field(17; "Auto. Accept Transactions"; Boolean)
        {
            Caption = 'Auto. Accept Transactions';
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

