table 2103 "O365 Sales Document"
{
    Caption = 'O365 Sales Document';
    ReplicateData = false;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Estimate,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            TableRelation = Customer;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(24; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(32; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(79; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
        }
        field(84; "Sell-to Contact"; Text[100])
        {
            Caption = 'Sell-to Contact';
        }
        field(99; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(166; "Last Email Sent Time"; DateTime)
        {
            CalcFormula = Max ("O365 Document Sent History"."Created Date-Time" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                                      "Document No." = FIELD ("No."),
                                                                                      Posted = FIELD (Posted)));
            Caption = 'Last Email Sent Time';
            FieldClass = FlowField;
        }
        field(167; "Last Email Sent Status"; Option)
        {
            CalcFormula = Lookup ("O365 Document Sent History"."Job Last Status" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                                       "Document No." = FIELD ("No."),
                                                                                       Posted = FIELD (Posted),
                                                                                       "Created Date-Time" = FIELD ("Last Email Sent Time")));
            Caption = 'Last Email Sent Status';
            FieldClass = FlowField;
            OptionCaption = 'Not Sent,In Process,Finished,Error';
            OptionMembers = "Not Sent","In Process",Finished,Error;
        }
        field(168; "Sent as Email"; Boolean)
        {
            CalcFormula = Exist ("O365 Document Sent History" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                    "Document No." = FIELD ("No."),
                                                                    Posted = FIELD (Posted),
                                                                    "Job Last Status" = CONST (Finished)));
            Caption = 'Sent as Email';
            FieldClass = FlowField;
        }
        field(169; "Last Email Notif Cleared"; Boolean)
        {
            CalcFormula = Lookup ("O365 Document Sent History".NotificationCleared WHERE ("Document Type" = FIELD ("Document Type"),
                                                                                         "Document No." = FIELD ("No."),
                                                                                         Posted = FIELD (Posted),
                                                                                         "Created Date-Time" = FIELD ("Last Email Sent Time")));
            Caption = 'Last Email Notif Cleared';
            FieldClass = FlowField;
        }
        field(170; IsTest; Boolean)
        {
            Caption = 'IsTest';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2100; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(2101; Canceled; Boolean)
        {
            CalcFormula = Exist ("Cancelled Document" WHERE ("Source ID" = CONST (112),
                                                            "Cancelled Doc. No." = FIELD ("No.")));
            Caption = 'Canceled';
            FieldClass = FlowField;
        }
        field(2102; "Currency Symbol"; Text[10])
        {
            Caption = 'Currency Symbol';
        }
        field(2103; "Document Status"; Option)
        {
            Caption = 'Document Status';
            OptionCaption = 'Quote,Draft Invoice,Unpaid Invoice,Canceled Invoice,Paid Invoice,Overdue Invoice';
            OptionMembers = Quote,"Draft Invoice","Unpaid Invoice","Canceled Invoice","Paid Invoice","Overdue Invoice";
        }
        field(2104; "Sales Amount"; Decimal)
        {
            Caption = 'Sales Amount';
        }
        field(2105; "Outstanding Amount"; Decimal)
        {
            Caption = 'Outstanding Amount';
        }
        field(2106; "Total Invoiced Amount"; Text[250])
        {
            Caption = 'Total Invoiced Amount';
        }
        field(2107; "Outstanding Status"; Text[250])
        {
            Caption = 'Outstanding Status';
        }
        field(2108; "Document Icon"; MediaSet)
        {
            Caption = 'Document Icon';
            ObsoleteReason = 'We no longer show a document icon.';
            ObsoleteState = Pending;
        }
        field(2109; "Payment Method"; Code[10])
        {
            Caption = 'Payment Method';
            TableRelation = "Payment Method" WHERE ("Use for Invoicing" = CONST (true));
        }
        field(2110; "Display No."; Text[20])
        {
            Caption = 'Display No.';
        }
        field(2111; "Quote Valid Until Date"; Date)
        {
            CalcFormula = Lookup ("Sales Header"."Quote Valid Until Date" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                                "No." = FIELD ("No.")));
            Caption = 'Quote Valid Until Date';
            FieldClass = FlowField;
        }
        field(2112; "Quote Accepted"; Boolean)
        {
            CalcFormula = Lookup ("Sales Header"."Quote Accepted" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                        "No." = FIELD ("No.")));
            Caption = 'Quote Accepted';
            FieldClass = FlowField;
        }
        field(2113; "Quote Sent to Customer"; DateTime)
        {
            CalcFormula = Lookup ("Sales Header"."Quote Sent to Customer" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                                "No." = FIELD ("No.")));
            Caption = 'Quote Sent to Customer';
            FieldClass = FlowField;
        }
        field(2114; "Quote Accepted Date"; Date)
        {
            CalcFormula = Lookup ("Sales Header"."Quote Accepted Date" WHERE ("Document Type" = FIELD ("Document Type"),
                                                                             "No." = FIELD ("No.")));
            Caption = 'Quote Accepted Date';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", Posted)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Document Date", "Sell-to Customer Name", "Total Invoiced Amount", "No.", "Outstanding Status", "Document Type")
        {
        }
    }
}

