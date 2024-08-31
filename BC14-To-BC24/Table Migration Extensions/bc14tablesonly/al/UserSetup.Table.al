table 91 "User Setup"
{
    Caption = 'User Setup';
    ReplicateData = false;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(2; "Allow Posting From"; Date)
        {
            Caption = 'Allow Posting From';
        }
        field(3; "Allow Posting To"; Date)
        {
            Caption = 'Allow Posting To';
        }
        field(4; "Register Time"; Boolean)
        {
            Caption = 'Register Time';
        }
        field(10; "Salespers./Purch. Code"; Code[20])
        {
            Caption = 'Salespers./Purch. Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(11; "Approver ID"; Code[50])
        {
            Caption = 'Approver ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup"."User ID";
        }
        field(12; "Sales Amount Approval Limit"; Integer)
        {
            BlankZero = true;
            Caption = 'Sales Amount Approval Limit';
        }
        field(13; "Purchase Amount Approval Limit"; Integer)
        {
            BlankZero = true;
            Caption = 'Purchase Amount Approval Limit';
        }
        field(14; "Unlimited Sales Approval"; Boolean)
        {
            Caption = 'Unlimited Sales Approval';
        }
        field(15; "Unlimited Purchase Approval"; Boolean)
        {
            Caption = 'Unlimited Purchase Approval';
        }
        field(16; Substitute; Code[50])
        {
            Caption = 'Substitute';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup"."User ID";
        }
        field(17; "E-Mail"; Text[100])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(19; "Request Amount Approval Limit"; Integer)
        {
            BlankZero = true;
            Caption = 'Request Amount Approval Limit';
        }
        field(20; "Unlimited Request Approval"; Boolean)
        {
            Caption = 'Unlimited Request Approval';
        }
        field(21; "Approval Administrator"; Boolean)
        {
            Caption = 'Approval Administrator';
        }
        field(31; "License Type"; Option)
        {
            CalcFormula = Lookup (User."License Type" WHERE ("User Name" = FIELD ("User ID")));
            Caption = 'License Type';
            FieldClass = FlowField;
            OptionCaption = 'Full User,Limited User,Device Only User,Windows Group,External User';
            OptionMembers = "Full User","Limited User","Device Only User","Windows Group","External User";
        }
        field(950; "Time Sheet Admin."; Boolean)
        {
            Caption = 'Time Sheet Admin.';
        }
        field(5600; "Allow FA Posting From"; Date)
        {
            Caption = 'Allow FA Posting From';
        }
        field(5601; "Allow FA Posting To"; Date)
        {
            Caption = 'Allow FA Posting To';
        }
        field(5700; "Sales Resp. Ctr. Filter"; Code[10])
        {
            Caption = 'Sales Resp. Ctr. Filter';
            TableRelation = "Responsibility Center".Code;
        }
        field(5701; "Purchase Resp. Ctr. Filter"; Code[10])
        {
            Caption = 'Purchase Resp. Ctr. Filter';
            TableRelation = "Responsibility Center";
        }
        field(5900; "Service Resp. Ctr. Filter"; Code[10])
        {
            Caption = 'Service Resp. Ctr. Filter';
            TableRelation = "Responsibility Center";
        }
    }

    keys
    {
        key(Key1; "User ID")
        {
            Clustered = true;
        }
        key(Key2; "Salespers./Purch. Code")
        {
        }
    }

    fieldgroups
    {
    }
}

