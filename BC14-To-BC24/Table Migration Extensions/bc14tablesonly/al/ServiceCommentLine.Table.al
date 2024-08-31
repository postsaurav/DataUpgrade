table 5906 "Service Comment Line"
{
    Caption = 'Service Comment Line';
    DataCaptionFields = Type, "No.";

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'General,Fault,Resolution,Accessory,Internal,Service Item Loaner';
            OptionMembers = General,Fault,Resolution,Accessory,Internal,"Service Item Loaner";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            TableRelation = IF ("Table Name" = CONST ("Service Contract")) "Service Contract Header"."Contract No."
            ELSE
            IF ("Table Name" = CONST ("Service Header")) "Service Header"."No."
            ELSE
            IF ("Table Name" = CONST ("Service Item")) "Service Item"
            ELSE
            IF ("Table Name" = CONST (Loaner)) Loaner;
        }
        field(3; "Table Line No."; Integer)
        {
            Caption = 'Table Line No.';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
        }
        field(7; Date; Date)
        {
            Caption = 'Date';
        }
        field(8; "Table Subtype"; Option)
        {
            Caption = 'Table Subtype';
            OptionCaption = '0,1,2,3';
            OptionMembers = "0","1","2","3";
        }
        field(9; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionCaption = 'Service Contract,Service Header,Service Item,Loaner,Service Shipment Header,Service Invoice Header,Service Cr.Memo Header';
            OptionMembers = "Service Contract","Service Header","Service Item",Loaner,"Service Shipment Header","Service Invoice Header","Service Cr.Memo Header";
        }
    }

    keys
    {
        key(Key1; "Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

