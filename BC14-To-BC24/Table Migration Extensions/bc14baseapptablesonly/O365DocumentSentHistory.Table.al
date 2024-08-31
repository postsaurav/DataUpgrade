table 2158 "O365 Document Sent History"
{
    Caption = 'O365 Document Sent History';
    Permissions = TableData "O365 Document Sent History" = rimd;
    ReplicateData = false;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(4; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
        }
        field(7; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Customer,Vendor';
            OptionMembers = " ",Customer,Vendor;
        }
        field(8; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST (Customer)) Customer
            ELSE
            IF ("Source Type" = CONST (Vendor)) Vendor;
        }
        field(11; "Job Queue Entry ID"; Guid)
        {
            Caption = 'Job Queue Entry ID';
        }
        field(12; "Job Last Status"; Option)
        {
            Caption = 'Job Last Status';
            OptionCaption = ',In Process,Finished,Error';
            OptionMembers = ,"In Process",Finished,Error;
        }
        field(13; "Job Completed"; DateTime)
        {
            Caption = 'Job Completed';
        }
        field(14; Notified; Boolean)
        {
            Caption = 'Notified';
        }
        field(15; NotificationCleared; Boolean)
        {
            Caption = 'NotificationCleared';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", Posted, "Created Date-Time")
        {
            Clustered = true;
        }
        key(Key2; "Job Queue Entry ID")
        {
        }
    }

    fieldgroups
    {
    }
}

