table 7335 "Bin Template"
{
    Caption = 'Bin Template';
    DataCaptionFields = "Code", Description;
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            NotBlank = true;
            TableRelation = Location WHERE ("Bin Mandatory" = CONST (true));
        }
        field(5; "Bin Description"; Text[50])
        {
            Caption = 'Bin Description';
        }
        field(6; "Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = Zone.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(10; "Bin Type Code"; Code[10])
        {
            Caption = 'Bin Type Code';
            TableRelation = "Bin Type";
        }
        field(11; "Warehouse Class Code"; Code[10])
        {
            Caption = 'Warehouse Class Code';
            TableRelation = "Warehouse Class";
        }
        field(12; "Block Movement"; Option)
        {
            Caption = 'Block Movement';
            OptionCaption = ' ,Inbound,Outbound,All';
            OptionMembers = " ",Inbound,Outbound,All;
        }
        field(20; "Special Equipment Code"; Code[10])
        {
            Caption = 'Special Equipment Code';
            TableRelation = "Special Equipment";
        }
        field(21; "Bin Ranking"; Integer)
        {
            Caption = 'Bin Ranking';
        }
        field(22; "Maximum Cubage"; Decimal)
        {
            BlankZero = true;
            Caption = 'Maximum Cubage';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(23; "Maximum Weight"; Decimal)
        {
            BlankZero = true;
            Caption = 'Maximum Weight';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(24; Dedicated; Boolean)
        {
            Caption = 'Dedicated';
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

