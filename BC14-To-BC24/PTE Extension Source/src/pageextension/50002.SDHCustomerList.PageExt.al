pageextension 50002 "SDH Customer List" extends "Customer List"
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

