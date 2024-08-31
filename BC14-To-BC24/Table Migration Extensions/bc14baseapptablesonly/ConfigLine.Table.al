table 8622 "Config. Line"
{
    Caption = 'Config. Line';
    DataCaptionFields = Name;
    ReplicateData = false;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(2; "Line Type"; Option)
        {
            Caption = 'Line Type';
            OptionCaption = 'Area,Group,Table';
            OptionMembers = "Area",Group,"Table";
        }
        field(3; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = IF ("Line Type" = CONST (Table)) AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Table),
                                                                                               "Object ID" = FILTER (.. 1260 | 1262 .. 99000999 | 2000000004 | 2000000005));
        }
        field(4; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(5; "Company Filter"; Text[30])
        {
            Caption = 'Company Filter';
            FieldClass = FlowFilter;
            TableRelation = Company;
        }
        field(6; "Company Filter (Source Table)"; Text[30])
        {
            Caption = 'Company Filter (Source Table)';
            FieldClass = FlowFilter;
            TableRelation = Company;
        }
        field(8; "No. of Records"; Integer)
        {
            BlankZero = true;
            CalcFormula = Sum ("Table Information"."No. of Records" WHERE ("Company Name" = FIELD ("Company Filter"),
                                                                          "Table No." = FIELD ("Table ID")));
            Caption = 'No. of Records';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "No. of Records (Source Table)"; Integer)
        {
            BlankZero = true;
            CalcFormula = Sum ("Table Information"."No. of Records" WHERE ("Company Name" = FIELD ("Company Filter (Source Table)"),
                                                                          "Table No." = FIELD ("Table ID")));
            Caption = 'No. of Records (Source Table)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Licensed Table"; Boolean)
        {
            BlankZero = true;
            CalcFormula = Exist ("License Permission" WHERE ("Object Type" = CONST (TableData),
                                                            "Object Number" = FIELD ("Table ID"),
                                                            "Read Permission" = CONST (Yes),
                                                            "Insert Permission" = CONST (Yes),
                                                            "Modify Permission" = CONST (Yes),
                                                            "Delete Permission" = CONST (Yes)));
            Caption = 'Licensed Table';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Promoted Table"; Boolean)
        {
            Caption = 'Promoted Table';
        }
        field(12; "Dimensions as Columns"; Boolean)
        {
            Caption = 'Dimensions as Columns';
        }
        field(13; "Copying Available"; Boolean)
        {
            Caption = 'Copying Available';
            Editable = false;
        }
        field(14; "Page ID"; Integer)
        {
            Caption = 'Page ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Page));
        }
        field(15; "Page Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Name" WHERE ("Object Type" = CONST (Page),
                                                                        "Object ID" = FIELD ("Page ID")));
            Caption = 'Page Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(19; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(20; "Responsible ID"; Code[50])
        {
            Caption = 'Responsible ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(21; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = ' ,In Progress,Completed,Ignored,Blocked';
            OptionMembers = " ","In Progress",Completed,Ignored,Blocked;
        }
        field(25; "Vertical Sorting"; Integer)
        {
            Caption = 'Vertical Sorting';
        }
        field(26; "Data Origin"; Text[50])
        {
            Caption = 'Data Origin';
        }
        field(28; Reference; Text[250])
        {
            Caption = 'Reference';
            ExtendedDatatype = URL;
        }
        field(30; "Licensed Page"; Boolean)
        {
            BlankZero = true;
            CalcFormula = Exist ("License Permission" WHERE ("Object Type" = CONST (Page),
                                                            "Object Number" = FIELD ("Page ID"),
                                                            "Execute Permission" = CONST (Yes)));
            Caption = 'Licensed Page';
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "No. of Question Groups"; Integer)
        {
            CalcFormula = Count ("Config. Question Area" WHERE ("Table ID" = FIELD ("Table ID")));
            Caption = 'No. of Question Groups';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Parent Line No."; Integer)
        {
            Caption = 'Parent Line No.';
        }
        field(36; "Package Code"; Code[20])
        {
            Caption = 'Package Code';
            TableRelation = "Config. Package";
        }
        field(37; "Package Caption"; Text[50])
        {
            CalcFormula = Lookup ("Config. Package"."Package Name" WHERE (Code = FIELD ("Package Code")));
            Caption = 'Package Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(38; "Package Exists"; Boolean)
        {
            CalcFormula = Exist ("Config. Package" WHERE (Code = FIELD ("Package Code")));
            Caption = 'Package Exists';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Line Type", Status, "Promoted Table")
        {
        }
        key(Key3; "Table ID")
        {
        }
        key(Key4; "Vertical Sorting")
        {
        }
        key(Key5; "Line Type", "Parent Line No.")
        {
        }
        key(Key6; "Package Code")
        {
        }
    }

    fieldgroups
    {
    }
}

