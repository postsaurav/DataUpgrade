table 2002 "Azure Machine Learning Usage"
{
    // // This table is used for Azure Machine Learning related features to control that amount of time used by all
    // // these features in total does not exceed the limit defined by Azure ML.The table is singleton and used only in SaaS.

    Caption = 'Azure Machine Learning Usage';
    ObsoleteReason = 'Table 2003 replaces this.';
    ObsoleteState = Pending;
    Permissions = TableData "Azure Machine Learning Usage" = rimd;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Total Processing Time"; Decimal)
        {
            Caption = 'Total Processing Time';
            Description = 'Processing time of the all Azure ML requests is in seconds for current month.';
            Editable = false;
            MinValue = 0;
        }
        field(3; "Last Date Updated"; Date)
        {
            Caption = 'Last Date Updated';
            Description = 'Date when the table was updated last time.';
            Editable = false;
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

