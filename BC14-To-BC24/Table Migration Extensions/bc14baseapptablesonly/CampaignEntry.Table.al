table 5072 "Campaign Entry"
{
    Caption = 'Campaign Entry';
    DataCaptionFields = "Campaign No.";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(6; "Segment No."; Code[20])
        {
            Caption = 'Segment No.';
            TableRelation = "Segment Header";
        }
        field(7; Canceled; Boolean)
        {
            BlankZero = true;
            Caption = 'Canceled';
        }
        field(8; "No. of Interactions"; Integer)
        {
            CalcFormula = Count ("Interaction Log Entry" WHERE ("Campaign No." = FIELD ("Campaign No."),
                                                               "Campaign Entry No." = FIELD ("Entry No."),
                                                               Canceled = FIELD (Canceled)));
            Caption = 'No. of Interactions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Interaction Log Entry"."Cost (LCY)" WHERE ("Campaign No." = FIELD ("Campaign No."),
                                                                          "Campaign Entry No." = FIELD ("Entry No."),
                                                                          Canceled = FIELD (Canceled)));
            Caption = 'Cost (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Duration (Min.)"; Decimal)
        {
            CalcFormula = Sum ("Interaction Log Entry"."Duration (Min.)" WHERE ("Campaign No." = FIELD ("Campaign No."),
                                                                               "Campaign Entry No." = FIELD ("Entry No."),
                                                                               Canceled = FIELD (Canceled)));
            Caption = 'Duration (Min.)';
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(13; "Register No."; Integer)
        {
            Caption = 'Register No.';
            TableRelation = "Logged Segment";
        }
        field(14; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Sales Qte.,Sales Blnkt. Ord,Sales Ord. Cnfrmn.,Sales Inv.,Sales Shpt. Note,Sales Cr. Memo,Sales Stmnt.,Sales Rmdr.,Serv. Ord. Create,Serv. Ord. Post,Purch.Qte.,Purch. Blnkt. Ord.,Purch. Ord.,Purch. Inv.,Purch. Rcpt.,Purch. Cr. Memo,Cover Sheet';
            OptionMembers = " ","Sales Qte.","Sales Blnkt. Ord","Sales Ord. Cnfrmn.","Sales Inv.","Sales Shpt. Note","Sales Cr. Memo","Sales Stmnt.","Sales Rmdr.","Serv. Ord. Create","Serv. Ord. Post","Purch.Qte.","Purch. Blnkt. Ord.","Purch. Ord.","Purch. Inv.","Purch. Rcpt.","Purch. Cr. Memo","Cover Sheet";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Campaign No.", Date, "Document Type")
        {
        }
        key(Key3; "Register No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Campaign No.", Description, Date, "Document Type")
        {
        }
    }
}

