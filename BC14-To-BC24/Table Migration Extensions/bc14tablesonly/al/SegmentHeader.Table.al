table 5076 "Segment Header"
{
    Caption = 'Segment Header';
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
        field(3; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(4; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(5; "Correspondence Type (Default)"; Option)
        {
            Caption = 'Correspondence Type (Default)';
            OptionCaption = ' ,Hard Copy,Email,Fax';
            OptionMembers = " ","Hard Copy",Email,Fax;
        }
        field(6; "Interaction Template Code"; Code[10])
        {
            Caption = 'Interaction Template Code';
            TableRelation = "Interaction Template";
        }
        field(7; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Unit Cost (LCY)';
            MinValue = 0;
        }
        field(8; "Unit Duration (Min.)"; Decimal)
        {
            Caption = 'Unit Duration (Min.)';
            DecimalPlaces = 0 : 0;
            MinValue = 0;
        }
        field(9; "Attachment No."; Integer)
        {
            CalcFormula = Lookup ("Segment Interaction Language"."Attachment No." WHERE ("Segment No." = FIELD ("No."),
                                                                                        "Segment Line No." = CONST (0),
                                                                                        "Language Code" = FIELD ("Language Code (Default)")));
            Caption = 'Attachment No.';
            FieldClass = FlowField;
        }
        field(10; Date; Date)
        {
            Caption = 'Date';
        }
        field(11; "Campaign Target"; Boolean)
        {
            Caption = 'Campaign Target';
        }
        field(12; "Information Flow"; Option)
        {
            BlankZero = true;
            Caption = 'Information Flow';
            OptionCaption = ' ,Outbound,Inbound';
            OptionMembers = " ",Outbound,Inbound;
        }
        field(13; "Initiated By"; Option)
        {
            BlankZero = true;
            Caption = 'Initiated By';
            OptionCaption = ' ,Us,Them';
            OptionMembers = " ",Us,Them;
        }
        field(14; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Campaign Response"; Boolean)
        {
            Caption = 'Campaign Response';
        }
        field(16; "No. of Lines"; Integer)
        {
            CalcFormula = Count ("Segment Line" WHERE ("Segment No." = FIELD ("No.")));
            Caption = 'No. of Lines';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Segment Line"."Cost (LCY)" WHERE ("Segment No." = FIELD ("No.")));
            Caption = 'Cost (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Duration (Min.)"; Decimal)
        {
            CalcFormula = Sum ("Segment Line"."Duration (Min.)" WHERE ("Segment No." = FIELD ("No.")));
            Caption = 'Duration (Min.)';
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Language Code (Default)"; Code[10])
        {
            Caption = 'Language Code (Default)';
            TableRelation = Language;
        }
        field(20; "Interaction Group Code"; Code[10])
        {
            Caption = 'Interaction Group Code';
            TableRelation = "Interaction Group";
        }
        field(21; "No. of Criteria Actions"; Integer)
        {
            CalcFormula = Count ("Segment Criteria Line" WHERE ("Segment No." = FIELD ("No."),
                                                               Type = CONST (Action)));
            Caption = 'No. of Criteria Actions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Send Word Docs. as Attmt."; Boolean)
        {
            Caption = 'Send Word Docs. as Attmt.';
        }
        field(23; "Ignore Contact Corres. Type"; Boolean)
        {
            Caption = 'Ignore Contact Corres. Type';
        }
        field(24; "Subject (Default)"; Text[100])
        {
            Caption = 'Subject (Default)';
        }
        field(25; "Campaign Description"; Text[100])
        {
            CalcFormula = Lookup (Campaign.Description WHERE ("No." = FIELD ("Campaign No.")));
            Caption = 'Campaign Description';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Salesperson Code")
        {
        }
        key(Key3; "Campaign No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, "Campaign No.")
        {
        }
    }
}

