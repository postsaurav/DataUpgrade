table 2107 "O365 Customer"
{
    Caption = 'O365 Customer';
    ReplicateData = false;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(8; Contact; Text[50])
        {
            Caption = 'Contact';
        }
        field(55; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(59; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No." = FIELD ("No.")));
            Caption = 'Balance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(67; "Balance Due (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No." = FIELD ("No."),
                                                                                 "Posting Date" = FIELD (UPPERLIMIT ("Date Filter")),
                                                                                 "Initial Entry Due Date" = FIELD ("Date Filter")));
            Caption = 'Balance Due (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(75; "Inv. Amounts (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Amounts (LCY)';
            Editable = false;
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
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
        fieldgroup(Brick; "No.", Name, "Inv. Amounts (LCY)", Contact, "Balance Due (LCY)", Image)
        {
        }
    }
}

