table 5064 "Interaction Template"
{
    Caption = 'Interaction Template';
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Interaction Group Code"; Code[10])
        {
            Caption = 'Interaction Group Code';
            NotBlank = true;
            TableRelation = "Interaction Group";
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Unit Cost (LCY)';
            MinValue = 0;
        }
        field(5; "Unit Duration (Min.)"; Decimal)
        {
            Caption = 'Unit Duration (Min.)';
            DecimalPlaces = 0 : 0;
            MinValue = 0;
        }
        field(6; "Information Flow"; Option)
        {
            Caption = 'Information Flow';
            OptionCaption = ' ,Outbound,Inbound';
            OptionMembers = " ",Outbound,Inbound;
        }
        field(7; "Initiated By"; Option)
        {
            Caption = 'Initiated By';
            OptionCaption = ' ,Us,Them';
            OptionMembers = " ",Us,Them;
        }
        field(8; "Attachment No."; Integer)
        {
            CalcFormula = Lookup ("Interaction Tmpl. Language"."Attachment No." WHERE ("Interaction Template Code" = FIELD (Code),
                                                                                      "Language Code" = FIELD ("Language Code (Default)")));
            Caption = 'Attachment No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(10; "Campaign Target"; Boolean)
        {
            Caption = 'Campaign Target';
        }
        field(11; "Campaign Response"; Boolean)
        {
            Caption = 'Campaign Response';
        }
        field(12; "Correspondence Type (Default)"; Option)
        {
            Caption = 'Correspondence Type (Default)';
            OptionCaption = ' ,Hard Copy,Email,Fax';
            OptionMembers = " ","Hard Copy",Email,Fax;
        }
        field(13; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(14; "No. of Interactions"; Integer)
        {
            CalcFormula = Count ("Interaction Log Entry" WHERE ("Interaction Template Code" = FIELD (Code),
                                                               Canceled = CONST (false),
                                                               Date = FIELD ("Date Filter"),
                                                               Postponed = CONST (false)));
            Caption = 'No. of Interactions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Interaction Log Entry"."Cost (LCY)" WHERE ("Interaction Template Code" = FIELD (Code),
                                                                          Canceled = CONST (false),
                                                                          Date = FIELD ("Date Filter"),
                                                                          Postponed = CONST (false)));
            Caption = 'Cost (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Duration (Min.)"; Decimal)
        {
            CalcFormula = Sum ("Interaction Log Entry"."Duration (Min.)" WHERE ("Interaction Template Code" = FIELD (Code),
                                                                               Canceled = CONST (false),
                                                                               Date = FIELD ("Date Filter"),
                                                                               Postponed = CONST (false)));
            Caption = 'Duration (Min.)';
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Language Code (Default)"; Code[10])
        {
            Caption = 'Language Code (Default)';
            TableRelation = "Interaction Tmpl. Language"."Language Code" WHERE ("Interaction Template Code" = FIELD (Code));
        }
        field(18; "Wizard Action"; Option)
        {
            Caption = 'Wizard Action';
            OptionCaption = ' ,Open,Import,Merge';
            OptionMembers = " ",Open,Import,Merge;
        }
        field(19; "Ignore Contact Corres. Type"; Boolean)
        {
            Caption = 'Ignore Contact Corres. Type';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Interaction Group Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description, "Information Flow", "Attachment No.")
        {
        }
    }
}

