tableextension 50001 "SDH Location" extends Location
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

