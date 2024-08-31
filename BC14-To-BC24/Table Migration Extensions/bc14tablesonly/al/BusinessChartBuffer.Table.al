table 485 "Business Chart Buffer"
{
    Caption = 'Business Chart Buffer';
    ReplicateData = false;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            DataClassification = SystemMetadata;
        }
        field(2; "Chart Type"; Option)
        {
            Caption = 'Chart Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Point,,Bubble,Line,,StepLine,,,,,Column,StackedColumn,StackedColumn100,Area,,StackedArea,StackedArea100,Pie,Doughnut,,,Range,,,,Radar,,,,,,,,Funnel';
            OptionMembers = Point,,Bubble,Line,,StepLine,,,,,Column,StackedColumn,StackedColumn100,"Area",,StackedArea,StackedArea100,Pie,Doughnut,,,Range,,,,Radar,,,,,,,,Funnel;
        }
        field(3; "Data Type"; Option)
        {
            Caption = 'Data Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'String,Integer,Decimal,DateTime';
            OptionMembers = String,"Integer",Decimal,DateTime;
        }
        field(4; XML; BLOB)
        {
            Caption = 'XML';
            DataClassification = SystemMetadata;
        }
        field(5; "Drill-Down X Index"; Integer)
        {
            Caption = 'Drill-Down X Index';
            DataClassification = SystemMetadata;
        }
        field(6; "Drill-Down Y Value"; Decimal)
        {
            Caption = 'Drill-Down Y Value';
            DataClassification = SystemMetadata;
        }
        field(7; "Drill-Down Measure Index"; Integer)
        {
            Caption = 'Drill-Down Measure Index';
            DataClassification = SystemMetadata;
        }
        field(8; "Period Length"; Option)
        {
            Caption = 'Period Length';
            DataClassification = SystemMetadata;
            OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period,None';
            OptionMembers = Day,Week,Month,Quarter,Year,"Accounting Period","None";
        }
        field(9; "Period Filter Start Date"; Date)
        {
            Caption = 'Period Filter Start Date';
            DataClassification = SystemMetadata;
        }
        field(10; "Period Filter End Date"; Date)
        {
            Caption = 'Period Filter End Date';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

