table 263 "Intrastat Jnl. Line"
{
    Caption = 'Intrastat Jnl. Line';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Intrastat Jnl. Template";
        }
        field(2; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Intrastat Jnl. Batch".Name WHERE ("Journal Template Name" = FIELD ("Journal Template Name"));
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Receipt,Shipment';
            OptionMembers = Receipt,Shipment;
        }
        field(5; Date; Date)
        {
            Caption = 'Date';
        }
        field(6; "Tariff No."; Code[20])
        {
            Caption = 'Tariff No.';
            NotBlank = true;
            TableRelation = "Tariff Number";
        }
        field(7; "Item Description"; Text[100])
        {
            Caption = 'Item Description';
        }
        field(8; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(9; "Transaction Type"; Code[10])
        {
            Caption = 'Transaction Type';
            TableRelation = "Transaction Type";
        }
        field(10; "Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
        }
        field(11; "Source Type"; Option)
        {
            BlankZero = true;
            Caption = 'Source Type';
            OptionCaption = ',Item Entry,Job Entry';
            OptionMembers = ,"Item Entry","Job Entry";
        }
        field(12; "Source Entry No."; Integer)
        {
            Caption = 'Source Entry No.';
            Editable = false;
            TableRelation = IF ("Source Type" = CONST ("Item Entry")) "Item Ledger Entry"
            ELSE
            IF ("Source Type" = CONST ("Job Entry")) "Job Ledger Entry";
        }
        field(13; "Net Weight"; Decimal)
        {
            Caption = 'Net Weight';
            DecimalPlaces = 2 : 5;
        }
        field(14; Amount; Decimal)
        {
            Caption = 'Amount';
            DecimalPlaces = 0 : 0;
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 0;
        }
        field(16; "Cost Regulation %"; Decimal)
        {
            Caption = 'Cost Regulation %';
            DecimalPlaces = 2 : 2;
            MaxValue = 100;
            MinValue = -100;
        }
        field(17; "Indirect Cost"; Decimal)
        {
            Caption = 'Indirect Cost';
            DecimalPlaces = 0 : 0;
        }
        field(18; "Statistical Value"; Decimal)
        {
            Caption = 'Statistical Value';
            DecimalPlaces = 0 : 0;
        }
        field(19; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(20; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(21; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(22; "Total Weight"; Decimal)
        {
            Caption = 'Total Weight';
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(23; "Supplementary Units"; Boolean)
        {
            Caption = 'Supplementary Units';
            Editable = false;
        }
        field(24; "Internal Ref. No."; Text[10])
        {
            Caption = 'Internal Ref. No.';
            Editable = false;
        }
        field(25; "Country/Region of Origin Code"; Code[10])
        {
            Caption = 'Country/Region of Origin Code';
            TableRelation = "Country/Region";
        }
        field(26; "Entry/Exit Point"; Code[10])
        {
            Caption = 'Entry/Exit Point';
            TableRelation = "Entry/Exit Point";
        }
        field(27; "Area"; Code[10])
        {
            Caption = 'Area';
            TableRelation = Area;
        }
        field(28; "Transaction Specification"; Code[10])
        {
            Caption = 'Transaction Specification';
            TableRelation = "Transaction Specification";
        }
        field(29; "Shpt. Method Code"; Code[10])
        {
            Caption = 'Shpt. Method Code';
            TableRelation = "Shipment Method";
        }
        field(10500; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            ObsoleteReason = 'Merge to W1';
            ObsoleteState = Pending;
            TableRelation = "Shipment Method";
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Source Type", "Source Entry No.")
        {
        }
        key(Key3; Type, "Country/Region Code", "Tariff No.", "Transaction Type", "Transport Method")
        {
        }
        key(Key4; "Internal Ref. No.")
        {
        }
        key(Key5; "Document No.")
        {
        }
    }

    fieldgroups
    {
    }
}

