table 8613 "Config. Package Table"
{
    Caption = 'Config. Package Table';
    ReplicateData = false;

    fields
    {
        field(1; "Package Code"; Code[20])
        {
            Caption = 'Package Code';
            TableRelation = "Config. Package";
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            NotBlank = true;
            TableRelation = AllObj."Object ID" WHERE ("Object Type" = CONST (Table));
        }
        field(3; "Table Name"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE ("Object Type" = CONST (Table),
                                                                        "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "No. of Package Records"; Integer)
        {
            CalcFormula = Count ("Config. Package Record" WHERE ("Package Code" = FIELD ("Package Code"),
                                                                "Table ID" = FIELD ("Table ID")));
            Caption = 'No. of Package Records';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "No. of Package Errors"; Integer)
        {
            CalcFormula = Count ("Config. Package Error" WHERE ("Package Code" = FIELD ("Package Code"),
                                                               "Table ID" = FIELD ("Table ID")));
            Caption = 'No. of Package Errors';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Imported Date and Time"; DateTime)
        {
            Caption = 'Imported Date and Time';
            Editable = false;
        }
        field(8; "Exported Date and Time"; DateTime)
        {
            Caption = 'Exported Date and Time';
            Editable = false;
        }
        field(9; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(10; "Created Date and Time"; DateTime)
        {
            Caption = 'Created Date and Time';
        }
        field(11; "Company Filter (Source Table)"; Text[30])
        {
            Caption = 'Company Filter (Source Table)';
            FieldClass = FlowFilter;
            TableRelation = Company;
        }
        field(12; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Table),
                                                                           "Object ID" = FIELD ("Table ID")));
            Caption = 'Table Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Data Template"; Code[10])
        {
            Caption = 'Data Template';
            TableRelation = "Config. Template Header";
        }
        field(14; "Package Processing Order"; Integer)
        {
            Caption = 'Package Processing Order';
            Editable = false;
        }
        field(15; "Page ID"; Integer)
        {
            Caption = 'Page ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Page));
        }
        field(16; "Processing Order"; Integer)
        {
            Caption = 'Processing Order';
        }
        field(17; "No. of Fields Included"; Integer)
        {
            CalcFormula = Count ("Config. Package Field" WHERE ("Package Code" = FIELD ("Package Code"),
                                                               "Table ID" = FIELD ("Table ID"),
                                                               "Include Field" = CONST (true)));
            Caption = 'No. of Fields Included';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "No. of Fields Available"; Integer)
        {
            CalcFormula = Count ("Config. Package Field" WHERE ("Package Code" = FIELD ("Package Code"),
                                                               "Table ID" = FIELD ("Table ID")));
            Caption = 'No. of Fields Available';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "No. of Fields to Validate"; Integer)
        {
            CalcFormula = Count ("Config. Package Field" WHERE ("Package Code" = FIELD ("Package Code"),
                                                               "Table ID" = FIELD ("Table ID"),
                                                               "Validate Field" = CONST (true)));
            Caption = 'No. of Fields to Validate';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Package Caption"; Text[50])
        {
            CalcFormula = Lookup ("Config. Package"."Package Name" WHERE (Code = FIELD ("Package Code")));
            Caption = 'Package Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Imported by User ID"; Code[50])
        {
            Caption = 'Imported by User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(22; "Created by User ID"; Code[50])
        {
            Caption = 'Created by User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(24; "Dimensions as Columns"; Boolean)
        {
            Caption = 'Dimensions as Columns';
        }
        field(25; Filtered; Boolean)
        {
            CalcFormula = Exist ("Config. Package Filter" WHERE ("Package Code" = FIELD ("Package Code"),
                                                                "Table ID" = FIELD ("Table ID")));
            Caption = 'Filtered';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Skip Table Triggers"; Boolean)
        {
            Caption = 'Skip Table Triggers';
        }
        field(27; "Delete Recs Before Processing"; Boolean)
        {
            Caption = 'Delete Recs Before Processing';
        }
        field(28; "Processing Report ID"; Integer)
        {
            Caption = 'Processing Report ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Report));
        }
        field(29; "Parent Table ID"; Integer)
        {
            Caption = 'Parent Table ID';
            TableRelation = "Config. Package Table"."Table ID" WHERE ("Package Code" = FIELD ("Package Code"));
        }
        field(30; Validated; Boolean)
        {
            Caption = 'Validated';
        }
        field(31; "Delayed Insert"; Boolean)
        {
            Caption = 'Delayed Insert';
        }
    }

    keys
    {
        key(Key1; "Package Code", "Table ID")
        {
            Clustered = true;
        }
        key(Key2; "Package Processing Order", "Processing Order")
        {
        }
    }

    fieldgroups
    {
    }
}

