page 50000 "SDH Demo Entries"
{
    Caption = 'Demo Entries';
    PageType = List;
    SourceTable = "Demo Entry";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal. Account No. field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("System-Created Entry"; Rec."System-Created Entry")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the System-Created Entry field.';
                }
                field("Prior-Year Entry"; Rec."Prior-Year Entry")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prior-Year Entry field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Business Unit Code field.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Journal Batch Name field.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
                field("Gen. Posting Type"; Rec."Gen. Posting Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gen. Posting Type field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal. Account Type field.';
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction No. field.';
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Debit Amount field.';
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Credit Amount field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source No. field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax Area Code field.';
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax Liable field.';
                }
                field("Tax Group Code"; Rec."Tax Group Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax Group Code field.';
                }
                field("Use Tax"; Rec."Use Tax")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Use Tax field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Bus. Posting Group field.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
                }
                field("Additional-Currency Amount"; Rec."Additional-Currency Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Additional-Currency Amount field.';
                }
                field("Add.-Currency Debit Amount"; Rec."Add.-Currency Debit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Add.-Currency Debit Amount field.';
                }
                field("Add.-Currency Credit Amount"; Rec."Add.-Currency Credit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Add.-Currency Credit Amount field.';
                }
                field("Close Income Statement Dim. ID"; Rec."Close Income Statement Dim. ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Close Income Statement Dim. ID field.';
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the IC Partner Code field.';
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reversed field.';
                }
                field("Reversed by Entry No."; Rec."Reversed by Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reversed by Entry No. field.';
                }
                field("Reversed Entry No."; Rec."Reversed Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reversed Entry No. field.';
                }
            }
        }
    }
}

