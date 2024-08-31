table 2020 "Image Analysis Setup"
{
    Caption = 'Image Analysis Setup';
    DataPerCompany = false;
    Permissions = TableData "Service Password" = rimd;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Period start date"; DateTime)
        {
            Caption = 'Period start date';
            ObsoleteReason = 'Use of Table 2003 to track usage instead.';
            ObsoleteState = Removed;
        }
        field(3; "Number of calls"; Integer)
        {
            Caption = 'Number of calls';
            ObsoleteReason = 'Use of Table 2003 to track usage instead.';
            ObsoleteState = Removed;
        }
        field(4; "Api Uri"; Text[250])
        {
            Caption = 'Api Uri';
        }
        field(5; "Api Key Key"; Guid)
        {
            Caption = 'Api Key Key';
            ExtendedDatatype = Masked;
        }
        field(6; "Limit value"; Integer)
        {
            Caption = 'Limit value';
            ObsoleteReason = 'Use of Table 2003 to track usage instead.';
            ObsoleteState = Removed;
        }
        field(7; "Limit type"; Option)
        {
            Caption = 'Limit type';
            ObsoleteReason = 'Use of Table 2003 to track usage instead.';
            ObsoleteState = Removed;
            OptionCaption = 'Year,Month,Day,Hour';
            OptionMembers = Year,Month,Day,Hour;
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

