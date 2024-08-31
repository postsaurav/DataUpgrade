pageextension 50001 "SDH Location List" extends "Location List"
{
    layout
    {
        addlast(Control1)
        {
            field(Shop; rec."SDH Shop")
            {
                ApplicationArea = All;
            }
        }
    }
}

