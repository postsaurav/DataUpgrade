table 5740 "Transfer Header"
{
    Caption = 'Transfer Header';
    DataCaptionFields = "No.";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Transfer-from Code"; Code[10])
        {
            Caption = 'Transfer-from Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(3; "Transfer-from Name"; Text[100])
        {
            Caption = 'Transfer-from Name';
        }
        field(4; "Transfer-from Name 2"; Text[50])
        {
            Caption = 'Transfer-from Name 2';
        }
        field(5; "Transfer-from Address"; Text[100])
        {
            Caption = 'Transfer-from Address';
        }
        field(6; "Transfer-from Address 2"; Text[50])
        {
            Caption = 'Transfer-from Address 2';
        }
        field(7; "Transfer-from Post Code"; Code[20])
        {
            Caption = 'Transfer-from Post Code';
            TableRelation = IF ("Trsf.-from Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Trsf.-from Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Trsf.-from Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; "Transfer-from City"; Text[30])
        {
            Caption = 'Transfer-from City';
            TableRelation = IF ("Trsf.-from Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Trsf.-from Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Trsf.-from Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(9; "Transfer-from County"; Text[30])
        {
            Caption = 'Transfer-from County';
        }
        field(10; "Trsf.-from Country/Region Code"; Code[10])
        {
            Caption = 'Trsf.-from Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(11; "Transfer-to Code"; Code[10])
        {
            Caption = 'Transfer-to Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(12; "Transfer-to Name"; Text[100])
        {
            Caption = 'Transfer-to Name';
        }
        field(13; "Transfer-to Name 2"; Text[50])
        {
            Caption = 'Transfer-to Name 2';
        }
        field(14; "Transfer-to Address"; Text[100])
        {
            Caption = 'Transfer-to Address';
        }
        field(15; "Transfer-to Address 2"; Text[50])
        {
            Caption = 'Transfer-to Address 2';
        }
        field(16; "Transfer-to Post Code"; Code[20])
        {
            Caption = 'Transfer-to Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(17; "Transfer-to City"; Text[30])
        {
            Caption = 'Transfer-to City';
            TableRelation = IF ("Trsf.-to Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Trsf.-to Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Trsf.-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(18; "Transfer-to County"; Text[30])
        {
            Caption = 'Transfer-to County';
        }
        field(19; "Trsf.-to Country/Region Code"; Code[10])
        {
            Caption = 'Trsf.-to Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(20; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(21; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(22; "Receipt Date"; Date)
        {
            Caption = 'Receipt Date';
        }
        field(23; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;
        }
        field(24; Comment; Boolean)
        {
            CalcFormula = Exist ("Inventory Comment Line" WHERE ("Document Type" = CONST ("Transfer Order"),
                                                                "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(26; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(27; "In-Transit Code"; Code[10])
        {
            Caption = 'In-Transit Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (true));
        }
        field(28; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(29; "Last Shipment No."; Code[20])
        {
            Caption = 'Last Shipment No.';
            Editable = false;
            TableRelation = "Transfer Shipment Header";
        }
        field(30; "Last Receipt No."; Code[20])
        {
            Caption = 'Last Receipt No.';
            Editable = false;
            TableRelation = "Transfer Receipt Header";
        }
        field(31; "Transfer-from Contact"; Text[100])
        {
            Caption = 'Transfer-from Contact';
        }
        field(32; "Transfer-to Contact"; Text[100])
        {
            Caption = 'Transfer-to Contact';
        }
        field(33; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(34; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(35; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code" = FIELD ("Shipping Agent Code"));
        }
        field(36; "Shipping Time"; DateFormula)
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Time';
        }
        field(37; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(47; "Transaction Type"; Code[10])
        {
            Caption = 'Transaction Type';
            TableRelation = "Transaction Type";
        }
        field(48; "Transport Method"; Code[10])
        {
            Caption = 'Transport Method';
            TableRelation = "Transport Method";
        }
        field(59; "Entry/Exit Point"; Code[10])
        {
            Caption = 'Entry/Exit Point';
            TableRelation = "Entry/Exit Point";
        }
        field(63; "Area"; Code[10])
        {
            Caption = 'Area';
            TableRelation = Area;
        }
        field(64; "Transaction Specification"; Code[10])
        {
            Caption = 'Transaction Specification';
            TableRelation = "Transaction Specification";
        }
        field(70; "Direct Transfer"; Boolean)
        {
            Caption = 'Direct Transfer';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(5750; "Shipping Advice"; Option)
        {
            Caption = 'Shipping Advice';
            OptionCaption = 'Partial,Complete';
            OptionMembers = Partial,Complete;
        }
        field(5751; "Posting from Whse. Ref."; Integer)
        {
            Caption = 'Posting from Whse. Ref.';
        }
        field(5752; "Completely Shipped"; Boolean)
        {
            CalcFormula = Min ("Transfer Line"."Completely Shipped" WHERE ("Document No." = FIELD ("No."),
                                                                          "Shipment Date" = FIELD ("Date Filter"),
                                                                          "Transfer-from Code" = FIELD ("Location Filter"),
                                                                          "Derived From Line No." = CONST (0)));
            Caption = 'Completely Shipped';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5753; "Completely Received"; Boolean)
        {
            CalcFormula = Min ("Transfer Line"."Completely Received" WHERE ("Document No." = FIELD ("No."),
                                                                           "Receipt Date" = FIELD ("Date Filter"),
                                                                           "Transfer-to Code" = FIELD ("Location Filter"),
                                                                           "Derived From Line No." = CONST (0)));
            Caption = 'Completely Received';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5754; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(5793; "Outbound Whse. Handling Time"; DateFormula)
        {
            Caption = 'Outbound Whse. Handling Time';
        }
        field(5794; "Inbound Whse. Handling Time"; DateFormula)
        {
            Caption = 'Inbound Whse. Handling Time';
        }
        field(5796; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(8000; "Has Shipped Lines"; Boolean)
        {
            CalcFormula = Exist ("Transfer Line" WHERE ("Document No." = FIELD ("No."),
                                                       "Quantity Shipped" = FILTER (> 0)));
            Caption = 'Has Shipped Lines';
            FieldClass = FlowField;
        }
        field(9000; "Assigned User ID"; Code[50])
        {
            Caption = 'Assigned User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Transfer-from Code", "Transfer-to Code", "Shipment Date", Status)
        {
        }
    }
}

