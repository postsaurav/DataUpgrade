table 5770 "Warehouse Comment Line"
{
    Caption = 'Warehouse Comment Line';

    fields
    {
        field(1; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionCaption = 'Whse. Activity Header,Whse. Receipt,Whse. Shipment,Internal Put-away,Internal Pick,Rgstrd. Whse. Activity Header,Posted Whse. Receipt,Posted Whse. Shipment,Posted Invt. Put-Away,Posted Invt. Pick,Registered Invt. Movement,Internal Movement';
            OptionMembers = "Whse. Activity Header","Whse. Receipt","Whse. Shipment","Internal Put-away","Internal Pick","Rgstrd. Whse. Activity Header","Posted Whse. Receipt","Posted Whse. Shipment","Posted Invt. Put-Away","Posted Invt. Pick","Registered Invt. Movement","Internal Movement";
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Put-away,Pick,Movement,Invt. Put-away,Invt. Pick,Invt. Movement';
            OptionMembers = " ","Put-away",Pick,Movement,"Invt. Put-away","Invt. Pick","Invt. Movement";
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; Date; Date)
        {
            Caption = 'Date';
        }
        field(6; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(7; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Table Name", Type, "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

