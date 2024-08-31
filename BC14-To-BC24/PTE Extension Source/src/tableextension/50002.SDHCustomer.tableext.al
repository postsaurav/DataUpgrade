tableextension 50002 "SDH Customer" extends Customer
{
    fields
    {
        field(50000; "SDH Shop"; Code[20])
        {
            Caption = 'Shop';
            DataClassification = CustomerContent;
        }
    }
}

