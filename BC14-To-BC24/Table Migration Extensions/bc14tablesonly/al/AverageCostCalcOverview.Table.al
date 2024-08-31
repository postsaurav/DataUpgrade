table 5847 "Average Cost Calc. Overview"
{
    Caption = 'Average Cost Calc. Overview';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Closing Entry,Increase,Applied Increase,Applied Decrease,Decrease,Revaluation';
            OptionMembers = "Closing Entry",Increase,"Applied Increase","Applied Decrease",Decrease,Revaluation;
        }
        field(3; "Valuation Date"; Date)
        {
            Caption = 'Valuation Date';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(5; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(6; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code WHERE ("Item No." = FIELD ("Item No."));
        }
        field(7; "Cost is Adjusted"; Boolean)
        {
            Caption = 'Cost is Adjusted';
        }
        field(11; "Attached to Entry No."; Integer)
        {
            Caption = 'Attached to Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(12; "Attached to Valuation Date"; Date)
        {
            Caption = 'Attached to Valuation Date';
        }
        field(13; Level; Integer)
        {
            Caption = 'Level';
        }
        field(21; "Item Ledger Entry No."; Integer)
        {
            Caption = 'Item Ledger Entry No.';
            TableRelation = "Item Ledger Entry";
        }
        field(22; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(23; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            OptionCaption = 'Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ,Assembly Consumption,Assembly Output';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ","Assembly Consumption","Assembly Output";
        }
        field(24; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Sales Shipment,Sales Invoice,Sales Return Receipt,Sales Credit Memo,Purchase Receipt,Purchase Invoice,Purchase Return Shipment,Purchase Credit Memo,Transfer Shipment,Transfer Receipt,Service Shipment,Service Invoice,Service Credit Memo';
            OptionMembers = " ","Sales Shipment","Sales Invoice","Sales Return Receipt","Sales Credit Memo","Purchase Receipt","Purchase Invoice","Purchase Return Shipment","Purchase Credit Memo","Transfer Shipment","Transfer Receipt","Service Shipment","Service Invoice","Service Credit Memo";
        }
        field(25; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(26; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
        field(27; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(31; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(32; "Applied Quantity"; Integer)
        {
            Caption = 'Applied Quantity';
        }
        field(33; "Cost Amount (Expected)"; Decimal)
        {
            Caption = 'Cost Amount (Expected)';
        }
        field(34; "Cost Amount (Actual)"; Decimal)
        {
            Caption = 'Cost Amount (Actual)';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Attached to Valuation Date", "Attached to Entry No.", Type)
        {
        }
        key(Key3; "Item Ledger Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

