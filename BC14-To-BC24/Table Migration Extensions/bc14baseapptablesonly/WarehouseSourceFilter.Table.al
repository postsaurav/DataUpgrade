table 5771 "Warehouse Source Filter"
{
    Caption = 'Warehouse Source Filter';

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Item No. Filter"; Code[100])
        {
            Caption = 'Item No. Filter';
            TableRelation = Item;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(4; "Variant Code Filter"; Code[100])
        {
            Caption = 'Variant Code Filter';
            TableRelation = "Item Variant".Code;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(5; "Unit of Measure Filter"; Code[100])
        {
            Caption = 'Unit of Measure Filter';
            TableRelation = "Unit of Measure";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(6; "Sell-to Customer No. Filter"; Code[100])
        {
            Caption = 'Sell-to Customer No. Filter';
            TableRelation = Customer;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(7; "Buy-from Vendor No. Filter"; Code[100])
        {
            Caption = 'Buy-from Vendor No. Filter';
            TableRelation = Vendor;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; "Customer No. Filter"; Code[100])
        {
            Caption = 'Customer No. Filter';
            TableRelation = Customer;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10; "Planned Delivery Date Filter"; Date)
        {
            Caption = 'Planned Delivery Date Filter';
            FieldClass = FlowFilter;
        }
        field(11; "Shipment Method Code Filter"; Code[100])
        {
            Caption = 'Shipment Method Code Filter';
            TableRelation = "Shipment Method";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(12; "Shipping Agent Code Filter"; Code[100])
        {
            Caption = 'Shipping Agent Code Filter';
            TableRelation = "Shipping Agent";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(13; "Shipping Advice Filter"; Code[100])
        {
            Caption = 'Shipping Advice Filter';
        }
        field(15; "Do Not Fill Qty. to Handle"; Boolean)
        {
            Caption = 'Do Not Fill Qty. to Handle';
        }
        field(16; "Show Filter Request"; Boolean)
        {
            Caption = 'Show Filter Request';
        }
        field(17; "Shipping Agent Service Filter"; Code[100])
        {
            Caption = 'Shipping Agent Service Filter';
            TableRelation = "Shipping Agent Services".Code;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(18; "In-Transit Code Filter"; Code[100])
        {
            Caption = 'In-Transit Code Filter';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (true));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(19; "Transfer-from Code Filter"; Code[100])
        {
            Caption = 'Transfer-from Code Filter';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(20; "Transfer-to Code Filter"; Code[100])
        {
            Caption = 'Transfer-to Code Filter';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(21; "Planned Shipment Date Filter"; Date)
        {
            Caption = 'Planned Shipment Date Filter';
            FieldClass = FlowFilter;
        }
        field(22; "Planned Receipt Date Filter"; Date)
        {
            Caption = 'Planned Receipt Date Filter';
            FieldClass = FlowFilter;
        }
        field(23; "Expected Receipt Date Filter"; Date)
        {
            Caption = 'Expected Receipt Date Filter';
            FieldClass = FlowFilter;
        }
        field(24; "Shipment Date Filter"; Date)
        {
            Caption = 'Shipment Date Filter';
            FieldClass = FlowFilter;
        }
        field(25; "Receipt Date Filter"; Date)
        {
            Caption = 'Receipt Date Filter';
            FieldClass = FlowFilter;
        }
        field(28; "Sales Shipment Date Filter"; Date)
        {
            Caption = 'Sales Shipment Date Filter';
            FieldClass = FlowFilter;
        }
        field(98; "Source No. Filter"; Code[100])
        {
            Caption = 'Source No. Filter';
        }
        field(99; "Source Document"; Code[250])
        {
            Caption = 'Source Document';
        }
        field(100; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Inbound,Outbound';
            OptionMembers = Inbound,Outbound;
        }
        field(101; "Sales Orders"; Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Sales Orders';
            InitValue = true;
        }
        field(102; "Sales Return Orders"; Boolean)
        {
            AccessByPermission = TableData "Return Receipt Header" = R;
            Caption = 'Sales Return Orders';
            InitValue = true;
        }
        field(103; "Purchase Orders"; Boolean)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Purchase Orders';
            InitValue = true;
        }
        field(104; "Purchase Return Orders"; Boolean)
        {
            AccessByPermission = TableData "Return Shipment Header" = R;
            Caption = 'Purchase Return Orders';
            InitValue = true;
        }
        field(105; "Inbound Transfers"; Boolean)
        {
            AccessByPermission = TableData "Transfer Header" = R;
            Caption = 'Inbound Transfers';
            InitValue = true;
        }
        field(106; "Outbound Transfers"; Boolean)
        {
            AccessByPermission = TableData "Transfer Header" = R;
            Caption = 'Outbound Transfers';
            InitValue = true;
        }
        field(108; Partial; Boolean)
        {
            Caption = 'Partial';
            InitValue = true;
        }
        field(109; Complete; Boolean)
        {
            Caption = 'Complete';
            InitValue = true;
        }
        field(110; "Service Orders"; Boolean)
        {
            Caption = 'Service Orders';
            InitValue = true;
        }
        field(7300; "Planned Delivery Date"; Text[250])
        {
            Caption = 'Planned Delivery Date';
        }
        field(7301; "Planned Shipment Date"; Text[250])
        {
            Caption = 'Planned Shipment Date';
        }
        field(7302; "Planned Receipt Date"; Text[250])
        {
            Caption = 'Planned Receipt Date';
        }
        field(7303; "Expected Receipt Date"; Text[250])
        {
            Caption = 'Expected Receipt Date';
        }
        field(7304; "Shipment Date"; Text[250])
        {
            Caption = 'Shipment Date';
        }
        field(7305; "Receipt Date"; Text[250])
        {
            Caption = 'Receipt Date';
        }
        field(7306; "Sales Shipment Date"; Text[250])
        {
            Caption = 'Sales Shipment Date';
        }
    }

    keys
    {
        key(Key1; Type, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

