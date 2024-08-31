table 5766 "Warehouse Activity Header"
{
    Caption = 'Warehouse Activity Header';

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Put-away,Pick,Movement,Invt. Put-away,Invt. Pick,Invt. Movement';
            OptionMembers = " ","Put-away",Pick,Movement,"Invt. Put-away","Invt. Pick","Invt. Movement";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
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
            Editable = false;
        }
        field(6; "Assignment Time"; Time)
        {
            Caption = 'Assignment Time';
            Editable = false;
        }
        field(7; "Sorting Method"; Option)
        {
            Caption = 'Sorting Method';
            OptionCaption = ' ,Item,Document,Shelf or Bin,Due Date,Ship-To,Bin Ranking,Action Type';
            OptionMembers = " ",Item,Document,"Shelf or Bin","Due Date","Ship-To","Bin Ranking","Action Type";
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(10; Comment; Boolean)
        {
            CalcFormula = Exist ("Warehouse Comment Line" WHERE ("Table Name" = CONST ("Whse. Activity Header"),
                                                                Type = FIELD (Type),
                                                                "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            Editable = false;
        }
        field(13; "No. of Lines"; Integer)
        {
            CalcFormula = Count ("Warehouse Activity Line" WHERE ("Activity Type" = FIELD (Type),
                                                                 "No." = FIELD ("No."),
                                                                 "Source Type" = FIELD ("Source Type Filter"),
                                                                 "Source Subtype" = FIELD ("Source Subtype Filter"),
                                                                 "Source No." = FIELD ("Source No. Filter"),
                                                                 "Location Code" = FIELD ("Location Filter")));
            Caption = 'No. of Lines';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Source Type Filter"; Integer)
        {
            Caption = 'Source Type Filter';
            FieldClass = FlowFilter;
        }
        field(15; "Source Subtype Filter"; Option)
        {
            Caption = 'Source Subtype Filter';
            FieldClass = FlowFilter;
            OptionCaption = '0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(16; "Source No. Filter"; Code[250])
        {
            Caption = 'Source No. Filter';
            FieldClass = FlowFilter;
        }
        field(17; "Location Filter"; Code[250])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
            ValidateTableRelation = false;
        }
        field(20; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(61; "Registering No."; Code[20])
        {
            Caption = 'Registering No.';
        }
        field(62; "Last Registering No."; Code[20])
        {
            Caption = 'Last Registering No.';
            Editable = false;
            TableRelation = IF (Type = CONST ("Put-away")) "Registered Whse. Activity Hdr."."No." WHERE (Type = CONST ("Put-away"))
            ELSE
            IF (Type = CONST (Pick)) "Registered Whse. Activity Hdr."."No." WHERE (Type = CONST (Pick))
            ELSE
            IF (Type = CONST (Movement)) "Registered Whse. Activity Hdr."."No." WHERE (Type = CONST (Movement));
        }
        field(63; "Registering No. Series"; Code[20])
        {
            Caption = 'Registering No. Series';
            TableRelation = "No. Series";
        }
        field(7303; "Date of Last Printing"; Date)
        {
            Caption = 'Date of Last Printing';
            Editable = false;
        }
        field(7304; "Time of Last Printing"; Time)
        {
            Caption = 'Time of Last Printing';
            Editable = false;
        }
        field(7305; "Breakbulk Filter"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Breakbulk Filter';
        }
        field(7306; "Source No."; Code[20])
        {
            Caption = 'Source No.';
        }
        field(7307; "Source Document"; Option)
        {
            BlankZero = true;
            Caption = 'Source Document';
            OptionCaption = ' ,Sales Order,,,Sales Return Order,Purchase Order,,,Purchase Return Order,Inbound Transfer,Outbound Transfer,Prod. Consumption,Prod. Output,,,,,,,,Assembly Consumption,Assembly Order';
            OptionMembers = " ","Sales Order",,,"Sales Return Order","Purchase Order",,,"Purchase Return Order","Inbound Transfer","Outbound Transfer","Prod. Consumption","Prod. Output",,,,,,,,"Assembly Consumption","Assembly Order";
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
        field(7314; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(7315; "External Document No.2"; Code[35])
        {
            Caption = 'External Document No.2';
        }
    }

    keys
    {
        key(Key1; Type, "No.")
        {
            Clustered = true;
        }
        key(Key2; "Location Code", "Shipment Date")
        {
        }
        key(Key3; "Source Document", "Source No.", "Location Code")
        {
        }
        key(Key4; "Assigned User ID")
        {
        }
    }

    fieldgroups
    {
    }
}

