table 5080 "To-do"
{
    Caption = 'Task';
    DataCaptionFields = "No.", Description;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Team Code"; Code[10])
        {
            Caption = 'Team Code';
            TableRelation = Team;
        }
        field(3; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(4; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(5; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = Contact;
        }
        field(6; "Opportunity No."; Code[20])
        {
            Caption = 'Opportunity No.';
            TableRelation = Opportunity;
        }
        field(7; "Segment No."; Code[20])
        {
            Caption = 'Segment No.';
            TableRelation = "Segment Header";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(8; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Meeting,Phone Call';
            OptionMembers = " ",Meeting,"Phone Call";
        }
        field(9; Date; Date)
        {
            Caption = 'Date';
            NotBlank = true;
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Not Started,In Progress,Completed,Waiting,Postponed';
            OptionMembers = "Not Started","In Progress",Completed,Waiting,Postponed;
        }
        field(11; Priority; Option)
        {
            Caption = 'Priority';
            InitValue = Normal;
            OptionCaption = 'Low,Normal,High';
            OptionMembers = Low,Normal,High;
        }
        field(12; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(13; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(14; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
            Editable = false;
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(16; Comment; Boolean)
        {
            CalcFormula = Exist ("Rlshp. Mgt. Comment Line" WHERE ("Table Name" = CONST ("To-do"),
                                                                  "No." = FIELD ("Organizer To-do No."),
                                                                  "Sub No." = CONST (0)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; Canceled; Boolean)
        {
            Caption = 'Canceled';
        }
        field(18; "Contact Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Team Name"; Text[50])
        {
            CalcFormula = Lookup (Team.Name WHERE (Code = FIELD ("Team Code")));
            Caption = 'Team Name';
            Editable = false;
            FieldClass = FlowField;
            NotBlank = false;
        }
        field(20; "Salesperson Name"; Text[50])
        {
            CalcFormula = Lookup ("Salesperson/Purchaser".Name WHERE (Code = FIELD ("Salesperson Code")));
            Caption = 'Salesperson Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Campaign Description"; Text[100])
        {
            CalcFormula = Lookup (Campaign.Description WHERE ("No." = FIELD ("Campaign No.")));
            Caption = 'Campaign Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Contact Company No."; Code[20])
        {
            Caption = 'Contact Company No.';
            TableRelation = Contact WHERE (Type = CONST (Company));
        }
        field(23; "Contact Company Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact Company No.")));
            Caption = 'Contact Company Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; Recurring; Boolean)
        {
            Caption = 'Recurring';
        }
        field(25; "Recurring Date Interval"; DateFormula)
        {
            Caption = 'Recurring Date Interval';
        }
        field(26; "Calc. Due Date From"; Option)
        {
            Caption = 'Calc. Due Date From';
            OptionCaption = ' ,Due Date,Closing Date';
            OptionMembers = " ","Due Date","Closing Date";
        }
        field(27; "Opportunity Description"; Text[100])
        {
            CalcFormula = Lookup (Opportunity.Description WHERE ("No." = FIELD ("Opportunity No.")));
            Caption = 'Opportunity Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Start Time"; Time)
        {
            Caption = 'Start Time';
        }
        field(29; Duration; Duration)
        {
            Caption = 'Duration';
        }
        field(31; "Opportunity Entry No."; Integer)
        {
            Caption = 'Opportunity Entry No.';
            TableRelation = "Opportunity Entry";
        }
        field(32; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
        field(33; "Last Time Modified"; Time)
        {
            Caption = 'Last Time Modified';
        }
        field(34; "All Day Event"; Boolean)
        {
            Caption = 'All Day Event';
        }
        field(35; Location; Text[100])
        {
            Caption = 'Location';
        }
        field(36; "Organizer To-do No."; Code[20])
        {
            Caption = 'Organizer Task No.';
            TableRelation = "To-do";
        }
        field(37; "Interaction Template Code"; Code[10])
        {
            Caption = 'Interaction Template Code';
            TableRelation = "Interaction Template";
        }
        field(38; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(39; "Attachment No."; Integer)
        {
            Caption = 'Attachment No.';
        }
        field(40; Subject; Text[100])
        {
            Caption = 'Subject';
        }
        field(41; "Unit Cost (LCY)"; Decimal)
        {
            Caption = 'Unit Cost (LCY)';
            DecimalPlaces = 2 : 2;
        }
        field(42; "Unit Duration (Min.)"; Decimal)
        {
            Caption = 'Unit Duration (Min.)';
            DecimalPlaces = 0 : 2;
        }
        field(43; "No. of Attendees"; Integer)
        {
            CalcFormula = Count (Attendee WHERE ("To-do No." = FIELD ("Organizer To-do No.")));
            Caption = 'No. of Attendees';
            Editable = false;
            FieldClass = FlowField;
        }
        field(44; "Attendees Accepted No."; Integer)
        {
            CalcFormula = Count (Attendee WHERE ("To-do No." = FIELD ("Organizer To-do No."),
                                                "Invitation Response Type" = CONST (Accepted)));
            Caption = 'Attendees Accepted No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(45; "System To-do Type"; Option)
        {
            Caption = 'System Task Type';
            OptionCaption = 'Organizer,Salesperson Attendee,Contact Attendee,Team';
            OptionMembers = Organizer,"Salesperson Attendee","Contact Attendee",Team;
        }
        field(46; "Completed By"; Code[20])
        {
            Caption = 'Completed By';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(47; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(48; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
        }
        field(9501; "Wizard Step"; Option)
        {
            Caption = 'Wizard Step';
            Editable = false;
            OptionCaption = ' ,1,2,3,4,5,6';
            OptionMembers = " ","1","2","3","4","5","6";
        }
        field(9504; "Team To-do"; Boolean)
        {
            Caption = 'Team Task';
        }
        field(9505; "Send on finish"; Boolean)
        {
            Caption = 'Send on finish';
        }
        field(9506; "Segment Description"; Text[100])
        {
            Caption = 'Segment Description';
        }
        field(9507; "Team Meeting Organizer"; Code[20])
        {
            Caption = 'Team Meeting Organizer';
        }
        field(9508; "Activity Code"; Code[10])
        {
            Caption = 'Activity Code';
            TableRelation = Activity.Code;
        }
        field(9509; "Wizard Contact Name"; Text[100])
        {
            Caption = 'Wizard Contact Name';
        }
        field(9510; "Wizard Campaign Description"; Text[100])
        {
            Caption = 'Wizard Campaign Description';
        }
        field(9511; "Wizard Opportunity Description"; Text[100])
        {
            Caption = 'Wizard Opportunity Description';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Contact Company No.", Date, "Contact No.", Closed)
        {
        }
        key(Key3; "Contact Company No.", "Contact No.", Closed, Date)
        {
        }
        key(Key4; "Salesperson Code", Date, Closed)
        {
        }
        key(Key5; "Team Code", Date, Closed)
        {
        }
        key(Key6; "Campaign No.", Date)
        {
        }
        key(Key7; "Segment No.", Date)
        {
        }
        key(Key8; "Opportunity No.", Date, Closed)
        {
        }
        key(Key9; "Organizer To-do No.", "System To-do Type")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, Status)
        {
        }
    }
}

