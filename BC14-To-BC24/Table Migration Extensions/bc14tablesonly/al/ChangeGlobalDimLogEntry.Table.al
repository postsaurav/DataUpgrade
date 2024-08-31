table 483 "Change Global Dim. Log Entry"
{
    Caption = 'Change Global Dim. Log Entry';
    Permissions = TableData "G/L Entry" = rm,
                  TableData "Cust. Ledger Entry" = rm,
                  TableData "Vendor Ledger Entry" = rm,
                  TableData "Item Ledger Entry" = rm,
                  TableData "Sales Shipment Header" = rm,
                  TableData "Sales Shipment Line" = rm,
                  TableData "Sales Invoice Header" = rm,
                  TableData "Sales Invoice Line" = rm,
                  TableData "Sales Cr.Memo Header" = rm,
                  TableData "Sales Cr.Memo Line" = rm,
                  TableData "Purch. Rcpt. Header" = rm,
                  TableData "Purch. Rcpt. Line" = rm,
                  TableData "Purch. Inv. Header" = rm,
                  TableData "Purch. Inv. Line" = rm,
                  TableData "Purch. Cr. Memo Hdr." = rm,
                  TableData "Purch. Cr. Memo Line" = rm,
                  TableData "Job Ledger Entry" = rm,
                  TableData "Res. Ledger Entry" = rm,
                  TableData "Bank Account Ledger Entry" = rm,
                  TableData "Phys. Inventory Ledger Entry" = rm,
                  TableData "Issued Reminder Header" = rm,
                  TableData "Issued Fin. Charge Memo Header" = rm,
                  TableData "Detailed Cust. Ledg. Entry" = rm,
                  TableData "Detailed Vendor Ledg. Entry" = rm,
                  TableData "Job WIP G/L Entry" = rm,
                  TableData "Employee Ledger Entry" = rm,
                  TableData "Detailed Employee Ledger Entry" = rm,
                  TableData "Production Order" = rm,
                  TableData "Prod. Order Line" = rm,
                  TableData "Prod. Order Component" = rm,
                  TableData "Prod. Order Routing Line" = rm,
                  TableData "Prod. Order Capacity Need" = rm,
                  TableData "Prod. Order Routing Tool" = rm,
                  TableData "Prod. Order Routing Personnel" = rm,
                  TableData "Prod. Order Rtng Qlty Meas." = rm,
                  TableData "Prod. Order Comment Line" = rm,
                  TableData "Prod. Order Rtng Comment Line" = rm,
                  TableData "Prod. Order Comp. Cmt Line" = rm,
                  TableData "FA Ledger Entry" = rm,
                  TableData "Maintenance Ledger Entry" = rm,
                  TableData "Ins. Coverage Ledger Entry" = rm,
                  TableData "Value Entry" = rm,
                  TableData "Capacity Ledger Entry" = rm,
                  TableData "Service Header" = rm,
                  TableData "Service Item Line" = rm,
                  TableData "Service Line" = rm,
                  TableData "Service Ledger Entry" = rm,
                  TableData "Service Contract Header" = rm,
                  TableData "Filed Service Contract Header" = rm,
                  TableData "Return Shipment Header" = rm,
                  TableData "Return Shipment Line" = rm,
                  TableData "Return Receipt Header" = rm,
                  TableData "Return Receipt Line" = rm;
    ReplicateData = false;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(2; "Table Name"; Text[50])
        {
            Caption = 'Table Name';
        }
        field(3; "Total Records"; Integer)
        {
            Caption = 'Total Records';
        }
        field(4; "Completed Records"; Integer)
        {
            Caption = 'Completed Records';
        }
        field(5; Progress; Decimal)
        {
            Caption = 'Progress';
            ExtendedDatatype = Ratio;
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = ' ,Scheduled,In Progress,Completed,Incomplete';
            OptionMembers = " ",Scheduled,"In Progress",Completed,Incomplete;
        }
        field(7; "Task ID"; Guid)
        {
            Caption = 'Task ID';
        }
        field(8; "Session ID"; Integer)
        {
            Caption = 'Session ID';
        }
        field(9; "Change Type 1"; Option)
        {
            Caption = 'Change Type 1';
            OptionCaption = 'None,Blank,Replace,New';
            OptionMembers = "None",Blank,Replace,New;
        }
        field(10; "Change Type 2"; Option)
        {
            Caption = 'Change Type 2';
            OptionCaption = 'None,Blank,Replace,New';
            OptionMembers = "None",Blank,Replace,New;
        }
        field(11; "Global Dim.1 Field No."; Integer)
        {
            Caption = 'Global Dim.1 Field No.';
        }
        field(12; "Global Dim.2 Field No."; Integer)
        {
            Caption = 'Global Dim.2 Field No.';
        }
        field(13; "Dim. Set ID Field No."; Integer)
        {
            Caption = 'Dim. Set ID Field No.';
        }
        field(14; "Primary Key Field No."; Integer)
        {
            Caption = 'Primary Key Field No.';
        }
        field(15; "Parent Table ID"; Integer)
        {
            Caption = 'Parent Table ID';
        }
        field(16; "Is Parent Table"; Boolean)
        {
            Caption = 'Is Parent Table';
        }
        field(17; "Earliest Start Date/Time"; DateTime)
        {
            Caption = 'Earliest Start Date/Time';
        }
        field(18; "Remaining Duration"; Duration)
        {
            Caption = 'Remaining Duration';
        }
        field(19; "Server Instance ID"; Integer)
        {
            Caption = 'Server Instance ID';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Table ID")
        {
            Clustered = true;
        }
        key(Key2; Progress)
        {
        }
        key(Key3; "Parent Table ID")
        {
        }
    }

    fieldgroups
    {
    }
}

