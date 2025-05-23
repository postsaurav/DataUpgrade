table 7340 "Posted Invt. Put-away Header"
{
    Caption = 'Posted Invt. Put-away Header';

    fields
    {
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            NotBlank = true;
            TableRelation = Location;
        }
        field(4; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "Warehouse Employee" WHERE ("Location Code" = FIELD ("Location Code"));
        }
        field(5; "Assignment Date"; Date)
        {
            Caption = 'Assignment Date';
        }
        field(6; "Assignment Time"; Time)
        {
            Caption = 'Assignment Time';
        }
        field(8; "Registering Date"; Date)
        {
            Caption = 'Registering Date';
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; Comment; Boolean)
        {
            CalcFormula = Exist ("Warehouse Comment Line" WHERE ("Table Name" = CONST ("Posted Invt. Put-Away"),
                                                                Type = CONST (" "),
                                                                "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Invt. Put-away No."; Code[20])
        {
            Caption = 'Invt. Put-away No.';
        }
        field(12; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            Editable = false;
        }
        field(20; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(7306; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST (120)) "Purch. Rcpt. Header" WHERE ("No." = FIELD ("Source No."))
            ELSE
            IF ("Source Type" = CONST (110)) "Sales Shipment Header" WHERE ("No." = FIELD ("Source No."))
            ELSE
            IF ("Source Type" = CONST (6650)) "Return Shipment Header" WHERE ("No." = FIELD ("Source No."))
            ELSE
            IF ("Source Type" = CONST (6660)) "Return Receipt Header" WHERE ("No." = FIELD ("Source No."))
            ELSE
            IF ("Source Type" = CONST (5744)) "Transfer Shipment Header" WHERE ("No." = FIELD ("Source No."))
            ELSE
            IF ("Source Type" = CONST (5746)) "Transfer Receipt Header" WHERE ("No." = FIELD ("Source No."))
            ELSE
            IF ("Source Type" = CONST (5405)) "Production Order"."No." WHERE (Status = FILTER (Released | Finished));
        }
        field(7307; "Source Document"; Option)
        {
            BlankZero = true;
            Caption = 'Source Document';
            OptionCaption = ' ,Sales Order,,,Sales Return Order,Purchase Order,,,Purchase Return Order,Inbound Transfer,Outbound Transfer,Prod. Consumption,Prod. Output';
            OptionMembers = " ","Sales Order",,,"Sales Return Order","Purchase Order",,,"Purchase Return Order","Inbound Transfer","Outbound Transfer","Prod. Consumption","Prod. Output";
        }
        field(7308; "Source Type"; Integer)
        {
            Caption = 'Source Type';
        }
        field(7309; "Source Subtype"; Option)
        {
            Caption = 'Source Subtype';
            Editable = false;
            OptionCaption = '0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(7310; "Destination Type"; Option)
        {
            Caption = 'Destination Type';
            OptionCaption = ' ,Customer,Vendor,Location,Item,Family,Sales Order';
            OptionMembers = " ",Customer,Vendor,Location,Item,Family,"Sales Order";
        }
        field(7311; "Destination No."; Code[20])
        {
            Caption = 'Destination No.';
            TableRelation = IF ("Destination Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Destination Type" = CONST (Customer)) Customer
            ELSE
            IF ("Destination Type" = CONST (Location)) Location
            ELSE
            IF ("Destination Type" = CONST (Item)) Item
            ELSE
            IF ("Destination Type" = CONST (Family)) Family
            ELSE
            IF ("Destination Type" = CONST ("Sales Order")) "Sales Header"."No." WHERE ("Document Type" = CONST (Order));
        }
        field(7312; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(7313; "Expected Receipt Date"; Date)
        {
            Caption = 'Expected Receipt Date';
        }
        field(7315; "External Document No.2"; Code[35])
        {
            Caption = 'External Document No.2';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Invt. Put-away No.")
        {
        }
        key(Key3; "Location Code")
        {
        }
        key(Key4; "Posting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

