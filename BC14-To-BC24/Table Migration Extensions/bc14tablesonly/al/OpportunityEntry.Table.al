table 5093 "Opportunity Entry"
{
    Caption = 'Opportunity Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Opportunity No."; Code[20])
        {
            Caption = 'Opportunity No.';
            TableRelation = Opportunity;
        }
        field(3; "Sales Cycle Code"; Code[10])
        {
            Caption = 'Sales Cycle Code';
            TableRelation = "Sales Cycle";
        }
        field(4; "Sales Cycle Stage"; Integer)
        {
            Caption = 'Sales Cycle Stage';
            MinValue = 1;
            TableRelation = "Sales Cycle Stage".Stage WHERE ("Sales Cycle Code" = FIELD ("Sales Cycle Code"));
        }
        field(5; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = Contact;
        }
        field(6; "Contact Company No."; Code[20])
        {
            Caption = 'Contact Company No.';
            TableRelation = Contact WHERE (Type = CONST (Company));
        }
        field(7; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(8; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(9; "Date of Change"; Date)
        {
            Caption = 'Date of Change';
        }
        field(10; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(11; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
        }
        field(12; "Days Open"; Decimal)
        {
            Caption = 'Days Open';
            DecimalPlaces = 0 : 0;
            MinValue = 0;
        }
        field(13; "Action Taken"; Option)
        {
            Caption = 'Action Taken';
            OptionCaption = ' ,Next,Previous,Updated,Jumped,Won,Lost';
            OptionMembers = " ",Next,Previous,Updated,Jumped,Won,Lost;
        }
        field(14; "Estimated Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Estimated Value (LCY)';
        }
        field(15; "Calcd. Current Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Calcd. Current Value (LCY)';
        }
        field(16; "Completed %"; Decimal)
        {
            Caption = 'Completed %';
            DecimalPlaces = 0 : 0;
        }
        field(17; "Chances of Success %"; Decimal)
        {
            Caption = 'Chances of Success %';
            DecimalPlaces = 0 : 0;
            MaxValue = 100;
        }
        field(18; "Probability %"; Decimal)
        {
            Caption = 'Probability %';
            DecimalPlaces = 0 : 0;
        }
        field(19; "Close Opportunity Code"; Code[10])
        {
            Caption = 'Close Opportunity Code';
            TableRelation = IF ("Action Taken" = CONST (Won)) "Close Opportunity Code" WHERE (Type = CONST (Won))
            ELSE
            IF ("Action Taken" = CONST (Lost)) "Close Opportunity Code" WHERE (Type = CONST (Lost));
        }
        field(20; "Previous Sales Cycle Stage"; Integer)
        {
            Caption = 'Previous Sales Cycle Stage';
            TableRelation = "Sales Cycle Stage".Stage WHERE ("Sales Cycle Code" = FIELD ("Sales Cycle Code"));
        }
        field(21; "Estimated Close Date"; Date)
        {
            Caption = 'Estimated Close Date';
        }
        field(9501; "Wizard Step"; Option)
        {
            Caption = 'Wizard Step';
            Editable = false;
            OptionCaption = ' ,1,2,3,4,5,6';
            OptionMembers = " ","1","2","3","4","5","6";
        }
        field(9502; "Cancel Old To Do"; Boolean)
        {
            Caption = 'Cancel Old Task';
        }
        field(9503; "Action Type"; Option)
        {
            Caption = 'Action Type';
            OptionCaption = ' ,First,Next,Previous,Skip,Update,Jump';
            OptionMembers = " ",First,Next,Previous,Skip,Update,Jump;
        }
        field(9504; "Sales Cycle Stage Description"; Text[100])
        {
            Caption = 'Sales Cycle Stage Description';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Opportunity No.")
        {
        }
        key(Key3; "Contact Company No.", "Contact No.", Active)
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)";
        }
        key(Key4; "Campaign No.", Active)
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)";
        }
        key(Key5; Active, "Sales Cycle Code", "Sales Cycle Stage", "Estimated Close Date")
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)", "Days Open";
        }
        key(Key6; Active, "Opportunity No.")
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)", "Days Open";
        }
        key(Key7; Active, "Salesperson Code", "Date of Change")
        {
            SumIndexFields = "Estimated Value (LCY)", "Calcd. Current Value (LCY)";
        }
        key(Key8; "Close Opportunity Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Opportunity No.", Active)
        {
        }
        fieldgroup(Brick; "Opportunity No.", "Sales Cycle Stage Description")
        {
        }
    }
}

