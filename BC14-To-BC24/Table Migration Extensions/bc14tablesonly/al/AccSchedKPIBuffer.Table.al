table 197 "Acc. Sched. KPI Buffer"
{
    Caption = 'Acc. Sched. KPI Buffer';
    ReplicateData = false;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = SystemMetadata;
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
            DataClassification = SystemMetadata;
        }
        field(3; "Closed Period"; Boolean)
        {
            Caption = 'Closed Period';
            DataClassification = SystemMetadata;
        }
        field(4; "Account Schedule Name"; Code[10])
        {
            Caption = 'Account Schedule Name';
            DataClassification = SystemMetadata;
        }
        field(5; "KPI Code"; Code[10])
        {
            Caption = 'KPI Code';
            DataClassification = SystemMetadata;
        }
        field(6; "KPI Name"; Text[50])
        {
            Caption = 'KPI Name';
            DataClassification = SystemMetadata;
        }
        field(7; "Net Change Actual"; Decimal)
        {
            Caption = 'Net Change Actual';
            DataClassification = SystemMetadata;
        }
        field(8; "Balance at Date Actual"; Decimal)
        {
            Caption = 'Balance at Date Actual';
            DataClassification = SystemMetadata;
        }
        field(9; "Net Change Budget"; Decimal)
        {
            Caption = 'Net Change Budget';
            DataClassification = SystemMetadata;
        }
        field(10; "Balance at Date Budget"; Decimal)
        {
            Caption = 'Balance at Date Budget';
            DataClassification = SystemMetadata;
        }
        field(11; "Net Change Actual Last Year"; Decimal)
        {
            Caption = 'Net Change Actual Last Year';
            DataClassification = SystemMetadata;
        }
        field(12; "Balance at Date Act. Last Year"; Decimal)
        {
            Caption = 'Balance at Date Act. Last Year';
            DataClassification = SystemMetadata;
        }
        field(13; "Net Change Budget Last Year"; Decimal)
        {
            Caption = 'Net Change Budget Last Year';
            DataClassification = SystemMetadata;
        }
        field(14; "Balance at Date Bud. Last Year"; Decimal)
        {
            Caption = 'Balance at Date Bud. Last Year';
            DataClassification = SystemMetadata;
        }
        field(15; "Net Change Forecast"; Decimal)
        {
            Caption = 'Net Change Forecast';
            DataClassification = SystemMetadata;
        }
        field(16; "Balance at Date Forecast"; Decimal)
        {
            Caption = 'Balance at Date Forecast';
            DataClassification = SystemMetadata;
        }
        field(17; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Account Schedule Name", "KPI Code", "Dimension Set ID")
        {
        }
    }

    fieldgroups
    {
    }
}

