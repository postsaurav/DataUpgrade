table 135 "Acc. Sched. KPI Web Srv. Setup"
{
    Caption = 'Acc. Sched. KPI Web Srv. Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Forecasted Values Start"; Option)
        {
            Caption = 'Forecasted Values Start';
            OptionCaption = 'After Latest Closed Period,After Current Date';
            OptionMembers = "After Latest Closed Period","After Current Date";
        }
        field(3; "G/L Budget Name"; Code[10])
        {
            Caption = 'G/L Budget Name';
            TableRelation = "G/L Budget Name";
        }
        field(4; Period; Option)
        {
            Caption = 'Period';
            OptionCaption = 'Fiscal Year - Last Locked Period,Current Fiscal Year,Current Calendar Year,Current Calendar Quarter,Current Month,Today,Current Period,Last Locked Period,Current Fiscal Year + 3 Previous Years';
            OptionMembers = "Fiscal Year - Last Locked Period","Current Fiscal Year","Current Calendar Year","Current Calendar Quarter","Current Month",Today,"Current Period","Last Locked Period","Current Fiscal Year + 3 Previous Years";
        }
        field(5; "View By"; Option)
        {
            Caption = 'View By';
            InitValue = Month;
            OptionCaption = 'Day,Week,Month,Quarter,Year,Period';
            OptionMembers = Day,Week,Month,Quarter,Year,Period;
        }
        field(6; "Web Service Name"; Text[240])
        {
            Caption = 'Web Service Name';
        }
        field(7; Published; Boolean)
        {
            CalcFormula = Exist ("Web Service" WHERE ("Object Type" = CONST (Page),
                                                     "Object ID" = CONST (197),
                                                     Published = CONST (true)));
            Caption = 'Published';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Data Last Updated"; DateTime)
        {
            Caption = 'Data Last Updated';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(9; "Last G/L Entry Included"; Integer)
        {
            Caption = 'Last G/L Entry Included';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(10; "Data Time To Live (hours)"; Integer)
        {
            Caption = 'Data Time To Live (hours)';
            InitValue = 24;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

