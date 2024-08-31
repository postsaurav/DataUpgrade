table 14 Location
{
    Caption = 'Location';
    DataCaptionFields = "Code", Name;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(130; "Default Bin Code"; Code[20])
        {
            Caption = 'Default Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(5700; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5701; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(5702; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(5703; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(5704; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(5705; "Phone No. 2"; Text[30])
        {
            Caption = 'Phone No. 2';
            ExtendedDatatype = PhoneNo;
        }
        field(5706; "Telex No."; Text[30])
        {
            Caption = 'Telex No.';
        }
        field(5707; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(5713; Contact; Text[100])
        {
            Caption = 'Contact';
        }
        field(5714; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(5715; County; Text[30])
        {
            Caption = 'County';
        }
        field(5718; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(5719; "Home Page"; Text[90])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(5720; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(5724; "Use As In-Transit"; Boolean)
        {
            AccessByPermission = TableData "Transfer Header" = R;
            Caption = 'Use As In-Transit';
        }
        field(5726; "Require Put-away"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Require Put-away';
        }
        field(5727; "Require Pick"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Require Pick';
        }
        field(5728; "Cross-Dock Due Date Calc."; DateFormula)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Cross-Dock Due Date Calc.';
        }
        field(5729; "Use Cross-Docking"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Use Cross-Docking';
        }
        field(5730; "Require Receive"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Receipt Header" = R;
            Caption = 'Require Receive';
        }
        field(5731; "Require Shipment"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Shipment Header" = R;
            Caption = 'Require Shipment';
        }
        field(5732; "Bin Mandatory"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Bin Mandatory';
        }
        field(5733; "Directed Put-away and Pick"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Directed Put-away and Pick';
        }
        field(5734; "Default Bin Selection"; Option)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Default Bin Selection';
            OptionCaption = ' ,Fixed Bin,Last-Used Bin';
            OptionMembers = " ","Fixed Bin","Last-Used Bin";
        }
        field(5790; "Outbound Whse. Handling Time"; DateFormula)
        {
            AccessByPermission = TableData Location = R;
            Caption = 'Outbound Whse. Handling Time';
        }
        field(5791; "Inbound Whse. Handling Time"; DateFormula)
        {
            AccessByPermission = TableData Location = R;
            Caption = 'Inbound Whse. Handling Time';
        }
        field(7305; "Put-away Template Code"; Code[10])
        {
            Caption = 'Put-away Template Code';
            TableRelation = "Put-away Template Header";
        }
        field(7306; "Use Put-away Worksheet"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Use Put-away Worksheet';
        }
        field(7307; "Pick According to FEFO"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Pick According to FEFO';
        }
        field(7308; "Allow Breakbulk"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Allow Breakbulk';
        }
        field(7309; "Bin Capacity Policy"; Option)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Bin Capacity Policy';
            OptionCaption = 'Never Check Capacity,Allow More Than Max. Capacity,Prohibit More Than Max. Cap.';
            OptionMembers = "Never Check Capacity","Allow More Than Max. Capacity","Prohibit More Than Max. Cap.";
        }
        field(7313; "Open Shop Floor Bin Code"; Code[20])
        {
            Caption = 'Open Shop Floor Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7314; "To-Production Bin Code"; Code[20])
        {
            Caption = 'To-Production Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7315; "From-Production Bin Code"; Code[20])
        {
            Caption = 'From-Production Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7317; "Adjustment Bin Code"; Code[20])
        {
            Caption = 'Adjustment Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7319; "Always Create Put-away Line"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Always Create Put-away Line';
        }
        field(7320; "Always Create Pick Line"; Boolean)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Always Create Pick Line';
        }
        field(7321; "Special Equipment"; Option)
        {
            AccessByPermission = TableData "Warehouse Source Filter" = R;
            Caption = 'Special Equipment';
            OptionCaption = ' ,According to Bin,According to SKU/Item';
            OptionMembers = " ","According to Bin","According to SKU/Item";
        }
        field(7323; "Receipt Bin Code"; Code[20])
        {
            Caption = 'Receipt Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7325; "Shipment Bin Code"; Code[20])
        {
            Caption = 'Shipment Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7326; "Cross-Dock Bin Code"; Code[20])
        {
            Caption = 'Cross-Dock Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7330; "To-Assembly Bin Code"; Code[20])
        {
            Caption = 'To-Assembly Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7331; "From-Assembly Bin Code"; Code[20])
        {
            Caption = 'From-Assembly Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7332; "Asm.-to-Order Shpt. Bin Code"; Code[20])
        {
            Caption = 'Asm.-to-Order Shpt. Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD (Code));
        }
        field(7600; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            TableRelation = "Base Calendar";
        }
        field(7700; "Use ADCS"; Boolean)
        {
            AccessByPermission = TableData "Miniform Header" = R;
            Caption = 'Use ADCS';
        }
        field(50000; Shop; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Name)
        {
        }
        key(Key3; "Use As In-Transit", "Bin Mandatory")
        {
        }
    }

    fieldgroups
    {
    }
}

