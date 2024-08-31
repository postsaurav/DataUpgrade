table 9183 "Generic Chart Query Column"
{
    Caption = 'Generic Chart Query Column';

    fields
    {
        field(1; "Query No."; Integer)
        {
            Caption = 'Query No.';
        }
        field(2; "Query Column No."; Integer)
        {
            Caption = 'Query Column No.';
        }
        field(3; "Column Name"; Text[50])
        {
            Caption = 'Column Name';
        }
        field(4; "Column Data Type"; Option)
        {
            Caption = 'Column Data Type';
            OptionCaption = 'Date,Time,DateFormula,Decimal,Text,Code,Binary,Boolean,Integer,Option,BigInteger,DateTime';
            OptionMembers = Date,Time,DateFormula,Decimal,Text,"Code",Binary,Boolean,"Integer",Option,BigInteger,DateTime;
        }
        field(5; "Column Type"; Option)
        {
            Caption = 'Column Type';
            OptionCaption = 'Filter Column,Column';
            OptionMembers = "Filter Column",Column;
        }
        field(6; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(7; "Aggregation Type"; Option)
        {
            Caption = 'Aggregation Type';
            OptionCaption = 'None,Count,Sum,Min,Max,Avg';
            OptionMembers = "None","Count","Sum","Min","Max",Avg;
        }
    }

    keys
    {
        key(Key1; "Query No.", "Query Column No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

