table 454 "Approval Entry"
{
    Caption = 'Approval Entry';

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(2; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order, ';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"," ";
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; "Sequence No."; Integer)
        {
            Caption = 'Sequence No.';
        }
        field(5; "Approval Code"; Code[20])
        {
            Caption = 'Approval Code';
        }
        field(6; "Sender ID"; Code[50])
        {
            Caption = 'Sender ID';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(7; "Salespers./Purch. Code"; Code[20])
        {
            Caption = 'Salespers./Purch. Code';
        }
        field(8; "Approver ID"; Code[50])
        {
            Caption = 'Approver ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(9; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Created,Open,Canceled,Rejected,Approved';
            OptionMembers = Created,Open,Canceled,Rejected,Approved;
        }
        field(10; "Date-Time Sent for Approval"; DateTime)
        {
            Caption = 'Date-Time Sent for Approval';
        }
        field(11; "Last Date-Time Modified"; DateTime)
        {
            Caption = 'Last Date-Time Modified';
        }
        field(12; "Last Modified By User ID"; Code[50])
        {
            Caption = 'Last Modified By User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(13; Comment; Boolean)
        {
            CalcFormula = Exist ("Approval Comment Line" WHERE ("Table ID" = FIELD ("Table ID"),
                                                               "Record ID to Approve" = FIELD ("Record ID to Approve"),
                                                               "Workflow Step Instance ID" = FIELD ("Workflow Step Instance ID")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(15; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(16; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
        }
        field(17; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(18; "Approval Type"; Option)
        {
            Caption = 'Approval Type';
            OptionCaption = 'Workflow User Group,Sales Pers./Purchaser,Approver';
            OptionMembers = "Workflow User Group","Sales Pers./Purchaser",Approver;
        }
        field(19; "Limit Type"; Option)
        {
            Caption = 'Limit Type';
            OptionCaption = 'Approval Limits,Credit Limits,Request Limits,No Limits';
            OptionMembers = "Approval Limits","Credit Limits","Request Limits","No Limits";
        }
        field(20; "Available Credit Limit (LCY)"; Decimal)
        {
            Caption = 'Available Credit Limit (LCY)';
        }
        field(21; "Pending Approvals"; Integer)
        {
            CalcFormula = Count ("Approval Entry" WHERE ("Record ID to Approve" = FIELD ("Record ID to Approve"),
                                                        Status = FILTER (Created | Open),
                                                        "Workflow Step Instance ID" = FIELD ("Workflow Step Instance ID")));
            Caption = 'Pending Approvals';
            FieldClass = FlowField;
        }
        field(22; "Record ID to Approve"; RecordID)
        {
            Caption = 'Record ID to Approve';
            DataClassification = SystemMetadata;
        }
        field(23; "Delegation Date Formula"; DateFormula)
        {
            Caption = 'Delegation Date Formula';
        }
        field(26; "Number of Approved Requests"; Integer)
        {
            CalcFormula = Count ("Approval Entry" WHERE ("Record ID to Approve" = FIELD ("Record ID to Approve"),
                                                        Status = FILTER (Approved),
                                                        "Workflow Step Instance ID" = FIELD ("Workflow Step Instance ID")));
            Caption = 'Number of Approved Requests';
            FieldClass = FlowField;
        }
        field(27; "Number of Rejected Requests"; Integer)
        {
            CalcFormula = Count ("Approval Entry" WHERE ("Record ID to Approve" = FIELD ("Record ID to Approve"),
                                                        Status = FILTER (Rejected),
                                                        "Workflow Step Instance ID" = FIELD ("Workflow Step Instance ID")));
            Caption = 'Number of Rejected Requests';
            FieldClass = FlowField;
        }
        field(29; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(30; "Workflow Step Instance ID"; Guid)
        {
            Caption = 'Workflow Step Instance ID';
        }
        field(31; "Related to Change"; Boolean)
        {
            CalcFormula = Exist ("Workflow - Record Change" WHERE ("Workflow Step Instance ID" = FIELD ("Workflow Step Instance ID"),
                                                                  "Record ID" = FIELD ("Record ID to Approve")));
            Caption = 'Related to Change';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Record ID to Approve", "Workflow Step Instance ID", "Sequence No.")
        {
        }
        key(Key3; "Table ID", "Document Type", "Document No.", "Sequence No.", "Record ID to Approve")
        {
        }
        key(Key4; "Approver ID", Status, "Due Date", "Date-Time Sent for Approval")
        {
        }
        key(Key5; "Sender ID")
        {
        }
        key(Key6; "Due Date")
        {
        }
        key(Key7; "Table ID", "Record ID to Approve", Status, "Workflow Step Instance ID", "Sequence No.")
        {
        }
        key(Key8; "Table ID", "Document Type", "Document No.", "Date-Time Sent for Approval")
        {
        }
    }

    fieldgroups
    {
    }
}

