table 5077 "Segment Line"
{
    Caption = 'Segment Line';

    fields
    {
        field(1; "Segment No."; Code[20])
        {
            Caption = 'Segment No.';
            TableRelation = "Segment Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = Contact;
        }
        field(4; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(5; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(6; "Correspondence Type"; Option)
        {
            Caption = 'Correspondence Type';
            OptionCaption = ' ,Hard Copy,Email,Fax';
            OptionMembers = " ","Hard Copy",Email,Fax;
        }
        field(7; "Interaction Template Code"; Code[10])
        {
            Caption = 'Interaction Template Code';
            TableRelation = "Interaction Template";
        }
        field(8; "Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost (LCY)';
            MinValue = 0;
        }
        field(9; "Duration (Min.)"; Decimal)
        {
            Caption = 'Duration (Min.)';
            DecimalPlaces = 0 : 0;
            MinValue = 0;
        }
        field(10; "Attachment No."; Integer)
        {
            Caption = 'Attachment No.';
            TableRelation = Attachment;
        }
        field(11; "Campaign Response"; Boolean)
        {
            Caption = 'Campaign Response';
        }
        field(12; "Contact Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact No."),
                                                     Type = CONST (Person)));
            Caption = 'Contact Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Information Flow"; Option)
        {
            BlankZero = true;
            Caption = 'Information Flow';
            OptionCaption = ' ,Outbound,Inbound';
            OptionMembers = " ",Outbound,Inbound;
        }
        field(14; "Initiated By"; Option)
        {
            BlankZero = true;
            Caption = 'Initiated By';
            OptionCaption = ' ,Us,Them';
            OptionMembers = " ",Us,Them;
        }
        field(15; "Contact Alt. Address Code"; Code[10])
        {
            Caption = 'Contact Alt. Address Code';
            TableRelation = "Contact Alt. Address".Code WHERE ("Contact No." = FIELD ("Contact No."));
        }
        field(16; Evaluation; Option)
        {
            Caption = 'Evaluation';
            OptionCaption = ' ,Very Positive,Positive,Neutral,Negative,Very Negative';
            OptionMembers = " ","Very Positive",Positive,Neutral,Negative,"Very Negative";
        }
        field(17; "Campaign Target"; Boolean)
        {
            Caption = 'Campaign Target';
        }
        field(18; "Contact Company Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact Company No."),
                                                     Type = CONST (Company)));
            Caption = 'Contact Company Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(22; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(23; Date; Date)
        {
            Caption = 'Date';
        }
        field(24; "Time of Interaction"; Time)
        {
            Caption = 'Time of Interaction';
        }
        field(25; "Attempt Failed"; Boolean)
        {
            Caption = 'Attempt Failed';
        }
        field(26; "To-do No."; Code[20])
        {
            Caption = 'Task No.';
            TableRelation = "To-do";
        }
        field(27; "Contact Company No."; Code[20])
        {
            Caption = 'Contact Company No.';
            TableRelation = Contact WHERE (Type = CONST (Company));
        }
        field(28; "Campaign Entry No."; Integer)
        {
            Caption = 'Campaign Entry No.';
            Editable = false;
            TableRelation = "Campaign Entry";
        }
        field(29; "Interaction Group Code"; Code[10])
        {
            Caption = 'Interaction Group Code';
            TableRelation = "Interaction Group";
        }
        field(31; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Sales Qte.,Sales Blnkt. Ord,Sales Ord. Cnfrmn.,Sales Inv.,Sales Shpt. Note,Sales Cr. Memo,Sales Stmnt.,Sales Rmdr.,Serv. Ord. Create,Serv. Ord. Post,Purch.Qte.,Purch. Blnkt. Ord.,Purch. Ord.,Purch. Inv.,Purch. Rcpt.,Purch. Cr. Memo,Cover Sheet';
            OptionMembers = " ","Sales Qte.","Sales Blnkt. Ord","Sales Ord. Cnfrmn.","Sales Inv.","Sales Shpt. Note","Sales Cr. Memo","Sales Stmnt.","Sales Rmdr.","Serv. Ord. Create","Serv. Ord. Post","Purch.Qte.","Purch. Blnkt. Ord.","Purch. Ord.","Purch. Inv.","Purch. Rcpt.","Purch. Cr. Memo","Cover Sheet";
        }
        field(32; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(33; "Send Word Doc. As Attmt."; Boolean)
        {
            Caption = 'Send Word Doc. As Attmt.';
        }
        field(34; "Contact Via"; Text[80])
        {
            Caption = 'Contact Via';
        }
        field(35; "Version No."; Integer)
        {
            Caption = 'Version No.';
        }
        field(36; "Doc. No. Occurrence"; Integer)
        {
            Caption = 'Doc. No. Occurrence';
        }
        field(37; Subject; Text[100])
        {
            Caption = 'Subject';
        }
        field(44; "Opportunity No."; Code[20])
        {
            Caption = 'Opportunity No.';
            TableRelation = Opportunity;
        }
        field(9501; "Wizard Step"; Option)
        {
            Caption = 'Wizard Step';
            Editable = false;
            OptionCaption = ' ,1,2,3,4,5,6';
            OptionMembers = " ","1","2","3","4","5","6";
        }
        field(9502; "Wizard Contact Name"; Text[100])
        {
            Caption = 'Wizard Contact Name';
        }
        field(9503; "Opportunity Description"; Text[100])
        {
            Caption = 'Opportunity Description';
        }
        field(9504; "Campaign Description"; Text[100])
        {
            Caption = 'Campaign Description';
        }
        field(9505; "Interaction Successful"; Boolean)
        {
            Caption = 'Interaction Successful';
        }
        field(9506; "Dial Contact"; Boolean)
        {
            Caption = 'Dial Contact';
        }
        field(9507; "Mail Contact"; Boolean)
        {
            Caption = 'Mail Contact';
        }
    }

    keys
    {
        key(Key1; "Segment No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Segment No.", "Campaign No.", Date)
        {
        }
        key(Key3; "Contact No.", "Segment No.")
        {
        }
        key(Key4; "Campaign No.")
        {
        }
        key(Key5; "Campaign No.", "Contact Company No.", "Campaign Target")
        {
        }
    }

    fieldgroups
    {
    }
}

