table 770 "Analysis Report Chart Setup"
{
    Caption = 'Analysis Report Chart Setup';

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(10; "Analysis Area"; Option)
        {
            Caption = 'Analysis Area';
            Editable = false;
            OptionCaption = 'Sales,Purchase,Inventory';
            OptionMembers = Sales,Purchase,Inventory;
        }
        field(20; "Analysis Report Name"; Code[10])
        {
            Caption = 'Analysis Report Name';
            TableRelation = "Analysis Report Name".Name WHERE ("Analysis Area" = FIELD ("Analysis Area"));
        }
        field(21; "Analysis Line Template Name"; Code[10])
        {
            Caption = 'Analysis Line Template Name';
            Editable = false;
            TableRelation = "Analysis Report Name"."Analysis Line Template Name" WHERE ("Analysis Area" = FIELD ("Analysis Area"),
                                                                                        Name = FIELD ("Analysis Report Name"));
        }
        field(22; "Analysis Column Template Name"; Code[10])
        {
            Caption = 'Analysis Column Template Name';
            Editable = false;
            TableRelation = "Analysis Report Name"."Analysis Column Template Name" WHERE ("Analysis Area" = FIELD ("Analysis Area"),
                                                                                          Name = FIELD ("Analysis Report Name"));
        }
        field(30; "Base X-Axis on"; Option)
        {
            Caption = 'Base X-Axis on';
            OptionCaption = 'Period,Line,Column';
            OptionMembers = Period,Line,Column;
        }
        field(31; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(32; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(41; "Period Length"; Option)
        {
            Caption = 'Period Length';
            OptionCaption = 'Day,Week,Month,Quarter,Year';
            OptionMembers = Day,Week,Month,Quarter,Year;
        }
        field(42; "No. of Periods"; Integer)
        {
            Caption = 'No. of Periods';
            InitValue = 12;
        }
        field(50; "Last Viewed"; Boolean)
        {
            Caption = 'Last Viewed';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "User ID", "Analysis Area", Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

