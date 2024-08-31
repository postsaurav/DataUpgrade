table 5088 "Profile Questionnaire Line"
{
    Caption = 'Profile Questionnaire Line';
    DataCaptionFields = "Profile Questionnaire Code", Description;

    fields
    {
        field(1; "Profile Questionnaire Code"; Code[20])
        {
            Caption = 'Profile Questionnaire Code';
            TableRelation = "Profile Questionnaire Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Question,Answer';
            OptionMembers = Question,Answer;
        }
        field(4; Description; Text[250])
        {
            Caption = 'Description';
            NotBlank = true;
        }
        field(5; "Multiple Answers"; Boolean)
        {
            Caption = 'Multiple Answers';
        }
        field(6; "Auto Contact Classification"; Boolean)
        {
            Caption = 'Auto Contact Classification';
        }
        field(7; "Customer Class. Field"; Option)
        {
            Caption = 'Customer Class. Field';
            OptionCaption = ' ,Sales (LCY),Profit (LCY),Sales Frequency (Invoices/Year),Avg. Invoice Amount (LCY),Discount (%),Avg. Overdue (Day)';
            OptionMembers = " ","Sales (LCY)","Profit (LCY)","Sales Frequency (Invoices/Year)","Avg. Invoice Amount (LCY)","Discount (%)","Avg. Overdue (Day)";
        }
        field(8; "Vendor Class. Field"; Option)
        {
            Caption = 'Vendor Class. Field';
            OptionCaption = ' ,Purchase (LCY),Purchase Frequency (Invoices/Year),Avg. Ticket Size (LCY),Discount (%),Avg. Overdue (Day)';
            OptionMembers = " ","Purchase (LCY)","Purchase Frequency (Invoices/Year)","Avg. Ticket Size (LCY)","Discount (%)","Avg. Overdue (Day)";
        }
        field(9; "Contact Class. Field"; Option)
        {
            Caption = 'Contact Class. Field';
            OptionCaption = ' ,Interaction Quantity,Interaction Frequency (No./Year),Avg. Interaction Cost (LCY),Avg. Interaction Duration (Min.),Opportunity Won (%),Rating';
            OptionMembers = " ","Interaction Quantity","Interaction Frequency (No./Year)","Avg. Interaction Cost (LCY)","Avg. Interaction Duration (Min.)","Opportunity Won (%)",Rating;
        }
        field(10; "Starting Date Formula"; DateFormula)
        {
            Caption = 'Starting Date Formula';
        }
        field(11; "Ending Date Formula"; DateFormula)
        {
            Caption = 'Ending Date Formula';
        }
        field(12; "Classification Method"; Option)
        {
            Caption = 'Classification Method';
            OptionCaption = ' ,Defined Value,Percentage of Value,Percentage of Contacts';
            OptionMembers = " ","Defined Value","Percentage of Value","Percentage of Contacts";
        }
        field(13; "Sorting Method"; Option)
        {
            Caption = 'Sorting Method';
            OptionCaption = ' ,Descending,Ascending';
            OptionMembers = " ","Descending","Ascending";
        }
        field(14; "From Value"; Decimal)
        {
            BlankZero = true;
            Caption = 'From Value';
            DecimalPlaces = 0 : 25;
        }
        field(15; "To Value"; Decimal)
        {
            BlankZero = true;
            Caption = 'To Value';
            DecimalPlaces = 0 : 25;
        }
        field(16; "No. of Contacts"; Integer)
        {
            BlankZero = true;
            CalcFormula = Count ("Contact Profile Answer" WHERE ("Profile Questionnaire Code" = FIELD ("Profile Questionnaire Code"),
                                                                "Line No." = FIELD ("Line No.")));
            Caption = 'No. of Contacts';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; Priority; Option)
        {
            Caption = 'Priority';
            InitValue = Normal;
            OptionCaption = 'Very Low (Hidden),Low,Normal,High,Very High';
            OptionMembers = "Very Low (Hidden)",Low,Normal,High,"Very High";
        }
        field(18; "No. of Decimals"; Integer)
        {
            Caption = 'No. of Decimals';
            MaxValue = 25;
            MinValue = -25;
        }
        field(19; "Min. % Questions Answered"; Decimal)
        {
            Caption = 'Min. % Questions Answered';
            DecimalPlaces = 0 : 0;
            MaxValue = 100;
            MinValue = 0;
        }
        field(9501; "Wizard Step"; Option)
        {
            Caption = 'Wizard Step';
            Editable = false;
            OptionCaption = ' ,1,2,3,4,5,6';
            OptionMembers = " ","1","2","3","4","5","6";
        }
        field(9502; "Interval Option"; Option)
        {
            Caption = 'Interval Option';
            OptionCaption = 'Minimum,Maximum,Interval';
            OptionMembers = Minimum,Maximum,Interval;
        }
        field(9503; "Answer Option"; Option)
        {
            Caption = 'Answer Option';
            OptionCaption = 'HighLow,ABC,Custom';
            OptionMembers = HighLow,ABC,Custom;
        }
        field(9504; "Answer Description"; Text[250])
        {
            Caption = 'Answer Description';
        }
        field(9505; "Wizard From Value"; Decimal)
        {
            BlankZero = true;
            Caption = 'Wizard From Value';
            DecimalPlaces = 0 : 25;
        }
        field(9506; "Wizard To Value"; Decimal)
        {
            BlankZero = true;
            Caption = 'Wizard To Value';
            DecimalPlaces = 0 : 25;
        }
        field(9707; "Wizard From Line No."; Integer)
        {
            BlankZero = true;
            Caption = 'Wizard From Line No.';
        }
    }

    keys
    {
        key(Key1; "Profile Questionnaire Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; Type, Description, Priority, "Multiple Answers", "Auto Contact Classification", "No. of Contacts")
        {
        }
    }
}

