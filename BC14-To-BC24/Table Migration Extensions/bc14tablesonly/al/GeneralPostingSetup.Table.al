table 252 "General Posting Setup"
{
    Caption = 'General Posting Setup';

    fields
    {
        field(1; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(2; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            NotBlank = true;
            TableRelation = "Gen. Product Posting Group";
        }
        field(10; "Sales Account"; Code[20])
        {
            Caption = 'Sales Account';
            TableRelation = "G/L Account";
        }
        field(11; "Sales Line Disc. Account"; Code[20])
        {
            Caption = 'Sales Line Disc. Account';
            TableRelation = "G/L Account";
        }
        field(12; "Sales Inv. Disc. Account"; Code[20])
        {
            Caption = 'Sales Inv. Disc. Account';
            TableRelation = "G/L Account";
        }
        field(13; "Sales Pmt. Disc. Debit Acc."; Code[20])
        {
            Caption = 'Sales Pmt. Disc. Debit Acc.';
            TableRelation = "G/L Account";
        }
        field(14; "Purch. Account"; Code[20])
        {
            Caption = 'Purch. Account';
            TableRelation = "G/L Account";
        }
        field(15; "Purch. Line Disc. Account"; Code[20])
        {
            Caption = 'Purch. Line Disc. Account';
            TableRelation = "G/L Account";
        }
        field(16; "Purch. Inv. Disc. Account"; Code[20])
        {
            Caption = 'Purch. Inv. Disc. Account';
            TableRelation = "G/L Account";
        }
        field(17; "Purch. Pmt. Disc. Credit Acc."; Code[20])
        {
            Caption = 'Purch. Pmt. Disc. Credit Acc.';
            TableRelation = "G/L Account";
        }
        field(18; "COGS Account"; Code[20])
        {
            Caption = 'COGS Account';
            TableRelation = "G/L Account";
        }
        field(19; "Inventory Adjmt. Account"; Code[20])
        {
            Caption = 'Inventory Adjmt. Account';
            TableRelation = "G/L Account";
        }
        field(27; "Sales Credit Memo Account"; Code[20])
        {
            Caption = 'Sales Credit Memo Account';
            TableRelation = "G/L Account";
        }
        field(28; "Purch. Credit Memo Account"; Code[20])
        {
            Caption = 'Purch. Credit Memo Account';
            TableRelation = "G/L Account";
        }
        field(30; "Sales Pmt. Disc. Credit Acc."; Code[20])
        {
            Caption = 'Sales Pmt. Disc. Credit Acc.';
            TableRelation = "G/L Account";
        }
        field(31; "Purch. Pmt. Disc. Debit Acc."; Code[20])
        {
            Caption = 'Purch. Pmt. Disc. Debit Acc.';
            TableRelation = "G/L Account";
        }
        field(32; "Sales Pmt. Tol. Debit Acc."; Code[20])
        {
            Caption = 'Sales Pmt. Tol. Debit Acc.';
            TableRelation = "G/L Account";
        }
        field(33; "Sales Pmt. Tol. Credit Acc."; Code[20])
        {
            Caption = 'Sales Pmt. Tol. Credit Acc.';
            TableRelation = "G/L Account";
        }
        field(34; "Purch. Pmt. Tol. Debit Acc."; Code[20])
        {
            Caption = 'Purch. Pmt. Tol. Debit Acc.';
            TableRelation = "G/L Account";
        }
        field(35; "Purch. Pmt. Tol. Credit Acc."; Code[20])
        {
            Caption = 'Purch. Pmt. Tol. Credit Acc.';
            TableRelation = "G/L Account";
        }
        field(36; "Sales Prepayments Account"; Code[20])
        {
            Caption = 'Sales Prepayments Account';
            TableRelation = "G/L Account";
        }
        field(37; "Purch. Prepayments Account"; Code[20])
        {
            Caption = 'Purch. Prepayments Account';
            TableRelation = "G/L Account";
        }
        field(50; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(51; "View All Accounts on Lookup"; Boolean)
        {
            Caption = 'View All Accounts on Lookup';
        }
        field(5600; "Purch. FA Disc. Account"; Code[20])
        {
            Caption = 'Purch. FA Disc. Account';
            TableRelation = "G/L Account";
        }
        field(5801; "Invt. Accrual Acc. (Interim)"; Code[20])
        {
            Caption = 'Invt. Accrual Acc. (Interim)';
            TableRelation = "G/L Account";
        }
        field(5803; "COGS Account (Interim)"; Code[20])
        {
            Caption = 'COGS Account (Interim)';
            TableRelation = "G/L Account";
        }
        field(99000752; "Direct Cost Applied Account"; Code[20])
        {
            Caption = 'Direct Cost Applied Account';
            TableRelation = "G/L Account";
        }
        field(99000753; "Overhead Applied Account"; Code[20])
        {
            Caption = 'Overhead Applied Account';
            TableRelation = "G/L Account";
        }
        field(99000754; "Purchase Variance Account"; Code[20])
        {
            Caption = 'Purchase Variance Account';
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(Key1; "Gen. Bus. Posting Group", "Gen. Prod. Posting Group")
        {
            Clustered = true;
        }
        key(Key2; "Gen. Prod. Posting Group", "Gen. Bus. Posting Group")
        {
        }
    }

    fieldgroups
    {
    }
}

