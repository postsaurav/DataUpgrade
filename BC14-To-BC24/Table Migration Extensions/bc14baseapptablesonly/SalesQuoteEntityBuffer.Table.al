table 5505 "Sales Quote Entity Buffer"
{
    Caption = 'Sales Quote Entity Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
            InitValue = Invoice;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = Customer;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(4; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = Customer;
        }
        field(5; "Bill-to Name"; Text[100])
        {
            Caption = 'Bill-to Name';
            DataClassification = CustomerContent;
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
        }
        field(7; "Bill-to Address"; Text[100])
        {
            Caption = 'Bill-to Address';
            DataClassification = CustomerContent;
        }
        field(8; "Bill-to Address 2"; Text[50])
        {
            Caption = 'Bill-to Address 2';
            DataClassification = CustomerContent;
        }
        field(9; "Bill-to City"; Text[30])
        {
            Caption = 'Bill-to City';
            DataClassification = CustomerContent;
            TableRelation = IF ("Bill-to Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Bill-to Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Bill-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10; "Bill-to Contact"; Text[100])
        {
            Caption = 'Bill-to Contact';
            DataClassification = CustomerContent;
        }
        field(11; "Your Reference"; Text[35])
        {
            Caption = 'Your Reference';
            DataClassification = CustomerContent;
        }
        field(12; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            DataClassification = CustomerContent;
        }
        field(13; "Ship-to Name"; Text[100])
        {
            Caption = 'Ship-to Name';
            DataClassification = CustomerContent;
        }
        field(15; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
            DataClassification = CustomerContent;
        }
        field(16; "Ship-to Address 2"; Text[50])
        {
            Caption = 'Ship-to Address 2';
            DataClassification = CustomerContent;
        }
        field(17; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
            DataClassification = CustomerContent;
            TableRelation = IF ("Ship-to Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Ship-to Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Ship-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(18; "Ship-to Contact"; Text[100])
        {
            Caption = 'Ship-to Contact';
            DataClassification = CustomerContent;
        }
        field(20; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(23; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            DataClassification = CustomerContent;
            TableRelation = "Payment Terms";
        }
        field(24; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(27; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
        }
        field(31; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Customer Posting Group";
        }
        field(32; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
            TableRelation = Currency;
        }
        field(35; "Prices Including VAT"; Boolean)
        {
            Caption = 'Prices Including VAT';
            DataClassification = CustomerContent;
        }
        field(43; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }
        field(56; "Recalculate Invoice Disc."; Boolean)
        {
            CalcFormula = Exist ("Sales Line" WHERE ("Document Type" = CONST (Invoice),
                                                    "Document No." = FIELD ("No."),
                                                    "Recalculate Invoice Disc." = CONST (true)));
            Caption = 'Recalculate Invoice Disc.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(61; "Amount Including VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Including VAT';
            DataClassification = CustomerContent;
        }
        field(70; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
            DataClassification = CustomerContent;
        }
        field(79; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            DataClassification = CustomerContent;
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
        }
        field(81; "Sell-to Address"; Text[100])
        {
            Caption = 'Sell-to Address';
            DataClassification = CustomerContent;
        }
        field(82; "Sell-to Address 2"; Text[50])
        {
            Caption = 'Sell-to Address 2';
            DataClassification = CustomerContent;
        }
        field(83; "Sell-to City"; Text[30])
        {
            Caption = 'Sell-to City';
            DataClassification = CustomerContent;
            TableRelation = IF ("Sell-to Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Sell-to Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Sell-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(84; "Sell-to Contact"; Text[100])
        {
            Caption = 'Sell-to Contact';
            DataClassification = CustomerContent;
        }
        field(85; "Bill-to Post Code"; Code[20])
        {
            Caption = 'Bill-to Post Code';
            DataClassification = CustomerContent;
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(86; "Bill-to County"; Text[30])
        {
            Caption = 'Bill-to County';
            DataClassification = CustomerContent;
        }
        field(87; "Bill-to Country/Region Code"; Code[10])
        {
            Caption = 'Bill-to Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }
        field(88; "Sell-to Post Code"; Code[20])
        {
            Caption = 'Sell-to Post Code';
            DataClassification = CustomerContent;
            TableRelation = IF ("Sell-to Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Sell-to Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Sell-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(89; "Sell-to County"; Text[30])
        {
            Caption = 'Sell-to County';
            DataClassification = CustomerContent;
        }
        field(90; "Sell-to Country/Region Code"; Code[10])
        {
            Caption = 'Sell-to Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }
        field(91; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
            TableRelation = IF ("Ship-to Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Ship-to Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Ship-to Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(92; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
            DataClassification = CustomerContent;
        }
        field(93; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }
        field(99; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(100; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(114; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            DataClassification = CustomerContent;
            TableRelation = "Tax Area";
            ValidateTableRelation = false;
        }
        field(115; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
            DataClassification = CustomerContent;
        }
        field(116; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "VAT Business Posting Group";
        }
        field(121; "Invoice Discount Calculation"; Option)
        {
            Caption = 'Invoice Discount Calculation';
            DataClassification = CustomerContent;
            OptionCaption = 'None,%,Amount';
            OptionMembers = "None","%",Amount;
        }
        field(122; "Invoice Discount Value"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Invoice Discount Value';
            DataClassification = CustomerContent;
        }
        field(152; "Quote Valid Until Date"; Date)
        {
            Caption = 'Quote Valid Until Date';
            DataClassification = CustomerContent;
        }
        field(153; "Quote Sent to Customer"; DateTime)
        {
            Caption = 'Quote Sent to Customer';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(154; "Quote Accepted"; Boolean)
        {
            Caption = 'Quote Accepted';
            DataClassification = CustomerContent;
        }
        field(155; "Quote Accepted Date"; Date)
        {
            Caption = 'Quote Accepted Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(167; "Last Email Sent Status"; Option)
        {
            Caption = 'Last Email Sent Status';
            DataClassification = SystemMetadata;
            ObsoleteReason = 'Do not store the sent status in the entity but calculate it on a fly to avoid etag change after quote sending.';
            ObsoleteState = Removed;
            OptionCaption = 'Not Sent,In Process,Finished,Error', Locked = true;
            OptionMembers = "Not Sent","In Process",Finished,Error;
        }
        field(171; "Sell-to Phone No."; Text[30])
        {
            Caption = 'Sell-to Phone No.';
            DataClassification = CustomerContent;
            ExtendedDatatype = PhoneNo;
        }
        field(172; "Sell-to E-Mail"; Text[80])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(1304; "Cust. Ledger Entry No."; Integer)
        {
            Caption = 'Cust. Ledger Entry No.';
            DataClassification = CustomerContent;
            TableRelation = "Cust. Ledger Entry"."Entry No.";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(1305; "Invoice Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Invoice Discount Amount';
            DataClassification = CustomerContent;
        }
        field(5052; "Sell-to Contact No."; Code[20])
        {
            Caption = 'Sell-to Contact No.';
            DataClassification = CustomerContent;
            TableRelation = Contact;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
            DataClassification = SystemMetadata;
        }
        field(9600; "Total Tax Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Tax Amount';
            DataClassification = CustomerContent;
        }
        field(9601; Status; Option)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            OptionCaption = 'Draft,Sent,Accepted', Locked = true;
            OptionMembers = Draft,Sent,Accepted,"Expired ";
        }
        field(9602; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
        }
        field(9603; "Subtotal Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Subtotal Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(9624; "Discount Applied Before Tax"; Boolean)
        {
            Caption = 'Discount Applied Before Tax';
            DataClassification = CustomerContent;
        }
        field(9630; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(9631; "Customer Id"; Guid)
        {
            Caption = 'Customer Id';
            DataClassification = SystemMetadata;
            TableRelation = Customer.Id;
        }
        field(9633; "Contact Graph Id"; Text[250])
        {
            Caption = 'Contact Graph Id';
            DataClassification = SystemMetadata;
        }
        field(9634; "Currency Id"; Guid)
        {
            Caption = 'Currency Id';
            DataClassification = SystemMetadata;
            TableRelation = Currency.Id;
        }
        field(9635; "Payment Terms Id"; Guid)
        {
            Caption = 'Payment Terms Id';
            DataClassification = SystemMetadata;
            TableRelation = "Payment Terms".Id;
        }
        field(9636; "Shipment Method Id"; Guid)
        {
            Caption = 'Shipment Method Id';
            DataClassification = SystemMetadata;
            TableRelation = "Shipment Method".Id;
        }
        field(9637; "Tax Area ID"; Guid)
        {
            Caption = 'Tax Area ID';
            DataClassification = SystemMetadata;
        }
        field(9638; "Bill-to Customer Id"; Guid)
        {
            Caption = 'Bill-to Customer Id';
            DataClassification = SystemMetadata;
            TableRelation = Customer.Id;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Id)
        {
        }
    }

    fieldgroups
    {
    }
}

