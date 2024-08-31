table 79 "Company Information"
{
    Caption = 'Company Information';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(4; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(5; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(6; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(7; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(8; "Phone No. 2"; Text[30])
        {
            Caption = 'Phone No. 2';
            ExtendedDatatype = PhoneNo;
        }
        field(9; "Telex No."; Text[30])
        {
            Caption = 'Telex No.';
        }
        field(10; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(11; "Giro No."; Text[20])
        {
            Caption = 'Giro No.';
        }
        field(12; "Bank Name"; Text[100])
        {
            Caption = 'Bank Name';
        }
        field(13; "Bank Branch No."; Text[20])
        {
            Caption = 'Bank Branch No.';
        }
        field(14; "Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
        }
        field(15; "Payment Routing No."; Text[20])
        {
            Caption = 'Payment Routing No.';
        }
        field(17; "Customs Permit No."; Text[10])
        {
            Caption = 'Customs Permit No.';
        }
        field(18; "Customs Permit Date"; Date)
        {
            Caption = 'Customs Permit Date';
        }
        field(19; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(20; "Registration No."; Text[20])
        {
            Caption = 'Registration No.';
        }
        field(21; "Telex Answer Back"; Text[20])
        {
            Caption = 'Telex Answer Back';
        }
        field(22; "Ship-to Name"; Text[100])
        {
            Caption = 'Ship-to Name';
        }
        field(23; "Ship-to Name 2"; Text[50])
        {
            Caption = 'Ship-to Name 2';
        }
        field(24; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
        }
        field(25; "Ship-to Address 2"; Text[50])
        {
            Caption = 'Ship-to Address 2';
        }
        field(26; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
            TableRelation = IF ("Ship-to Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Ship-to Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Ship-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(27; "Ship-to Contact"; Text[100])
        {
            Caption = 'Ship-to Contact';
        }
        field(28; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE ("Use As In-Transit" = CONST (false));
        }
        field(29; Picture; BLOB)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(30; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code".Code
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".Code WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(31; County; Text[30])
        {
            Caption = 'County';
        }
        field(32; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            TableRelation = IF ("Ship-to Country/Region Code" = CONST ('')) "Post Code".Code
            ELSE
            IF ("Ship-to Country/Region Code" = FILTER (<> '')) "Post Code".Code WHERE ("Country/Region Code" = FIELD ("Ship-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(33; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
        }
        field(34; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(35; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(36; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(37; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(38; IBAN; Code[50])
        {
            Caption = 'IBAN';
        }
        field(39; "SWIFT Code"; Code[20])
        {
            Caption = 'SWIFT Code';
            TableRelation = "SWIFT Code";
            ValidateTableRelation = false;
        }
        field(40; "Industrial Classification"; Text[30])
        {
            Caption = 'Industrial Classification';
        }
        field(41; "IC Partner Code"; Code[20])
        {
            AccessByPermission = TableData "IC G/L Account" = R;
            Caption = 'IC Partner Code';
        }
        field(42; "IC Inbox Type"; Option)
        {
            AccessByPermission = TableData "IC G/L Account" = R;
            Caption = 'IC Inbox Type';
            InitValue = Database;
            OptionCaption = 'File Location,Database';
            OptionMembers = "File Location",Database;
        }
        field(43; "IC Inbox Details"; Text[250])
        {
            AccessByPermission = TableData "IC G/L Account" = R;
            Caption = 'IC Inbox Details';
        }
        field(44; "Auto. Send Transactions"; Boolean)
        {
            AccessByPermission = TableData "IC G/L Account" = R;
            Caption = 'Auto. Send Transactions';
        }
        field(46; "System Indicator"; Option)
        {
            Caption = 'System Indicator';
            OptionCaption = 'None,Custom Text,Company Information,Company,Database,Company+Database';
            OptionMembers = "None","Custom Text","Company Information",Company,Database,"Company+Database";
        }
        field(47; "Custom System Indicator Text"; Text[250])
        {
            Caption = 'Custom System Indicator Text';
        }
        field(48; "System Indicator Style"; Option)
        {
            Caption = 'System Indicator Style';
            OptionCaption = 'Standard,Accent1,Accent2,Accent3,Accent4,Accent5,Accent6,Accent7,Accent8,Accent9';
            OptionMembers = Standard,Accent1,Accent2,Accent3,Accent4,Accent5,Accent6,Accent7,Accent8,Accent9;
        }
        field(50; "Allow Blank Payment Info."; Boolean)
        {
            Caption = 'Allow Blank Payment Info.';
        }
        field(51; "Contact Person"; Text[50])
        {
            Caption = 'Contact Person';
        }
        field(90; GLN; Code[13])
        {
            Caption = 'GLN';
            Numeric = true;
        }
        field(95; "Use GLN in Electronic Document"; Boolean)
        {
            Caption = 'Use GLN in Electronic Documents';
        }
        field(96; "Picture - Last Mod. Date Time"; DateTime)
        {
            Caption = 'Picture - Last Mod. Date Time';
            Editable = false;
        }
        field(98; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(99; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            Editable = false;
        }
        field(100; "Demo Company"; Boolean)
        {
            Caption = 'Demo Company';
            Editable = false;
        }
        field(200; "Alternative Language Code"; Code[10])
        {
            Caption = 'Alternative Language Code';
            TableRelation = Language;
        }
        field(300; "Brand Color Value"; Code[10])
        {
            Caption = 'Brand Color Value';
        }
        field(301; "Brand Color Code"; Code[20])
        {
            Caption = 'Brand Color Code';
            TableRelation = "O365 Brand Color";
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center".Code;
            ValidateTableRelation = true;
        }
        field(5791; "Check-Avail. Period Calc."; DateFormula)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Check-Avail. Period Calc.';
        }
        field(5792; "Check-Avail. Time Bucket"; Option)
        {
            AccessByPermission = TableData Item = R;
            Caption = 'Check-Avail. Time Bucket';
            OptionCaption = 'Day,Week,Month,Quarter,Year';
            OptionMembers = Day,Week,Month,Quarter,Year;
        }
        field(7600; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            TableRelation = "Base Calendar";
        }
        field(7601; "Cal. Convergence Time Frame"; DateFormula)
        {
            AccessByPermission = TableData "Base Calendar" = R;
            Caption = 'Cal. Convergence Time Frame';
            InitValue = '1Y';
        }
        field(7602; "Show Chart On RoleCenter"; Boolean)
        {
            Caption = 'Show Chart On RoleCenter';
        }
        field(7603; "Sync with O365 Bus. profile"; Boolean)
        {
            Caption = 'Sync with O365 Bus. profile';
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
        field(10500; "Registered Name"; Text[50])
        {
            Caption = 'Registered Name';
        }
        field(10501; "Registered Name 2"; Text[50])
        {
            Caption = 'Registered Name 2';
        }
        field(10502; "Registered Address"; Text[50])
        {
            Caption = 'Registered Address';
        }
        field(10503; "Registered Address 2"; Text[50])
        {
            Caption = 'Registered Address 2';
        }
        field(10504; "Registered City"; Text[30])
        {
            Caption = 'Registered City';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10505; "Registered County"; Text[30])
        {
            Caption = 'Registered County';
        }
        field(10506; "Registered Post Code"; Code[20])
        {
            Caption = 'Registered Post Code';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10507; "Branch Number"; Text[3])
        {
            Caption = 'Branch Number';
            CharAllowed = '09';
        }
        field(10508; "Contact Name"; Text[35])
        {
            Caption = 'Contact Name';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

