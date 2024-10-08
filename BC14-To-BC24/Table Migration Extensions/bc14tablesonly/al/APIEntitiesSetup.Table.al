table 5466 "API Entities Setup"
{
    Caption = 'API Entities Setup';

    fields
    {
        field(1; PrimaryKey; Code[20])
        {
            Caption = 'PrimaryKey', Locked = true;
        }
        field(3; "Customer Payments Batch Name"; Code[10])
        {
            Caption = 'Customer Payments Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE ("Journal Template Name" = CONST ('CASHRCPT'));
        }
        field(4; "Demo Company API Initialized"; Boolean)
        {
            Caption = 'Demo Company API Initialized';
        }
    }

    keys
    {
        key(Key1; PrimaryKey)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

