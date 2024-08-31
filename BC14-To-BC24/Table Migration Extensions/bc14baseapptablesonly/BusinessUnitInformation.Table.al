table 1828 "Business Unit Information"
{
    Caption = 'Business Unit Information';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(3; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
        }
        field(4; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
        }
        field(5; "Currency Exchange Rate Table"; Option)
        {
            Caption = 'Currency Exchange Rate Table';
            OptionCaption = 'Local,Business Unit';
            OptionMembers = "Local","Business Unit";
        }
        field(6; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(7; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(8; "Exch. Rate Gains Acc."; Code[20])
        {
            Caption = 'Exch. Rate Gains Acc.';
        }
        field(9; "Exch. Rate Losses Acc."; Code[20])
        {
            Caption = 'Exch. Rate Losses Acc.';
        }
        field(10; "Residual Account"; Code[20])
        {
            Caption = 'Residual Account';
            TableRelation = "G/L Account";
        }
        field(11; "Comp. Exch. Rate Gains Acc."; Code[20])
        {
            Caption = 'Comp. Exch. Rate Gains Acc.';
            TableRelation = "G/L Account";
        }
        field(12; "Comp. Exch. Rate Losses Acc."; Code[20])
        {
            Caption = 'Comp. Exch. Rate Losses Acc.';
            TableRelation = "G/L Account";
        }
        field(13; "Equity Exch. Rate Gains Acc."; Code[20])
        {
            Caption = 'Equity Exch. Rate Gains Acc.';
            TableRelation = "G/L Account";
        }
        field(14; "Equity Exch. Rate Losses Acc."; Code[20])
        {
            Caption = 'Equity Exch. Rate Losses Acc.';
            TableRelation = "G/L Account";
        }
        field(15; "Minority Exch. Rate Gains Acc."; Code[20])
        {
            Caption = 'Minority Exch. Rate Gains Acc.';
            TableRelation = "G/L Account";
        }
        field(16; "Minority Exch. Rate Losses Acc"; Code[20])
        {
            Caption = 'Minority Exch. Rate Losses Acc';
            TableRelation = "G/L Account";
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

