table 5612 "FA Depreciation Book"
{
    Caption = 'FA Depreciation Book';
    Permissions = TableData "FA Ledger Entry" = r,
                  TableData "Maintenance Ledger Entry" = r;

    fields
    {
        field(1; "FA No."; Code[20])
        {
            Caption = 'FA No.';
            NotBlank = true;
            TableRelation = "Fixed Asset";
        }
        field(2; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            NotBlank = true;
            TableRelation = "Depreciation Book";
        }
        field(3; "Depreciation Method"; Option)
        {
            Caption = 'Depreciation Method';
            OptionCaption = 'Straight-Line,Declining-Balance 1,Declining-Balance 2,DB1/SL,DB2/SL,User-Defined,Manual';
            OptionMembers = "Straight-Line","Declining-Balance 1","Declining-Balance 2","DB1/SL","DB2/SL","User-Defined",Manual;
        }
        field(4; "Depreciation Starting Date"; Date)
        {
            Caption = 'Depreciation Starting Date';
            Editable = true;
        }
        field(5; "Straight-Line %"; Decimal)
        {
            Caption = 'Straight-Line %';
            DecimalPlaces = 2 : 8;
            MinValue = 0;
        }
        field(6; "No. of Depreciation Years"; Decimal)
        {
            BlankZero = true;
            Caption = 'No. of Depreciation Years';
            DecimalPlaces = 2 : 8;
            MinValue = 0;
        }
        field(7; "No. of Depreciation Months"; Decimal)
        {
            BlankZero = true;
            Caption = 'No. of Depreciation Months';
            DecimalPlaces = 2 : 8;
            MinValue = 0;
        }
        field(8; "Fixed Depr. Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Fixed Depr. Amount';
            MinValue = 0;
        }
        field(9; "Declining-Balance %"; Decimal)
        {
            Caption = 'Declining-Balance %';
            DecimalPlaces = 2 : 8;
            MaxValue = 100;
            MinValue = 0;
        }
        field(10; "Depreciation Table Code"; Code[10])
        {
            Caption = 'Depreciation Table Code';
            TableRelation = "Depreciation Table Header";
        }
        field(11; "Final Rounding Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Final Rounding Amount';
            MinValue = 0;
        }
        field(12; "Ending Book Value"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Ending Book Value';
            MinValue = 0;
        }
        field(13; "FA Posting Group"; Code[20])
        {
            Caption = 'FA Posting Group';
            TableRelation = "FA Posting Group";
        }
        field(14; "Depreciation Ending Date"; Date)
        {
            Caption = 'Depreciation Ending Date';
        }
        field(15; "Acquisition Cost"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (" "),
                                                              "FA Posting Type" = CONST ("Acquisition Cost"),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Acquisition Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; Depreciation; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (" "),
                                                              "FA Posting Type" = CONST (Depreciation),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Depreciation';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Book Value"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "Part of Book Value" = CONST (true),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Book Value';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Proceeds on Disposal"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (" "),
                                                              "FA Posting Type" = CONST ("Proceeds on Disposal"),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Proceeds on Disposal';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Gain/Loss"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (" "),
                                                              "FA Posting Type" = CONST ("Gain/Loss"),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Gain/Loss';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Write-Down"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (" "),
                                                              "FA Posting Type" = CONST ("Write-Down"),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Write-Down';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; Appreciation; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (" "),
                                                              "FA Posting Type" = CONST (Appreciation),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Appreciation';
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Custom 1"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (" "),
                                                              "FA Posting Type" = CONST ("Custom 1"),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Custom 1';
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Custom 2"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (" "),
                                                              "FA Posting Type" = CONST ("Custom 2"),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Custom 2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Depreciable Basis"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "Part of Depreciable Basis" = CONST (true),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Depreciable Basis';
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Salvage Value"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (" "),
                                                              "FA Posting Type" = CONST ("Salvage Value"),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Salvage Value';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Book Value on Disposal"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("FA Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                              "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                              "FA Posting Category" = CONST (Disposal),
                                                              "FA Posting Type" = CONST ("Book Value on Disposal"),
                                                              "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Book Value on Disposal';
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; Maintenance; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Maintenance Ledger Entry".Amount WHERE ("FA No." = FIELD ("FA No."),
                                                                       "Depreciation Book Code" = FIELD ("Depreciation Book Code"),
                                                                       "Maintenance Code" = FIELD ("Maintenance Code Filter"),
                                                                       "FA Posting Date" = FIELD ("FA Posting Date Filter")));
            Caption = 'Maintenance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Maintenance Code Filter"; Code[10])
        {
            Caption = 'Maintenance Code Filter';
            FieldClass = FlowFilter;
            TableRelation = Maintenance;
        }
        field(29; "FA Posting Date Filter"; Date)
        {
            Caption = 'FA Posting Date Filter';
            FieldClass = FlowFilter;
        }
        field(30; "Acquisition Date"; Date)
        {
            Caption = 'Acquisition Date';
            Editable = false;
        }
        field(31; "G/L Acquisition Date"; Date)
        {
            Caption = 'G/L Acquisition Date';
            Editable = false;
        }
        field(32; "Disposal Date"; Date)
        {
            Caption = 'Disposal Date';
            Editable = false;
        }
        field(33; "Last Acquisition Cost Date"; Date)
        {
            Caption = 'Last Acquisition Cost Date';
            Editable = false;
        }
        field(34; "Last Depreciation Date"; Date)
        {
            Caption = 'Last Depreciation Date';
            Editable = false;
        }
        field(35; "Last Write-Down Date"; Date)
        {
            Caption = 'Last Write-Down Date';
            Editable = false;
        }
        field(36; "Last Appreciation Date"; Date)
        {
            Caption = 'Last Appreciation Date';
            Editable = false;
        }
        field(37; "Last Custom 1 Date"; Date)
        {
            Caption = 'Last Custom 1 Date';
            Editable = false;
        }
        field(38; "Last Custom 2 Date"; Date)
        {
            Caption = 'Last Custom 2 Date';
            Editable = false;
        }
        field(39; "Last Salvage Value Date"; Date)
        {
            Caption = 'Last Salvage Value Date';
            Editable = false;
        }
        field(40; "FA Exchange Rate"; Decimal)
        {
            Caption = 'FA Exchange Rate';
            DecimalPlaces = 4 : 4;
            MinValue = 0;
        }
        field(41; "Fixed Depr. Amount below Zero"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Fixed Depr. Amount below Zero';
            MinValue = 0;
        }
        field(42; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(43; "First User-Defined Depr. Date"; Date)
        {
            Caption = 'First User-Defined Depr. Date';
        }
        field(44; "Use FA Ledger Check"; Boolean)
        {
            Caption = 'Use FA Ledger Check';
            InitValue = true;
        }
        field(45; "Last Maintenance Date"; Date)
        {
            Caption = 'Last Maintenance Date';
            Editable = false;
        }
        field(46; "Depr. below Zero %"; Decimal)
        {
            BlankZero = true;
            Caption = 'Depr. below Zero %';
            DecimalPlaces = 2 : 8;
            MinValue = 0;
        }
        field(47; "Projected Disposal Date"; Date)
        {
            Caption = 'Projected Disposal Date';
        }
        field(48; "Projected Proceeds on Disposal"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Projected Proceeds on Disposal';
            MinValue = 0;
        }
        field(50; "Depr. Starting Date (Custom 1)"; Date)
        {
            Caption = 'Depr. Starting Date (Custom 1)';
        }
        field(51; "Depr. Ending Date (Custom 1)"; Date)
        {
            Caption = 'Depr. Ending Date (Custom 1)';
        }
        field(52; "Accum. Depr. % (Custom 1)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Accum. Depr. % (Custom 1)';
            DecimalPlaces = 2 : 8;
            MaxValue = 100;
            MinValue = 0;
        }
        field(53; "Depr. This Year % (Custom 1)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Depr. This Year % (Custom 1)';
            DecimalPlaces = 2 : 8;
            MaxValue = 100;
            MinValue = 0;
        }
        field(54; "Property Class (Custom 1)"; Option)
        {
            Caption = 'Property Class (Custom 1)';
            OptionCaption = ' ,Personal Property,Real Property';
            OptionMembers = " ","Personal Property","Real Property";
        }
        field(55; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(56; "Main Asset/Component"; Option)
        {
            Caption = 'Main Asset/Component';
            Editable = false;
            OptionCaption = ' ,Main Asset,Component';
            OptionMembers = " ","Main Asset",Component;
        }
        field(57; "Component of Main Asset"; Code[20])
        {
            Caption = 'Component of Main Asset';
            Editable = false;
            TableRelation = "Fixed Asset";
        }
        field(58; "FA Add.-Currency Factor"; Decimal)
        {
            Caption = 'FA Add.-Currency Factor';
            DecimalPlaces = 0 : 15;
            MinValue = 0;
        }
        field(59; "Use Half-Year Convention"; Boolean)
        {
            Caption = 'Use Half-Year Convention';
        }
        field(60; "Use DB% First Fiscal Year"; Boolean)
        {
            Caption = 'Use DB% First Fiscal Year';
        }
        field(61; "Temp. Ending Date"; Date)
        {
            Caption = 'Temp. Ending Date';
        }
        field(62; "Temp. Fixed Depr. Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Temp. Fixed Depr. Amount';
        }
        field(63; "Ignore Def. Ending Book Value"; Boolean)
        {
            Caption = 'Ignore Def. Ending Book Value';
        }
        field(70; "Default FA Depreciation Book"; Boolean)
        {
            Caption = 'Default FA Depreciation Book';
        }
    }

    keys
    {
        key(Key1; "FA No.", "Depreciation Book Code")
        {
            Clustered = true;
        }
        key(Key2; "Depreciation Book Code", "FA No.")
        {
        }
        key(Key3; "Depreciation Book Code", "Component of Main Asset", "Main Asset/Component")
        {
        }
        key(Key4; "Main Asset/Component", "Depreciation Book Code")
        {
        }
    }

    fieldgroups
    {
    }
}

