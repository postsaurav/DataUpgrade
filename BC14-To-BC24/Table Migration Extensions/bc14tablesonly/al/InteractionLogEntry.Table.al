table 5065 "Interaction Log Entry"
{
    Caption = 'Interaction Log Entry';
    ReplicateData = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            TableRelation = Contact;
        }
        field(3; "Contact Company No."; Code[20])
        {
            Caption = 'Contact Company No.';
            TableRelation = Contact WHERE (Type = CONST (Company));
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(6; "Information Flow"; Option)
        {
            Caption = 'Information Flow';
            OptionCaption = ' ,Outbound,Inbound';
            OptionMembers = " ",Outbound,Inbound;
        }
        field(7; "Initiated By"; Option)
        {
            Caption = 'Initiated By';
            OptionCaption = ' ,Us,Them';
            OptionMembers = " ",Us,Them;
        }
        field(8; "Attachment No."; Integer)
        {
            Caption = 'Attachment No.';
            TableRelation = Attachment;
        }
        field(9; "Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost (LCY)';
            Editable = false;
        }
        field(10; "Duration (Min.)"; Decimal)
        {
            Caption = 'Duration (Min.)';
            DecimalPlaces = 0 : 0;
            Editable = false;
        }
        field(11; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(12; "Interaction Group Code"; Code[10])
        {
            Caption = 'Interaction Group Code';
            TableRelation = "Interaction Group";
        }
        field(13; "Interaction Template Code"; Code[10])
        {
            Caption = 'Interaction Template Code';
            TableRelation = "Interaction Template";
        }
        field(14; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;
        }
        field(15; "Campaign Entry No."; Integer)
        {
            Caption = 'Campaign Entry No.';
            TableRelation = "Campaign Entry" WHERE ("Campaign No." = FIELD ("Campaign No."));
        }
        field(16; "Campaign Response"; Boolean)
        {
            Caption = 'Campaign Response';
        }
        field(17; "Campaign Target"; Boolean)
        {
            Caption = 'Campaign Target';
        }
        field(18; "Segment No."; Code[20])
        {
            Caption = 'Segment No.';
        }
        field(19; Evaluation; Option)
        {
            Caption = 'Evaluation';
            Editable = false;
            OptionCaption = ' ,Very Positive,Positive,Neutral,Negative,Very Negative';
            OptionMembers = " ","Very Positive",Positive,Neutral,Negative,"Very Negative";
        }
        field(20; "Time of Interaction"; Time)
        {
            Caption = 'Time of Interaction';
        }
        field(21; "Attempt Failed"; Boolean)
        {
            Caption = 'Attempt Failed';
        }
        field(23; "To-do No."; Code[20])
        {
            Caption = 'Task No.';
            TableRelation = "To-do";
        }
        field(24; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(25; "Delivery Status"; Option)
        {
            Caption = 'Delivery Status';
            OptionCaption = ' ,In Progress,Error';
            OptionMembers = " ","In Progress",Error;
        }
        field(26; Canceled; Boolean)
        {
            Caption = 'Canceled';
        }
        field(27; "Correspondence Type"; Option)
        {
            Caption = 'Correspondence Type';
            OptionCaption = ' ,Hard Copy,Email,Fax';
            OptionMembers = " ","Hard Copy",Email,Fax;
        }
        field(28; "Contact Alt. Address Code"; Code[10])
        {
            Caption = 'Contact Alt. Address Code';
            TableRelation = "Contact Alt. Address".Code WHERE ("Contact No." = FIELD ("Contact No."));
        }
        field(29; "Logged Segment Entry No."; Integer)
        {
            Caption = 'Logged Segment Entry No.';
            TableRelation = "Logged Segment";
        }
        field(30; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Sales Qte.,Sales Blnkt. Ord,Sales Ord. Cnfrmn.,Sales Inv.,Sales Shpt. Note,Sales Cr. Memo,Sales Stmnt.,Sales Rmdr.,Serv. Ord. Create,Serv. Ord. Post,Purch.Qte.,Purch. Blnkt. Ord.,Purch. Ord.,Purch. Inv.,Purch. Rcpt.,Purch. Cr. Memo,Cover Sheet,Sales Return Order,Sales Finance Charge Memo,Sales Return Receipt,Purch. Return Shipment,Purch. Return Ord. Cnfrmn.,Service Contract,Service Contract Quote,Service Quote';
            OptionMembers = " ","Sales Qte.","Sales Blnkt. Ord","Sales Ord. Cnfrmn.","Sales Inv.","Sales Shpt. Note","Sales Cr. Memo","Sales Stmnt.","Sales Rmdr.","Serv. Ord. Create","Serv. Ord. Post","Purch.Qte.","Purch. Blnkt. Ord.","Purch. Ord.","Purch. Inv.","Purch. Rcpt.","Purch. Cr. Memo","Cover Sheet","Sales Return Order","Sales Finance Charge Memo","Sales Return Receipt","Purch. Return Shipment","Purch. Return Ord. Cnfrmn.","Service Contract","Service Contract Quote","Service Quote";
        }
        field(31; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(32; "Version No."; Integer)
        {
            Caption = 'Version No.';
        }
        field(33; "Doc. No. Occurrence"; Integer)
        {
            Caption = 'Doc. No. Occurrence';
        }
        field(34; "Contact Via"; Text[80])
        {
            Caption = 'Contact Via';
        }
        field(35; "Send Word Docs. as Attmt."; Boolean)
        {
            Caption = 'Send Word Docs. as Attmt.';
        }
        field(36; "Interaction Language Code"; Code[10])
        {
            Caption = 'Interaction Language Code';
            TableRelation = Language;
        }
        field(37; "E-Mail Logged"; Boolean)
        {
            Caption = 'Email Logged';
        }
        field(38; Subject; Text[100])
        {
            Caption = 'Subject';
        }
        field(39; "Contact Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact No.")));
            Caption = 'Contact Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Contact Company Name"; Text[100])
        {
            CalcFormula = Lookup (Contact.Name WHERE ("No." = FIELD ("Contact Company No."),
                                                     Type = CONST (Company)));
            Caption = 'Contact Company Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; Comment; Boolean)
        {
            CalcFormula = Exist ("Inter. Log Entry Comment Line" WHERE ("Entry No." = FIELD ("Entry No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(44; "Opportunity No."; Code[20])
        {
            Caption = 'Opportunity No.';
            TableRelation = Opportunity;
        }
        field(45; Postponed; Boolean)
        {
            Caption = 'Postponed';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Contact Company No.", "Contact No.", Date, Postponed)
        {
            SumIndexFields = "Cost (LCY)", "Duration (Min.)";
        }
        key(Key3; "Contact Company No.", Date, "Contact No.", Canceled, "Initiated By", "Attempt Failed", Postponed)
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Cost (LCY)", "Duration (Min.)";
        }
        key(Key4; "Interaction Group Code", Date)
        {
        }
        key(Key5; "Interaction Group Code", Canceled, Date, Postponed)
        {
            SumIndexFields = "Cost (LCY)", "Duration (Min.)";
        }
        key(Key6; "Interaction Template Code", Date)
        {
        }
        key(Key7; "Interaction Template Code", Canceled, Date, Postponed)
        {
            SumIndexFields = "Cost (LCY)", "Duration (Min.)";
        }
        key(Key8; Canceled, "Campaign No.", "Campaign Entry No.", Date, Postponed)
        {
            SumIndexFields = "Cost (LCY)", "Duration (Min.)";
        }
        key(Key9; "Campaign No.", "Campaign Entry No.", Date, Postponed)
        {
            SumIndexFields = "Cost (LCY)", "Duration (Min.)";
        }
        key(Key10; "Salesperson Code", Date, Postponed)
        {
            SumIndexFields = "Cost (LCY)", "Duration (Min.)";
        }
        key(Key11; Canceled, "Salesperson Code", Date, Postponed)
        {
            SumIndexFields = "Cost (LCY)", "Duration (Min.)";
        }
        key(Key12; "Logged Segment Entry No.", Postponed)
        {
        }
        key(Key13; "Attachment No.")
        {
        }
        key(Key14; "To-do No.", Date)
        {
        }
        key(Key15; "Contact No.", "Correspondence Type", "E-Mail Logged", Subject, Postponed)
        {
        }
        key(Key16; "Campaign No.", "Campaign Target")
        {
        }
        key(Key17; "Campaign No.", "Contact Company No.", "Campaign Target", Postponed)
        {
        }
        key(Key18; "Opportunity No.", Date)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", Description, "Contact No.", Date)
        {
        }
        fieldgroup(Brick; "Salesperson Code", Description, Date, "Contact Name", "Contact Company Name")
        {
        }
    }
}

