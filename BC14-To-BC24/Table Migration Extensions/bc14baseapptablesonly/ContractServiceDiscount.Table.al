table 5972 "Contract/Service Discount"
{
    Caption = 'Contract/Service Discount';
    DataCaptionFields = "Contract Type", "Contract No.";

    fields
    {
        field(1; "Contract Type"; Option)
        {
            Caption = 'Contract Type';
            OptionCaption = 'Quote,Contract,Template';
            OptionMembers = Quote,Contract,Template;
        }
        field(2; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            TableRelation = IF ("Contract Type" = CONST (Template)) "Service Contract Template"."No."
            ELSE
            IF ("Contract Type" = CONST (Contract)) "Service Contract Header"."Contract No." WHERE ("Contract Type" = CONST (Contract))
            ELSE
            IF ("Contract Type" = CONST (Quote)) "Service Contract Header"."Contract No." WHERE ("Contract Type" = CONST (Quote));
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Service Item Group,Resource Group,Cost';
            OptionMembers = "Service Item Group","Resource Group",Cost;
        }
        field(5; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST ("Service Item Group")) "Service Item Group".Code
            ELSE
            IF (Type = CONST ("Resource Group")) "Resource Group"."No."
            ELSE
            IF (Type = CONST (Cost)) "Service Cost".Code;
            //This property is currently not supported
            //TestTableRelation = true;
        }
        field(6; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(7; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Contract Type", "Contract No.", Type, "No.", "Starting Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

