table 297 "Issued Reminder Header"
{
    Caption = 'Issued Reminder Header';
    DataCaptionFields = "No.", Name;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(7; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; City; Text[30])
        {
            Caption = 'City';
            TableRelation = "Post Code".City;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(9; County; Text[30])
        {
            Caption = 'County';
        }
        field(10; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(11; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(12; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(13; Contact; Text[100])
        {
            Caption = 'Contact';
        }
        field(14; "Your Reference"; Text[35])
        {
            Caption = 'Your Reference';
        }
        field(15; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
        }
        field(16; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));
        }
        field(17; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(18; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(19; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(20; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(21; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(22; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(23; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(24; "Reminder Terms Code"; Code[10])
        {
            Caption = 'Reminder Terms Code';
            TableRelation = "Reminder Terms";
        }
        field(25; "Fin. Charge Terms Code"; Code[10])
        {
            Caption = 'Fin. Charge Terms Code';
            TableRelation = "Finance Charge Terms";
        }
        field(26; "Interest Posted"; Boolean)
        {
            Caption = 'Interest Posted';
        }
        field(27; "Additional Fee Posted"; Boolean)
        {
            Caption = 'Additional Fee Posted';
        }
        field(28; "Reminder Level"; Integer)
        {
            Caption = 'Reminder Level';
            TableRelation = "Reminder Level"."No." WHERE ("Reminder Terms Code" = FIELD ("Reminder Terms Code"));
        }
        field(29; "Posting Description"; Text[100])
        {
            Caption = 'Posting Description';
        }
        field(30; Comment; Boolean)
        {
            CalcFormula = Exist ("Reminder Comment Line" WHERE (Type = CONST ("Issued Reminder"),
                                                               "No." = FIELD ("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Remaining Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Issued Reminder Line"."Remaining Amount" WHERE ("Reminder No." = FIELD ("No."),
                                                                               "Line Type" = CONST ("Reminder Line"),
                                                                               "Detailed Interest Rates Entry" = CONST (false)));
            Caption = 'Remaining Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Interest Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Issued Reminder Line".Amount WHERE ("Reminder No." = FIELD ("No."),
                                                                   Type = CONST ("Customer Ledger Entry"),
                                                                   "Line Type" = CONST ("Reminder Line"),
                                                                   "Detailed Interest Rates Entry" = CONST (false)));
            Caption = 'Interest Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Additional Fee"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Issued Reminder Line".Amount WHERE ("Reminder No." = FIELD ("No."),
                                                                   Type = CONST ("G/L Account")));
            Caption = 'Additional Fee';
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Issued Reminder Line"."VAT Amount" WHERE ("Reminder No." = FIELD ("No."),
                                                                         "Detailed Interest Rates Entry" = CONST (false)));
            Caption = 'VAT Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(35; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
        }
        field(36; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(37; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(38; "Pre-Assigned No. Series"; Code[20])
        {
            Caption = 'Pre-Assigned No. Series';
            TableRelation = "No. Series";
        }
        field(39; "Pre-Assigned No."; Code[20])
        {
            Caption = 'Pre-Assigned No.';
        }
        field(40; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(41; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(42; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(43; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(44; "Add. Fee per Line"; Decimal)
        {
            CalcFormula = Sum ("Issued Reminder Line".Amount WHERE ("Reminder No." = FIELD ("No."),
                                                                   Type = CONST ("Line Fee")));
            Caption = 'Add. Fee per Line';
            FieldClass = FlowField;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Customer No.", "Posting Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Customer No.", Name, "Posting Date")
        {
        }
    }
}

