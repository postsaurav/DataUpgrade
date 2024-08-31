table 5092 Opportunity
{
    Caption = 'Opportunity';
    DataCaptionFields = "No.", Description;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(4; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
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
        field(7; "Sales Cycle Code"; Code[10])
        {
            Caption = 'Sales Cycle Code';
            TableRelation = "Sales Cycle";
        }
        field(8; "Sales Document No."; Code[20])
        {
            Caption = 'Sales Document No.';
            TableRelation = IF ("Sales Document Type" = CONST (Quote)) "Sales Header"."No." WHERE ("Document Type" = CONST (Quote),
                                                                                                "Sell-to Contact No." = FIELD ("Contact No."))
            ELSE
            IF ("Sales Document Type" = CONST (Order)) "Sales Header"."No." WHERE ("Document Type" = CONST (Order),
                                                                                                                                                                         "Sell-to Contact No." = FIELD ("Contact No."))
            ELSE
            IF ("Sales Document Type" = CONST ("Posted Invoice")) "Sales Invoice Header"."No." WHERE ("Sell-to Contact No." = FIELD ("Contact No."));
        }
        field(9; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Not Started,In Progress,Won,Lost';
            OptionMembers = "Not Started","In Progress",Won,Lost;
        }
        field(11; Priority; Option)
        {
            Caption = 'Priority';
            InitValue = Normal;
            OptionCaption = 'Low,Normal,High';
            OptionMembers = Low,Normal,High;
        }
        field(12; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = false;
        }
        field(13; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
            Editable = false;
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(16; Comment; Boolean)
        {
            CalcFormula = Exist ("Rlshp. Mgt. Comment Line" WHERE ("Table Name" = CONST (Opportunity),
                                                                  "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Current Sales Cycle Stage"; Integer)
        {
            BlankZero = true;
            CalcFormula = Lookup ("Opportunity Entry"."Sales Cycle Stage" WHERE ("Opportunity No." = FIELD ("No."),
                                                                                Active = CONST (true)));
            Caption = 'Current Sales Cycle Stage';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Estimated Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Opportunity Entry"."Estimated Value (LCY)" WHERE ("Opportunity No." = FIELD ("No."),
                                                                                 Active = CONST (true)));
            Caption = 'Estimated Value (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Probability %"; Decimal)
        {
            CalcFormula = Lookup ("Opportunity Entry"."Probability %" WHERE ("Opportunity No." = FIELD ("No."),
                                                                            Active = CONST (true)));
            Caption = 'Probability %';
            DecimalPlaces = 1 : 1;
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Calcd. Current Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Opportunity Entry"."Calcd. Current Value (LCY)" WHERE ("Opportunity No." = FIELD ("No."),
                                                                                      Active = CONST (true)));
            Caption = 'Calcd. Current Value (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Chances of Success %"; Decimal)
        {
            CalcFormula = Lookup ("Opportunity Entry"."Chances of Success %" WHERE ("Opportunity No." = FIELD ("No."),
                                                                                   Active = CONST (true)));
            Caption = 'Chances of Success %';
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Completed %"; Decimal)
        {
            CalcFormula = Lookup ("Opportunity Entry"."Completed %" WHERE ("Opportunity No." = FIELD ("No."),
                                                                          Active = CONST (true)));
            Caption = 'Completed %';
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Contact Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Contact Company Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact Company No.")));
            Caption = 'Contact Company Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Salesperson Name"; Text[50])
        {
            CalcFormula = Lookup ("Salesperson/Purchaser".Name WHERE (Code = FIELD ("Salesperson Code")));
            Caption = 'Salesperson Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Campaign Description"; Text[100])
        {
            CalcFormula = Lookup (Campaign.Description WHERE ("No." = FIELD ("Campaign No.")));
            Caption = 'Campaign Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "Segment No."; Code[20])
        {
            Caption = 'Segment No.';
            TableRelation = "Segment Header";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(28; "Estimated Closing Date"; Date)
        {
            CalcFormula = Lookup ("Opportunity Entry"."Estimated Close Date" WHERE ("Opportunity No." = FIELD ("No."),
                                                                                   Active = CONST (true)));
            Caption = 'Estimated Closing Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Sales Document Type"; Option)
        {
            Caption = 'Sales Document Type';
            OptionCaption = ' ,Quote,Order,Posted Invoice';
            OptionMembers = " ",Quote,"Order","Posted Invoice";
        }
        field(30; "No. of Interactions"; Integer)
        {
            CalcFormula = Count ("Interaction Log Entry" WHERE ("Opportunity No." = FIELD (FILTER ("No.")),
                                                               Canceled = CONST (false),
                                                               Postponed = CONST (false)));
            Caption = 'No. of Interactions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9501; "Wizard Step"; Option)
        {
            Caption = 'Wizard Step';
            Editable = false;
            OptionCaption = ' ,1,2,3,4,5,6';
            OptionMembers = " ","1","2","3","4","5","6";
        }
        field(9502; "Activate First Stage"; Boolean)
        {
            Caption = 'Activate First Stage';
        }
        field(9503; "Segment Description"; Text[100])
        {
            Caption = 'Segment Description';
        }
        field(9504; "Wizard Estimated Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Wizard Estimated Value (LCY)';
        }
        field(9505; "Wizard Chances of Success %"; Decimal)
        {
            Caption = 'Wizard Chances of Success %';
            DecimalPlaces = 0 : 0;
        }
        field(9506; "Wizard Estimated Closing Date"; Date)
        {
            Caption = 'Wizard Estimated Closing Date';
        }
        field(9507; "Wizard Contact Name"; Text[100])
        {
            Caption = 'Wizard Contact Name';
        }
        field(9508; "Wizard Campaign Description"; Text[100])
        {
            Caption = 'Wizard Campaign Description';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Contact Company No.", "Contact No.", Closed)
        {
        }
        key(Key3; "Salesperson Code", Closed)
        {
        }
        key(Key4; "Campaign No.", Closed)
        {
        }
        key(Key5; "Segment No.", Closed)
        {
        }
        key(Key6; "Sales Document Type", "Sales Document No.")
        {
        }
        key(Key7; Description)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "Creation Date", Status)
        {
        }
    }
}

