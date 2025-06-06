table 5877 "Phys. Invt. Record Header"
{
    Caption = 'Phys. Invt. Record Header';
    DataCaptionFields = "Order No.", "Recording No.", Description;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            TableRelation = "Phys. Invt. Order Header";
        }
        field(2; "Recording No."; Integer)
        {
            Caption = 'Recording No.';
            Editable = false;
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(11; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Open,Finished';
            OptionMembers = Open,Finished;
        }
        field(30; Comment; Boolean)
        {
            CalcFormula = Exist ("Phys. Invt. Comment Line" WHERE ("Document Type" = CONST (Recording),
                                                                  "Order No." = FIELD ("Order No."),
                                                                  "Recording No." = FIELD ("Recording No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Person Responsible"; Code[20])
        {
            Caption = 'Person Responsible';
            TableRelation = Employee;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(40; "Allow Recording Without Order"; Boolean)
        {
            Caption = 'Allow Recording Without Order';
        }
        field(100; "Date Recorded"; Date)
        {
            Caption = 'Date Recorded';
        }
        field(101; "Time Recorded"; Time)
        {
            Caption = 'Time Recorded';
        }
        field(102; "Person Recorded"; Code[20])
        {
            Caption = 'Person Recorded';
            TableRelation = Employee;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(110; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(111; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            TableRelation = Bin.Code WHERE ("Location Code" = FIELD ("Location Code"));
        }
    }

    keys
    {
        key(Key1; "Order No.", "Recording No.")
        {
            Clustered = true;
        }
        key(Key2; Status)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Order No.", "Recording No.", Description)
        {
        }
    }
}

