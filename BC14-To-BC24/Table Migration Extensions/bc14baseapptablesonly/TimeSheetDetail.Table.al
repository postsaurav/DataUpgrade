table 952 "Time Sheet Detail"
{
    Caption = 'Time Sheet Detail';

    fields
    {
        field(1; "Time Sheet No."; Code[20])
        {
            Caption = 'Time Sheet No.';
            TableRelation = "Time Sheet Header";
        }
        field(2; "Time Sheet Line No."; Integer)
        {
            Caption = 'Time Sheet Line No.';
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Resource,Job,Service,Absence,Assembly Order';
            OptionMembers = " ",Resource,Job,Service,Absence,"Assembly Order";
        }
        field(5; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = Resource;
        }
        field(6; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(7; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(9; "Cause of Absence Code"; Code[10])
        {
            Caption = 'Cause of Absence Code';
            TableRelation = "Cause of Absence";
        }
        field(13; "Service Order No."; Code[20])
        {
            Caption = 'Service Order No.';
            TableRelation = IF (Posted = CONST (false)) "Service Header"."No." WHERE ("Document Type" = CONST (Order));
        }
        field(14; "Service Order Line No."; Integer)
        {
            Caption = 'Service Order Line No.';
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            Editable = false;
        }
        field(16; "Posted Quantity"; Decimal)
        {
            Caption = 'Posted Quantity';
        }
        field(18; "Assembly Order No."; Code[20])
        {
            Caption = 'Assembly Order No.';
            TableRelation = IF (Posted = CONST (false)) "Assembly Header"."No." WHERE ("Document Type" = CONST (Order));
        }
        field(19; "Assembly Order Line No."; Integer)
        {
            Caption = 'Assembly Order Line No.';
        }
        field(20; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Submitted,Rejected,Approved';
            OptionMembers = Open,Submitted,Rejected,Approved;
        }
        field(23; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
        }
        field(8001; "Last Modified DateTime"; DateTime)
        {
            Caption = 'Last Modified DateTime';
        }
        field(8002; "Job Id"; Guid)
        {
            Caption = 'Job Id';
        }
    }

    keys
    {
        key(Key1; "Time Sheet No.", "Time Sheet Line No.", Date)
        {
            Clustered = true;
        }
        key(Key2; Type, "Job No.", "Job Task No.", Status, Posted)
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }
}

