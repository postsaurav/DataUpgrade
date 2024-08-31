table 8627 "Config. Setup"
{
    Caption = 'Config. Setup';
    ReplicateData = false;

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
        }
        field(7; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
        }
        field(8; "Phone No. 2"; Text[30])
        {
            Caption = 'Phone No. 2';
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
            AccessByPermission = TableData "Bank Account" = R;
            Caption = 'Bank Name';
        }
        field(13; "Bank Branch No."; Text[20])
        {
            AccessByPermission = TableData "Bank Account" = R;
            Caption = 'Bank Branch No.';
        }
        field(14; "Bank Account No."; Text[30])
        {
            AccessByPermission = TableData "Bank Account" = R;
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
        }
        field(27; "Ship-to Contact"; Text[100])
        {
            Caption = 'Ship-to Contact';
        }
        field(28; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(29; Picture; BLOB)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(30; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
        }
        field(31; County; Text[30])
        {
            Caption = 'County';
        }
        field(32; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
        }
        field(33; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
        }
        field(34; "E-Mail"; Text[80])
        {
            Caption = 'Email';
        }
        field(35; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
        }
        field(36; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
        }
        field(37; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
        }
        field(38; IBAN; Code[50])
        {
            Caption = 'IBAN';
        }
        field(39; "SWIFT Code"; Code[20])
        {
            Caption = 'SWIFT Code';
        }
        field(40; "Industrial Classification"; Text[30])
        {
            Caption = 'Industrial Classification';
        }
        field(500; "Logo Position on Documents"; Option)
        {
            Caption = 'Logo Position on Documents';
            OptionCaption = 'No Logo,Left,Center,Right';
            OptionMembers = "No Logo",Left,Center,Right;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
        }
        field(5791; "Check-Avail. Period Calc."; DateFormula)
        {
            Caption = 'Check-Avail. Period Calc.';
        }
        field(5792; "Check-Avail. Time Bucket"; Option)
        {
            Caption = 'Check-Avail. Time Bucket';
            OptionCaption = 'Day,Week,Month,Quarter,Year';
            OptionMembers = Day,Week,Month,Quarter,Year;
        }
        field(7600; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
        }
        field(7601; "Cal. Convergence Time Frame"; DateFormula)
        {
            Caption = 'Cal. Convergence Time Frame';
            InitValue = '1Y';
        }
        field(8600; "Package File Name"; Text[250])
        {
            Caption = 'Package File Name';
        }
        field(8601; "Package Code"; Code[20])
        {
            Caption = 'Package Code';
            Editable = false;
        }
        field(8602; "Language ID"; Integer)
        {
            Caption = 'Language ID';
            Editable = false;
            TableRelation = "Windows Language";
        }
        field(8603; "Product Version"; Text[80])
        {
            Caption = 'Product Version';
            Editable = false;
        }
        field(8604; "Package Name"; Text[50])
        {
            Caption = 'Package Name';
        }
        field(8605; "Your Profile Code"; Code[30])
        {
            Caption = 'Your Profile Code';
            TableRelation = "All Profile"."Profile ID";
        }
        field(8606; "Your Profile App ID"; Guid)
        {
            Caption = 'Your Profile App ID';
        }
        field(8607; "Your Profile Scope"; Option)
        {
            Caption = 'Your Profile Scope';
            OptionCaption = 'System,Tenant';
            OptionMembers = System,Tenant;
        }
        field(8608; "Package File"; BLOB)
        {
            Caption = 'Package File';
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

