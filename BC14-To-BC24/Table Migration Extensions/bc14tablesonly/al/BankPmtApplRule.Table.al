table 1252 "Bank Pmt. Appl. Rule"
{
    Caption = 'Bank Pmt. Appl. Rule';

    fields
    {
        field(1; "Match Confidence"; Option)
        {
            Caption = 'Match Confidence';
            OptionCaption = 'None,Low,Medium,High';
            OptionMembers = "None",Low,Medium,High;
        }
        field(2; Priority; Integer)
        {
            Caption = 'Priority';
        }
        field(3; "Related Party Matched"; Option)
        {
            Caption = 'Related Party Matched';
            OptionCaption = 'Not Considered,Fully,Partially,No';
            OptionMembers = "Not Considered",Fully,Partially,No;
        }
        field(4; "Doc. No./Ext. Doc. No. Matched"; Option)
        {
            Caption = 'Doc. No./Ext. Doc. No. Matched';
            OptionCaption = 'Not Considered,Yes,No,Yes - Multiple';
            OptionMembers = "Not Considered",Yes,No,"Yes - Multiple";
        }
        field(5; "Amount Incl. Tolerance Matched"; Option)
        {
            Caption = 'Amount Incl. Tolerance Matched';
            OptionCaption = 'Not Considered,One Match,Multiple Matches,No Matches';
            OptionMembers = "Not Considered","One Match","Multiple Matches","No Matches";
        }
        field(6; "Direct Debit Collect. Matched"; Option)
        {
            Caption = 'Direct Debit Collect. Matched';
            OptionCaption = 'Not Considered,Yes,No';
            OptionMembers = "Not Considered",Yes,No;
        }
        field(30; Score; Integer)
        {
            Caption = 'Score';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Match Confidence", Priority)
        {
            Clustered = true;
        }
        key(Key2; Score)
        {
        }
    }

    fieldgroups
    {
    }
}

