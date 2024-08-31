table 950 "Time Sheet Header"
{
    Caption = 'Time Sheet Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(4; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(5; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = Resource;
        }
        field(7; "Owner User ID"; Code[50])
        {
            Caption = 'Owner User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
        field(8; "Approver User ID"; Code[50])
        {
            Caption = 'Approver User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
        field(12; "Open Exists"; Boolean)
        {
            CalcFormula = Exist ("Time Sheet Line" WHERE ("Time Sheet No." = FIELD ("No."),
                                                         Status = CONST (Open)));
            Caption = 'Open Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Submitted Exists"; Boolean)
        {
            CalcFormula = Exist ("Time Sheet Line" WHERE ("Time Sheet No." = FIELD ("No."),
                                                         Status = CONST (Submitted)));
            Caption = 'Submitted Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Rejected Exists"; Boolean)
        {
            CalcFormula = Exist ("Time Sheet Line" WHERE ("Time Sheet No." = FIELD ("No."),
                                                         Status = CONST (Rejected)));
            Caption = 'Rejected Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Approved Exists"; Boolean)
        {
            CalcFormula = Exist ("Time Sheet Line" WHERE ("Time Sheet No." = FIELD ("No."),
                                                         Status = CONST (Approved)));
            Caption = 'Approved Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Posted Exists"; Boolean)
        {
            CalcFormula = Exist ("Time Sheet Posting Entry" WHERE ("Time Sheet No." = FIELD ("No.")));
            Caption = 'Posted Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; Quantity; Decimal)
        {
            CalcFormula = Sum ("Time Sheet Detail".Quantity WHERE ("Time Sheet No." = FIELD ("No."),
                                                                  Status = FIELD ("Status Filter"),
                                                                  "Job No." = FIELD ("Job No. Filter"),
                                                                  "Job Task No." = FIELD ("Job Task No. Filter"),
                                                                  Date = FIELD ("Date Filter"),
                                                                  Posted = FIELD ("Posted Filter"),
                                                                  Type = FIELD ("Type Filter")));
            Caption = 'Quantity';
            FieldClass = FlowField;
        }
        field(21; "Posted Quantity"; Decimal)
        {
            CalcFormula = Sum ("Time Sheet Posting Entry".Quantity WHERE ("Time Sheet No." = FIELD ("No.")));
            Caption = 'Posted Quantity';
            FieldClass = FlowField;
        }
        field(26; Comment; Boolean)
        {
            CalcFormula = Exist ("Time Sheet Comment Line" WHERE ("No." = FIELD ("No."),
                                                                 "Time Sheet Line No." = CONST (0)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Status Filter"; Option)
        {
            Caption = 'Status Filter';
            FieldClass = FlowFilter;
            OptionCaption = 'Open,Submitted,Rejected,Approved';
            OptionMembers = Open,Submitted,Rejected,Approved;
        }
        field(31; "Job No. Filter"; Code[20])
        {
            Caption = 'Job No. Filter';
            FieldClass = FlowFilter;
        }
        field(32; "Job Task No. Filter"; Code[20])
        {
            Caption = 'Job Task No. Filter';
            FieldClass = FlowFilter;
        }
        field(33; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(34; "Posted Filter"; Boolean)
        {
            Caption = 'Posted Filter';
            FieldClass = FlowFilter;
        }
        field(35; "Type Filter"; Option)
        {
            Caption = 'Type Filter';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Resource,Job,Service,Absence,Assembly Order';
            OptionMembers = " ",Resource,Job,Service,Absence,"Assembly Order";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Resource No.", "Starting Date")
        {
        }
        key(Key3; "Owner User ID")
        {
        }
        key(Key4; "Approver User ID")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Starting Date", "Ending Date", "Resource No.")
        {
        }
    }
}

