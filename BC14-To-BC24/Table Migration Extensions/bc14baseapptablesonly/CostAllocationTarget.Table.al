table 1107 "Cost Allocation Target"
{
    Caption = 'Cost Allocation Target';

    fields
    {
        field(1; ID; Code[10])
        {
            Caption = 'ID';
            Editable = false;
            TableRelation = "Cost Allocation Source";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = false;
            InitValue = 0;
            NotBlank = true;
        }
        field(5; "Target Cost Type"; Code[20])
        {
            Caption = 'Target Cost Type';
            TableRelation = "Cost Type";
        }
        field(6; "Target Cost Center"; Code[20])
        {
            Caption = 'Target Cost Center';
            TableRelation = "Cost Center";
        }
        field(7; "Target Cost Object"; Code[20])
        {
            Caption = 'Target Cost Object';
            TableRelation = "Cost Object";
        }
        field(8; "Static Base"; Decimal)
        {
            BlankZero = true;
            Caption = 'Static Base';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
        }
        field(9; "Static Weighting"; Decimal)
        {
            BlankZero = true;
            Caption = 'Static Weighting';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(10; Share; Decimal)
        {
            Caption = 'Share';
            DecimalPlaces = 2 : 5;
            MinValue = 0;
        }
        field(11; Percent; Decimal)
        {
            Caption = 'Percent';
            DecimalPlaces = 2 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(20; Comment; Text[50])
        {
            Caption = 'Comment';
        }
        field(30; Base; Option)
        {
            Caption = 'Base';
            OptionCaption = 'Static,G/L Entries,G/L Budget Entries,Cost Type Entries,Cost Budget Entries,,,,,No of Employees,,Items Sold (Qty.),Items Purchased (Qty.),Items Sold (Amount),Items Purchased (Amount)';
            OptionMembers = Static,"G/L Entries","G/L Budget Entries","Cost Type Entries","Cost Budget Entries",,,,,"No of Employees",,"Items Sold (Qty.)","Items Purchased (Qty.)","Items Sold (Amount)","Items Purchased (Amount)";
        }
        field(31; "No. Filter"; Text[250])
        {
            Caption = 'No. Filter';
        }
        field(32; "Cost Center Filter"; Text[250])
        {
            Caption = 'Cost Center Filter';
            TableRelation = "Cost Center";
            ValidateTableRelation = false;
        }
        field(33; "Cost Object Filter"; Text[250])
        {
            Caption = 'Cost Object Filter';
            TableRelation = "Cost Object";
            ValidateTableRelation = false;
        }
        field(34; "Date Filter Code"; Option)
        {
            Caption = 'Date Filter Code';
            OptionCaption = ' ,Week,Last Week,Month,Last Month,Month of Last Year,Year,Last Year,Period,Last Period,Period of Last Year,Fiscal Year,Last Fiscal Year';
            OptionMembers = " ",Week,"Last Week",Month,"Last Month","Month of Last Year",Year,"Last Year",Period,"Last Period","Period of Last Year","Fiscal Year","Last Fiscal Year";
        }
        field(35; "Group Filter"; Text[250])
        {
            Caption = 'Group Filter';
        }
        field(38; "Allocation Target Type"; Option)
        {
            Caption = 'Allocation Target Type';
            OptionCaption = 'All Costs,Percent per Share,Amount per Share';
            OptionMembers = "All Costs","Percent per Share","Amount per Share";
        }
        field(40; "Percent per Share"; Decimal)
        {
            BlankZero = true;
            Caption = 'Percent per Share';
            MinValue = 0;
        }
        field(41; "Amount per Share"; Decimal)
        {
            BlankZero = true;
            Caption = 'Amount per Share';
            MinValue = 0;
        }
        field(50; "Share Updated on"; Date)
        {
            Caption = 'Share Updated on';
            Editable = false;
        }
        field(60; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(61; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
    }

    keys
    {
        key(Key1; ID, "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Target Cost Type")
        {
        }
        key(Key3; "Target Cost Center")
        {
        }
        key(Key4; "Target Cost Object")
        {
        }
        key(Key5; ID, "Allocation Target Type")
        {
        }
    }

    fieldgroups
    {
    }
}

