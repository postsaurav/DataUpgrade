table 771 "Analysis Report Chart Line"
{
    Caption = 'Analysis Report Chart Line';

    fields
    {
        field(1; "User ID"; Text[132])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = "Analysis Report Chart Setup"."User ID" WHERE (Name = FIELD (Name),
                                                                           "Analysis Area" = FIELD ("Analysis Area"));
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
            Editable = false;
            TableRelation = "Analysis Report Chart Setup".Name WHERE ("User ID" = FIELD ("User ID"),
                                                                      "Analysis Area" = FIELD ("Analysis Area"));
        }
        field(3; "Analysis Line Line No."; Integer)
        {
            Caption = 'Analysis Line Line No.';
            Editable = false;
            TableRelation = "Analysis Line"."Line No." WHERE ("Analysis Area" = FIELD ("Analysis Area"),
                                                              "Analysis Line Template Name" = FIELD ("Analysis Line Template Name"));
        }
        field(4; "Analysis Column Line No."; Integer)
        {
            Caption = 'Analysis Column Line No.';
            Editable = false;
            TableRelation = "Analysis Column"."Line No." WHERE ("Analysis Area" = FIELD ("Analysis Area"),
                                                                "Analysis Column Template" = FIELD ("Analysis Column Template Name"));
        }
        field(6; "Analysis Area"; Option)
        {
            Caption = 'Analysis Area';
            Editable = false;
            OptionCaption = 'Sales,Purchase,Inventory';
            OptionMembers = Sales,Purchase,Inventory;
            TableRelation = "Analysis Report Chart Setup"."Analysis Area" WHERE ("User ID" = FIELD ("User ID"),
                                                                                 Name = FIELD (Name));
        }
        field(7; "Analysis Line Template Name"; Code[10])
        {
            Caption = 'Analysis Line Template Name';
            Editable = false;
            TableRelation = "Analysis Report Chart Setup"."Analysis Line Template Name" WHERE ("User ID" = FIELD ("User ID"),
                                                                                               "Analysis Area" = FIELD ("Analysis Area"),
                                                                                               Name = FIELD (Name));
        }
        field(8; "Analysis Column Template Name"; Code[10])
        {
            Caption = 'Analysis Column Template Name';
            Editable = false;
            TableRelation = "Analysis Report Chart Setup"."Analysis Column Template Name" WHERE ("User ID" = FIELD ("User ID"),
                                                                                                 "Analysis Area" = FIELD ("Analysis Area"),
                                                                                                 Name = FIELD (Name));
        }
        field(10; "Original Measure Name"; Text[111])
        {
            Caption = 'Original Measure Name';
            Editable = false;
        }
        field(15; "Measure Name"; Text[111])
        {
            Caption = 'Measure Name';
        }
        field(20; "Measure Value"; Text[30])
        {
            Caption = 'Measure Value';
            Editable = false;
        }
        field(40; "Chart Type"; Option)
        {
            Caption = 'Chart Type';
            OptionCaption = ' ,Line,StepLine,Column,StackedColumn';
            OptionMembers = " ",Line,StepLine,Column,StackedColumn;
        }
    }

    keys
    {
        key(Key1; "User ID", "Analysis Area", Name, "Analysis Line Line No.", "Analysis Column Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

