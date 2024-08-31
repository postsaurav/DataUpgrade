table 740 "VAT Report Header"
{
    Caption = 'VAT Report Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "VAT Report Config. Code"; Option)
        {
            Caption = 'VAT Report Config. Code';
            Editable = true;
            OptionCaption = 'EC Sales List,VAT Return';
            OptionMembers = "EC Sales List","VAT Return";
            TableRelation = "VAT Reports Configuration"."VAT Report Type";
        }
        field(3; "VAT Report Type"; Option)
        {
            Caption = 'VAT Report Type';
            OptionCaption = 'Standard,Corrective,Supplementary';
            OptionMembers = Standard,Corrective,Supplementary;
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Released,Submitted,Accepted,Closed,Rejected,Canceled,Partially Accepted';
            OptionMembers = Open,Released,Submitted,Accepted,Closed,Rejected,Canceled,"Partially Accepted";
        }
        field(8; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(9; "Original Report No."; Code[20])
        {
            Caption = 'Original Report No.';
        }
        field(10; "Period Type"; Option)
        {
            Caption = 'Period Type';
            OptionCaption = ' ,,Month,Quarter,Year';
            OptionMembers = " ",,Month,Quarter,Year;
        }
        field(11; "Period No."; Integer)
        {
            Caption = 'Period No.';
            TableRelation = "Date Lookup Buffer"."Period No." WHERE ("Period Type" = FIELD ("Period Type"));
            ValidateTableRelation = false;
        }
        field(12; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(13; "Message Id"; Text[250])
        {
            Caption = 'Message Id';
        }
        field(14; "Statement Template Name"; Code[10])
        {
            Caption = 'Statement Template Name';
            TableRelation = "VAT Statement Template";
        }
        field(15; "Statement Name"; Code[10])
        {
            Caption = 'Statement Name';
            TableRelation = "VAT Statement Name".Name WHERE ("Statement Template Name" = FIELD ("Statement Template Name"));
        }
        field(16; "VAT Report Version"; Code[10])
        {
            Caption = 'VAT Report Version';
            TableRelation = "VAT Reports Configuration"."VAT Report Version" WHERE ("VAT Report Type" = FIELD ("VAT Report Config. Code"));
        }
        field(17; "Submitted By"; Guid)
        {
            Caption = 'Submitted By';
            DataClassification = EndUserPseudonymousIdentifiers;
            TableRelation = User."User Security ID";
        }
        field(18; "Submitted Date"; Date)
        {
            Caption = 'Submitted Date';
        }
        field(19; "Return Period No."; Code[20])
        {
            Caption = 'Return Period No.';
        }
        field(30; "Additional Information"; Code[50])
        {
            Caption = 'Additional Information';
        }
        field(31; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
            Editable = false;
        }
        field(100; "Amounts in Add. Rep. Currency"; Boolean)
        {
            Caption = 'Amounts in Add. Rep. Currency';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "VAT Report Config. Code", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

