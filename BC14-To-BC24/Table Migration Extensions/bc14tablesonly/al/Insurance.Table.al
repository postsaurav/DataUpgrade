table 5628 Insurance
{
    Caption = 'Insurance';
    DataCaptionFields = "No.", Description;
    Permissions = TableData "Ins. Coverage Ledger Entry" = r;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
        }
        field(3; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(4; "Policy No."; Text[30])
        {
            Caption = 'Policy No.';
        }
        field(6; "Annual Premium"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Annual Premium';
            MinValue = 0;
        }
        field(7; "Policy Coverage"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Policy Coverage';
            MinValue = 0;
        }
        field(10; "Total Value Insured"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum ("Ins. Coverage Ledger Entry".Amount WHERE ("Insurance No." = FIELD ("No."),
                                                                         "Disposed FA" = CONST (false),
                                                                         "Posting Date" = FIELD ("Date Filter")));
            Caption = 'Total Value Insured';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; Comment; Boolean)
        {
            CalcFormula = Exist ("Comment Line" WHERE ("Table Name" = CONST (Insurance),
                                                      "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Insurance Type"; Code[10])
        {
            Caption = 'Insurance Type';
            TableRelation = "Insurance Type";
        }
        field(13; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(14; "Insurance Vendor No."; Code[20])
        {
            Caption = 'Insurance Vendor No.';
            TableRelation = Vendor;
        }
        field(15; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
        }
        field(16; "FA Subclass Code"; Code[10])
        {
            Caption = 'FA Subclass Code';
            TableRelation = "FA Subclass";
        }
        field(17; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            TableRelation = "FA Location";
        }
        field(18; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(19; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(20; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(32; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(33; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(34; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }
        field(35; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(36; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Description")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "Policy No.")
        {
        }
    }
}

