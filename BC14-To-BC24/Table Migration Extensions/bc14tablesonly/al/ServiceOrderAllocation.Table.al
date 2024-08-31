table 5950 "Service Order Allocation"
{
    Caption = 'Service Order Allocation';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Nonactive,Active,Finished,Canceled,Reallocation Needed';
            OptionMembers = Nonactive,Active,Finished,Canceled,"Reallocation Needed";
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(4; "Allocation Date"; Date)
        {
            Caption = 'Allocation Date';
        }
        field(5; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = Resource;
        }
        field(6; "Resource Group No."; Code[20])
        {
            Caption = 'Resource Group No.';
            TableRelation = "Resource Group";
        }
        field(7; "Service Item Line No."; Integer)
        {
            Caption = 'Service Item Line No.';
            TableRelation = "Service Item Line"."Line No." WHERE ("Document Type" = FIELD ("Document Type"),
                                                                  "Document No." = FIELD ("Document No."));
        }
        field(8; "Allocated Hours"; Decimal)
        {
            Caption = 'Allocated Hours';
            DecimalPlaces = 0 : 5;
        }
        field(9; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
        }
        field(10; "Finishing Time"; Time)
        {
            Caption = 'Finishing Time';
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(12; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(13; "Service Item No."; Code[20])
        {
            Caption = 'Service Item No.';
            TableRelation = "Service Item";
        }
        field(14; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(15; "Service Item Description"; Text[100])
        {
            CalcFormula = Lookup ("Service Item Line".Description WHERE ("Document Type" = FIELD ("Document Type"),
                                                                        "Document No." = FIELD ("Document No."),
                                                                        "Line No." = FIELD ("Service Item Line No.")));
            Caption = 'Service Item Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Service Item Serial No."; Code[50])
        {
            Caption = 'Service Item Serial No.';
        }
        field(17; "Repair Status"; Code[20])
        {
            CalcFormula = Lookup ("Service Item Line"."Repair Status Code" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                                 "Document No." = FIELD ("Document No."),
                                                                                 "Line No." = FIELD ("Service Item Line No.")));
            Caption = 'Repair Status';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Service Started"; Boolean)
        {
            Caption = 'Service Started';
        }
        field(19; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            OptionCaption = 'Quote,Order';
            OptionMembers = Quote,"Order";
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; Status, "Document Type", "Document No.", "Service Item Line No.", "Allocation Date", "Starting Time", Posted)
        {
            SumIndexFields = "Allocated Hours";
        }
        key(Key3; "Document Type", "Document No.", Status, "Resource Group No.", "Allocation Date", "Starting Time", Posted)
        {
            SumIndexFields = "Allocated Hours";
        }
        key(Key4; Status, "Document Type", "Document No.", "Service Item Line No.", "Resource No.", "Allocation Date", "Starting Time", Posted)
        {
            SumIndexFields = "Allocated Hours";
        }
        key(Key5; "Document Type", "Document No.", "Service Item Line No.", "Allocation Date", "Starting Time", Posted)
        {
            SumIndexFields = "Allocated Hours";
        }
        key(Key6; "Resource No.", "Document Type", "Allocation Date", Status, Posted)
        {
        }
    }

    fieldgroups
    {
    }
}

