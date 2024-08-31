table 5510 "Employee Time Reg Buffer"
{
    Caption = 'Employee Time Reg Buffer';
    ReplicateData = false;

    fields
    {
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = SystemMetadata;
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
            DataClassification = SystemMetadata;
            NotBlank = true;
        }
        field(6; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = SystemMetadata;
            TableRelation = Job;
        }
        field(7; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = SystemMetadata;
            TableRelation = "Job Task"."Job Task No." WHERE ("Job No." = FIELD ("Job No."));
        }
        field(9; "Cause of Absence Code"; Code[10])
        {
            Caption = 'Cause of Absence Code';
            DataClassification = SystemMetadata;
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = SystemMetadata;
            NotBlank = true;
        }
        field(20; Status; Option)
        {
            Caption = 'Status';
            DataClassification = SystemMetadata;
            OptionCaption = 'Open,Submitted,Rejected,Approved';
            OptionMembers = Open,Submitted,Rejected,Approved;
        }
        field(21; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            DataClassification = SystemMetadata;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = SystemMetadata;
        }
        field(5407; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = SystemMetadata;
            TableRelation = "Unit of Measure";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(7999; "Employee Id"; Guid)
        {
            Caption = 'Employee Id';
            DataClassification = SystemMetadata;
            NotBlank = true;
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(8001; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(8002; "Job Id"; Guid)
        {
            Caption = 'Job Id';
            DataClassification = SystemMetadata;
        }
        field(9032; "Unit of Measure Id"; Guid)
        {
            Caption = 'Unit of Measure Id';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

