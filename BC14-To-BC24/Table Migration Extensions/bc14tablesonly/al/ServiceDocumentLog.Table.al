table 5912 "Service Document Log"
{
    Caption = 'Service Document Log';
    ReplicateData = false;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = IF ("Document Type" = CONST (Quote)) "Service Header"."No." WHERE ("Document Type" = CONST (Quote))
            ELSE
            IF ("Document Type" = CONST (Order)) "Service Header"."No." WHERE ("Document Type" = CONST (Order))
            ELSE
            IF ("Document Type" = CONST (Invoice)) "Service Header"."No." WHERE ("Document Type" = CONST (Invoice))
            ELSE
            IF ("Document Type" = CONST ("Credit Memo")) "Service Header"."No." WHERE ("Document Type" = CONST ("Credit Memo"))
            ELSE
            IF ("Document Type" = CONST (Shipment)) "Service Shipment Header"
            ELSE
            IF ("Document Type" = CONST ("Posted Invoice")) "Service Invoice Header"
            ELSE
            IF ("Document Type" = CONST ("Posted Credit Memo")) "Service Cr.Memo Header";
            ValidateTableRelation = false;
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "Event No."; Integer)
        {
            Caption = 'Event No.';
        }
        field(4; "Service Item Line No."; Integer)
        {
            Caption = 'Service Item Line No.';
        }
        field(5; After; Text[50])
        {
            Caption = 'After';
        }
        field(6; Before; Text[50])
        {
            Caption = 'Before';
        }
        field(7; "Change Date"; Date)
        {
            Caption = 'Change Date';
        }
        field(8; "Change Time"; Time)
        {
            Caption = 'Change Time';
        }
        field(9; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(10; "Document Type"; Option)
        {
            Caption = 'Document Type';
            Editable = false;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Shipment,Posted Invoice,Posted Credit Memo';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo",Shipment,"Posted Invoice","Posted Credit Memo";
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Change Date", "Change Time")
        {
        }
    }

    fieldgroups
    {
    }
}

