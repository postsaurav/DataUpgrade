table 472 "Job Queue Entry"
{
    Caption = 'Job Queue Entry';
    DataCaptionFields = "Object Type to Run", "Object ID to Run", "Object Caption to Run";
    Permissions = TableData "Job Queue Entry" = rimd,
                  TableData "Job Queue Log Entry" = rim;
    ReplicateData = false;

    fields
    {
        field(1; ID; Guid)
        {
            Caption = 'ID';
        }
        field(2; "User ID"; Text[65])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(3; XML; BLOB)
        {
            Caption = 'XML';
        }
        field(4; "Last Ready State"; DateTime)
        {
            Caption = 'Last Ready State';
            Editable = false;
        }
        field(5; "Expiration Date/Time"; DateTime)
        {
            Caption = 'Expiration Date/Time';
        }
        field(6; "Earliest Start Date/Time"; DateTime)
        {
            Caption = 'Earliest Start Date/Time';
        }
        field(7; "Object Type to Run"; Option)
        {
            Caption = 'Object Type to Run';
            InitValue = "Report";
            OptionCaption = ',,,Report,,Codeunit';
            OptionMembers = ,,,"Report",,"Codeunit";
        }
        field(8; "Object ID to Run"; Integer)
        {
            Caption = 'Object ID to Run';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = FIELD ("Object Type to Run"));
        }
        field(9; "Object Caption to Run"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = FIELD ("Object Type to Run"),
                                                                           "Object ID" = FIELD ("Object ID to Run")));
            Caption = 'Object Caption to Run';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Report Output Type"; Option)
        {
            Caption = 'Report Output Type';
            OptionCaption = 'PDF,Word,Excel,Print,None (Processing only)';
            OptionMembers = PDF,Word,Excel,Print,"None (Processing only)";
        }
        field(11; "Maximum No. of Attempts to Run"; Integer)
        {
            Caption = 'Maximum No. of Attempts to Run';
        }
        field(12; "No. of Attempts to Run"; Integer)
        {
            Caption = 'No. of Attempts to Run';
            Editable = false;
        }
        field(13; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionCaption = 'Ready,In Process,Error,On Hold,Finished,On Hold with Inactivity Timeout';
            OptionMembers = Ready,"In Process",Error,"On Hold",Finished,"On Hold with Inactivity Timeout";
        }
        field(14; Priority; Integer)
        {
            Caption = 'Priority';
            InitValue = 1000;
        }
        field(15; "Record ID to Process"; RecordID)
        {
            Caption = 'Record ID to Process';
            DataClassification = SystemMetadata;
        }
        field(16; "Parameter String"; Text[250])
        {
            Caption = 'Parameter String';
        }
        field(17; "Recurring Job"; Boolean)
        {
            Caption = 'Recurring Job';
        }
        field(18; "No. of Minutes between Runs"; Integer)
        {
            Caption = 'No. of Minutes between Runs';
        }
        field(19; "Run on Mondays"; Boolean)
        {
            Caption = 'Run on Mondays';
        }
        field(20; "Run on Tuesdays"; Boolean)
        {
            Caption = 'Run on Tuesdays';
        }
        field(21; "Run on Wednesdays"; Boolean)
        {
            Caption = 'Run on Wednesdays';
        }
        field(22; "Run on Thursdays"; Boolean)
        {
            Caption = 'Run on Thursdays';
        }
        field(23; "Run on Fridays"; Boolean)
        {
            Caption = 'Run on Fridays';
        }
        field(24; "Run on Saturdays"; Boolean)
        {
            Caption = 'Run on Saturdays';
        }
        field(25; "Run on Sundays"; Boolean)
        {
            Caption = 'Run on Sundays';
        }
        field(26; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
        }
        field(27; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
        }
        field(28; "Reference Starting Time"; DateTime)
        {
            Caption = 'Reference Starting Time';
            Editable = false;
        }
        field(29; "Next Run Date Formula"; DateFormula)
        {
            Caption = 'Next Run Date Formula';
            DataClassification = SystemMetadata;
        }
        field(30; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(31; "Run in User Session"; Boolean)
        {
            Caption = 'Run in User Session';
            Editable = false;
        }
        field(32; "User Session ID"; Integer)
        {
            Caption = 'User Session ID';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(33; "Job Queue Category Code"; Code[10])
        {
            Caption = 'Job Queue Category Code';
            TableRelation = "Job Queue Category";
        }
        field(34; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
        }
        field(35; "Error Message 2"; Text[250])
        {
            Caption = 'Error Message 2';
        }
        field(36; "Error Message 3"; Text[250])
        {
            Caption = 'Error Message 3';
        }
        field(37; "Error Message 4"; Text[250])
        {
            Caption = 'Error Message 4';
        }
        field(40; "User Service Instance ID"; Integer)
        {
            Caption = 'User Service Instance ID';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(41; "User Session Started"; DateTime)
        {
            Caption = 'User Session Started';
            Editable = false;
        }
        field(42; "Timeout (sec.)"; Integer)
        {
            Caption = 'Timeout (sec.)';
            MinValue = 0;
        }
        field(43; "Notify On Success"; Boolean)
        {
            Caption = 'Notify On Success';
        }
        field(44; "User Language ID"; Integer)
        {
            Caption = 'User Language ID';
        }
        field(45; "Printer Name"; Text[250])
        {
            Caption = 'Printer Name';
        }
        field(46; "Report Request Page Options"; Boolean)
        {
            Caption = 'Report Request Page Options';
        }
        field(47; "Rerun Delay (sec.)"; Integer)
        {
            Caption = 'Rerun Delay (sec.)';
            MaxValue = 3600;
            MinValue = 0;
        }
        field(48; "System Task ID"; Guid)
        {
            Caption = 'System Task ID';
        }
        field(49; Scheduled; Boolean)
        {
            CalcFormula = Exist ("Scheduled Task" WHERE (ID = FIELD ("System Task ID")));
            Caption = 'Scheduled';
            FieldClass = FlowField;
        }
        field(50; "Manual Recurrence"; Boolean)
        {
            Caption = 'Manual Recurrence';
        }
        field(51; "On Hold Due to Inactivity"; Boolean)
        {
            Caption = 'On Hold Due to Inactivity';
            ObsoleteReason = 'Functionality moved into new job queue status';
            ObsoleteState = Pending;
        }
        field(52; "Inactivity Timeout Period"; Integer)
        {
            Caption = 'Inactivity Timeout Period';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
        key(Key2; "Job Queue Category Code")
        {
        }
    }

    fieldgroups
    {
    }
}

