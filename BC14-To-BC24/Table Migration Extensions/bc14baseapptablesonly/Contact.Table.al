table 5050 Contact
{
    Caption = 'Contact';
    DataCaptionFields = "No.", Name;
    Permissions = TableData "Sales Header" = rm,
                  TableData "Contact Alt. Address" = rd,
                  TableData "Contact Alt. Addr. Date Range" = rd,
                  TableData "Contact Business Relation" = rd,
                  TableData "Contact Mailing Group" = rd,
                  TableData "Contact Industry Group" = rd,
                  TableData "Contact Web Source" = rd,
                  TableData "Rlshp. Mgt. Comment Line" = rd,
                  TableData "Interaction Log Entry" = rm,
                  TableData "Contact Job Responsibility" = rd,
                  TableData "To-do" = rm,
                  TableData "Contact Profile Answer" = rd,
                  TableData Opportunity = rm,
                  TableData "Opportunity Entry" = rm;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code".City WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(10; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';
        }
        field(15; "Territory Code"; Code[10])
        {
            Caption = 'Territory Code';
            TableRelation = Territory;
        }
        field(22; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(24; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(29; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(38; Comment; Boolean)
        {
            CalcFormula = Exist ("Rlshp. Mgt. Comment Line" WHERE ("Table Name" = CONST (Contact),
                                                                  "No." = FIELD ("No."),
                                                                  "Sub No." = CONST (0)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(54; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(84; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(85; "Telex Answer Back"; Text[20])
        {
            Caption = 'Telex Answer Back';
        }
        field(86; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(89; Picture; BLOB)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
            SubType = Bitmap;
        }
        field(91; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST ('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER (<> '')) "Post Code" WHERE ("Country/Region Code" = FIELD ("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(92; County; Text[30])
        {
            Caption = 'County';
        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(103; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(150; "Privacy Blocked"; Boolean)
        {
            Caption = 'Privacy Blocked';
        }
        field(151; Minor; Boolean)
        {
            Caption = 'Minor';
        }
        field(152; "Parental Consent Received"; Boolean)
        {
            Caption = 'Parental Consent Received';
        }
        field(5050; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Company,Person';
            OptionMembers = Company,Person;
        }
        field(5051; "Company No."; Code[20])
        {
            Caption = 'Company No.';
            TableRelation = Contact WHERE (Type = CONST (Company));
        }
        field(5052; "Company Name"; Text[100])
        {
            Caption = 'Company Name';
            TableRelation = Contact.Name WHERE (Type = CONST (Company));
            ValidateTableRelation = false;
        }
        field(5053; "Lookup Contact No."; Code[20])
        {
            Caption = 'Lookup Contact No.';
            Editable = false;
            TableRelation = Contact;
        }
        field(5054; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(5055; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(5056; Surname; Text[30])
        {
            Caption = 'Surname';
        }
        field(5058; "Job Title"; Text[30])
        {
            Caption = 'Job Title';
        }
        field(5059; Initials; Text[30])
        {
            Caption = 'Initials';
        }
        field(5060; "Extension No."; Text[30])
        {
            Caption = 'Extension No.';
        }
        field(5061; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(5062; Pager; Text[30])
        {
            Caption = 'Pager';
        }
        field(5063; "Organizational Level Code"; Code[10])
        {
            Caption = 'Organizational Level Code';
            TableRelation = "Organizational Level";
        }
        field(5064; "Exclude from Segment"; Boolean)
        {
            Caption = 'Exclude from Segment';
        }
        field(5065; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(5066; "Next Task Date"; Date)
        {
            CalcFormula = Min ("To-do".Date WHERE ("Contact Company No." = FIELD ("Company No."),
                                                  "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                  Closed = CONST (false),
                                                  "System To-do Type" = CONST ("Contact Attendee")));
            Caption = 'Next Task Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5067; "Last Date Attempted"; Date)
        {
            CalcFormula = Max ("Interaction Log Entry".Date WHERE ("Contact Company No." = FIELD ("Company No."),
                                                                  "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                                  "Initiated By" = CONST (Us),
                                                                  Postponed = CONST (false)));
            Caption = 'Last Date Attempted';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5068; "Date of Last Interaction"; Date)
        {
            CalcFormula = Max ("Interaction Log Entry".Date WHERE ("Contact Company No." = FIELD ("Company No."),
                                                                  "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                                  "Attempt Failed" = CONST (false),
                                                                  Postponed = CONST (false)));
            Caption = 'Date of Last Interaction';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5069; "No. of Job Responsibilities"; Integer)
        {
            CalcFormula = Count ("Contact Job Responsibility" WHERE ("Contact No." = FIELD ("No.")));
            Caption = 'No. of Job Responsibilities';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5070; "No. of Industry Groups"; Integer)
        {
            CalcFormula = Count ("Contact Industry Group" WHERE ("Contact No." = FIELD ("Company No.")));
            Caption = 'No. of Industry Groups';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5071; "No. of Business Relations"; Integer)
        {
            CalcFormula = Count ("Contact Business Relation" WHERE ("Contact No." = FIELD ("Company No.")));
            Caption = 'No. of Business Relations';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5072; "No. of Mailing Groups"; Integer)
        {
            CalcFormula = Count ("Contact Mailing Group" WHERE ("Contact No." = FIELD ("No.")));
            Caption = 'No. of Mailing Groups';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5073; "External ID"; Code[20])
        {
            Caption = 'External ID';
        }
        field(5074; "No. of Interactions"; Integer)
        {
            CalcFormula = Count ("Interaction Log Entry" WHERE ("Contact Company No." = FIELD (FILTER ("Company No.")),
                                                               Canceled = CONST (false),
                                                               "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                               Date = FIELD ("Date Filter"),
                                                               Postponed = CONST (false)));
            Caption = 'No. of Interactions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5076; "Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Interaction Log Entry"."Cost (LCY)" WHERE ("Contact Company No." = FIELD ("Company No."),
                                                                          Canceled = CONST (false),
                                                                          "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                                          Date = FIELD ("Date Filter"),
                                                                          Postponed = CONST (false)));
            Caption = 'Cost (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5077; "Duration (Min.)"; Decimal)
        {
            CalcFormula = Sum ("Interaction Log Entry"."Duration (Min.)" WHERE ("Contact Company No." = FIELD ("Company No."),
                                                                               Canceled = CONST (false),
                                                                               "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                                               Date = FIELD ("Date Filter"),
                                                                               Postponed = CONST (false)));
            Caption = 'Duration (Min.)';
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5078; "No. of Opportunities"; Integer)
        {
            CalcFormula = Count ("Opportunity Entry" WHERE (Active = CONST (true),
                                                           "Contact Company No." = FIELD ("Company No."),
                                                           "Estimated Close Date" = FIELD ("Date Filter"),
                                                           "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                           "Action Taken" = FIELD ("Action Taken Filter")));
            Caption = 'No. of Opportunities';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5079; "Estimated Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Opportunity Entry"."Estimated Value (LCY)" WHERE (Active = CONST (true),
                                                                                 "Contact Company No." = FIELD ("Company No."),
                                                                                 "Estimated Close Date" = FIELD ("Date Filter"),
                                                                                 "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                                                 "Action Taken" = FIELD ("Action Taken Filter")));
            Caption = 'Estimated Value (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5080; "Calcd. Current Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum ("Opportunity Entry"."Calcd. Current Value (LCY)" WHERE (Active = CONST (true),
                                                                                      "Contact Company No." = FIELD ("Company No."),
                                                                                      "Estimated Close Date" = FIELD ("Date Filter"),
                                                                                      "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                                                      "Action Taken" = FIELD ("Action Taken Filter")));
            Caption = 'Calcd. Current Value (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5082; "Opportunity Entry Exists"; Boolean)
        {
            CalcFormula = Exist ("Opportunity Entry" WHERE (Active = CONST (true),
                                                           "Contact Company No." = FIELD ("Company No."),
                                                           "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                                           "Sales Cycle Code" = FIELD ("Sales Cycle Filter"),
                                                           "Sales Cycle Stage" = FIELD ("Sales Cycle Stage Filter"),
                                                           "Salesperson Code" = FIELD ("Salesperson Filter"),
                                                           "Campaign No." = FIELD ("Campaign Filter"),
                                                           "Action Taken" = FIELD ("Action Taken Filter"),
                                                           "Estimated Value (LCY)" = FIELD ("Estimated Value Filter"),
                                                           "Calcd. Current Value (LCY)" = FIELD ("Calcd. Current Value Filter"),
                                                           "Completed %" = FIELD ("Completed % Filter"),
                                                           "Chances of Success %" = FIELD ("Chances of Success % Filter"),
                                                           "Probability %" = FIELD ("Probability % Filter"),
                                                           "Estimated Close Date" = FIELD ("Date Filter"),
                                                           "Close Opportunity Code" = FIELD ("Close Opportunity Filter")));
            Caption = 'Opportunity Entry Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5083; "Task Entry Exists"; Boolean)
        {
            CalcFormula = Exist ("To-do" WHERE ("Contact Company No." = FIELD ("Company No."),
                                               "Contact No." = FIELD (FILTER ("Lookup Contact No.")),
                                               "Team Code" = FIELD ("Team Filter"),
                                               "Salesperson Code" = FIELD ("Salesperson Filter"),
                                               "Campaign No." = FIELD ("Campaign Filter"),
                                               Date = FIELD ("Date Filter"),
                                               Status = FIELD ("Task Status Filter"),
                                               Priority = FIELD ("Priority Filter"),
                                               Closed = FIELD ("Task Closed Filter")));
            Caption = 'Task Entry Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5084; "Salesperson Filter"; Code[20])
        {
            Caption = 'Salesperson Filter';
            FieldClass = FlowFilter;
            TableRelation = "Salesperson/Purchaser";
        }
        field(5085; "Campaign Filter"; Code[20])
        {
            Caption = 'Campaign Filter';
            FieldClass = FlowFilter;
            TableRelation = Campaign;
        }
        field(5087; "Action Taken Filter"; Option)
        {
            Caption = 'Action Taken Filter';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Next,Previous,Updated,Jumped,Won,Lost';
            OptionMembers = " ",Next,Previous,Updated,Jumped,Won,Lost;
        }
        field(5088; "Sales Cycle Filter"; Code[10])
        {
            Caption = 'Sales Cycle Filter';
            FieldClass = FlowFilter;
            TableRelation = "Sales Cycle";
        }
        field(5089; "Sales Cycle Stage Filter"; Integer)
        {
            Caption = 'Sales Cycle Stage Filter';
            FieldClass = FlowFilter;
            TableRelation = "Sales Cycle Stage".Stage WHERE ("Sales Cycle Code" = FIELD ("Sales Cycle Filter"));
        }
        field(5090; "Probability % Filter"; Decimal)
        {
            Caption = 'Probability % Filter';
            DecimalPlaces = 1 : 1;
            FieldClass = FlowFilter;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5091; "Completed % Filter"; Decimal)
        {
            Caption = 'Completed % Filter';
            DecimalPlaces = 1 : 1;
            FieldClass = FlowFilter;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5092; "Estimated Value Filter"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Estimated Value Filter';
            FieldClass = FlowFilter;
        }
        field(5093; "Calcd. Current Value Filter"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Calcd. Current Value Filter';
            FieldClass = FlowFilter;
        }
        field(5094; "Chances of Success % Filter"; Decimal)
        {
            Caption = 'Chances of Success % Filter';
            DecimalPlaces = 0 : 0;
            FieldClass = FlowFilter;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5095; "Task Status Filter"; Option)
        {
            Caption = 'Task Status Filter';
            FieldClass = FlowFilter;
            OptionCaption = 'Not Started,In Progress,Completed,Waiting,Postponed';
            OptionMembers = "Not Started","In Progress",Completed,Waiting,Postponed;
        }
        field(5096; "Task Closed Filter"; Boolean)
        {
            Caption = 'Task Closed Filter';
            FieldClass = FlowFilter;
        }
        field(5097; "Priority Filter"; Option)
        {
            Caption = 'Priority Filter';
            FieldClass = FlowFilter;
            OptionCaption = 'Low,Normal,High';
            OptionMembers = Low,Normal,High;
        }
        field(5098; "Team Filter"; Code[10])
        {
            Caption = 'Team Filter';
            FieldClass = FlowFilter;
            TableRelation = Team;
        }
        field(5099; "Close Opportunity Filter"; Code[10])
        {
            Caption = 'Close Opportunity Filter';
            FieldClass = FlowFilter;
            TableRelation = "Close Opportunity Code";
        }
        field(5100; "Correspondence Type"; Option)
        {
            Caption = 'Correspondence Type';
            OptionCaption = ' ,Hard Copy,Email,Fax';
            OptionMembers = " ","Hard Copy",Email,Fax;
        }
        field(5101; "Salutation Code"; Code[10])
        {
            Caption = 'Salutation Code';
            TableRelation = Salutation;
        }
        field(5102; "Search E-Mail"; Code[80])
        {
            Caption = 'Search Email';
        }
        field(5104; "Last Time Modified"; Time)
        {
            Caption = 'Last Time Modified';
        }
        field(5105; "E-Mail 2"; Text[80])
        {
            Caption = 'Email 2';
            ExtendedDatatype = EMail;
        }
        field(8050; "Xrm Id"; Guid)
        {
            Caption = 'Xrm Id';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
        key(Key3; "Company Name", "Company No.", Type, Name)
        {
        }
        key(Key4; "Company No.")
        {
        }
        key(Key5; "Territory Code")
        {
        }
        key(Key6; "Salesperson Code")
        {
        }
        key(Key7; "VAT Registration No.")
        {
        }
        key(Key8; "Search E-Mail")
        {
        }
        key(Key9; Name)
        {
        }
        key(Key10; City)
        {
        }
        key(Key11; "Post Code")
        {
        }
        key(Key12; "Phone No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, Type, City, "Post Code", "Phone No.")
        {
        }
        fieldgroup(Brick; "No.", Name, Type, City, "Phone No.", Image)
        {
        }
    }
}

