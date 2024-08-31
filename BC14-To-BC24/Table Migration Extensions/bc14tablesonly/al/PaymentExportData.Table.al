table 1226 "Payment Export Data"
{
    Caption = 'Payment Export Data';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Data Exch Entry No."; Integer)
        {
            Caption = 'Data Exch Entry No.';
            TableRelation = "Data Exch.";
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Data Exch. Line Def Code"; Code[20])
        {
            Caption = 'Data Exch. Line Def Code';
        }
        field(5; "General Journal Template"; Code[10])
        {
            Caption = 'General Journal Template';
            TableRelation = "Gen. Journal Template";
        }
        field(6; "General Journal Batch Name"; Code[10])
        {
            Caption = 'General Journal Batch Name';
            TableRelation = "Gen. Journal Batch";
        }
        field(7; "General Journal Line No."; Integer)
        {
            Caption = 'General Journal Line No.';
        }
        field(28; "Sender Bank Name - Data Conv."; Text[50])
        {
            Caption = 'Sender Bank Name - Data Conv.';
        }
        field(29; "Sender Bank Name"; Text[100])
        {
            Caption = 'Sender Bank Name';
        }
        field(30; "Sender Bank Account Code"; Code[20])
        {
            Caption = 'Sender Bank Account Code';
            TableRelation = "Bank Account";
        }
        field(31; "Sender Bank Account No."; Text[50])
        {
            Caption = 'Sender Bank Account No.';
        }
        field(32; "Sender Bank Account Currency"; Code[10])
        {
            Caption = 'Sender Bank Account Currency';
            TableRelation = Currency;
        }
        field(33; "Sender Bank Country/Region"; Code[10])
        {
            Caption = 'Sender Bank Country/Region';
            TableRelation = "Country/Region";
        }
        field(34; "Sender Bank BIC"; Code[35])
        {
            Caption = 'Sender Bank BIC';
        }
        field(35; "Sender Bank Clearing Std."; Text[50])
        {
            Caption = 'Sender Bank Clearing Std.';
            TableRelation = "Bank Clearing Standard";
        }
        field(36; "Sender Bank Clearing Code"; Text[50])
        {
            Caption = 'Sender Bank Clearing Code';
        }
        field(37; "Sender Bank Address"; Text[100])
        {
            Caption = 'Sender Bank Address';
        }
        field(38; "Sender Bank City"; Text[50])
        {
            Caption = 'Sender Bank City';
        }
        field(39; "Sender Bank Post Code"; Code[20])
        {
            Caption = 'Sender Bank Post Code';
        }
        field(40; "Recipient Name"; Text[100])
        {
            Caption = 'Recipient Name';
        }
        field(41; "Recipient Address"; Text[100])
        {
            Caption = 'Recipient Address';
        }
        field(42; "Recipient City"; Text[50])
        {
            Caption = 'Recipient City';
        }
        field(43; "Recipient Post Code"; Code[20])
        {
            Caption = 'Recipient Post Code';
        }
        field(44; "Recipient Country/Region Code"; Code[10])
        {
            Caption = 'Recipient Country/Region Code';
        }
        field(45; "Recipient Email Address"; Text[80])
        {
            Caption = 'Recipient Email Address';
        }
        field(46; "Recipient ID"; Code[20])
        {
            Caption = 'Recipient ID';
        }
        field(48; "Recipient Bank Clearing Std."; Text[50])
        {
            Caption = 'Recipient Bank Clearing Std.';
            TableRelation = "Bank Clearing Standard";
        }
        field(49; "Recipient Bank Clearing Code"; Text[50])
        {
            Caption = 'Recipient Bank Clearing Code';
        }
        field(50; "Recipient Reg. No."; Code[20])
        {
            Caption = 'Recipient Reg. No.';
        }
        field(51; "Recipient Acc. No."; Code[30])
        {
            Caption = 'Recipient Acc. No.';
        }
        field(52; "Recipient Bank Acc. No."; Text[50])
        {
            Caption = 'Recipient Bank Acc. No.';
        }
        field(53; "Recipient Bank BIC"; Code[35])
        {
            Caption = 'Recipient Bank BIC';
        }
        field(54; "Recipient Bank Name"; Text[100])
        {
            Caption = 'Recipient Bank Name';
        }
        field(55; "Recipient Bank Address"; Text[100])
        {
            Caption = 'Recipient Bank Address';
        }
        field(56; "Recipient Bank City"; Text[50])
        {
            Caption = 'Recipient Bank City';
        }
        field(57; "Recipient Bank Country/Region"; Code[10])
        {
            Caption = 'Recipient Bank Country/Region';
            TableRelation = "Country/Region";
        }
        field(58; "Recipient Creditor No."; Code[20])
        {
            Caption = 'Recipient Creditor No.';
        }
        field(59; "Recipient Bank Post Code"; Code[20])
        {
            Caption = 'Recipient Bank Post Code';
        }
        field(60; "Message Type"; Code[1])
        {
            Caption = 'Message Type';
        }
        field(61; "Letter to Sender"; Code[1])
        {
            Caption = 'Letter to Sender';
        }
        field(63; "Recipient Acknowledgement"; Code[1])
        {
            Caption = 'Recipient Acknowledgement';
        }
        field(64; "Short Advice"; Text[35])
        {
            Caption = 'Short Advice';
        }
        field(65; "Message to Recipient 1"; Text[140])
        {
            Caption = 'Message to Recipient 1';
        }
        field(66; "Message to Recipient 2"; Text[140])
        {
            Caption = 'Message to Recipient 2';
        }
        field(80; Amount; Decimal)
        {
            Caption = 'Amount';
            DecimalPlaces = 2 : 2;
        }
        field(81; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(82; "Transfer Date"; Date)
        {
            Caption = 'Transfer Date';
        }
        field(83; "Transfer Type"; Code[1])
        {
            Caption = 'Transfer Type';
        }
        field(84; "Payment Type"; Text[50])
        {
            Caption = 'Payment Type';
        }
        field(85; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(87; "Recipient Reference"; Code[35])
        {
            Caption = 'Recipient Reference';
        }
        field(88; "Payment Reference"; Code[50])
        {
            Caption = 'Payment Reference';
        }
        field(89; "Invoice Amount"; Decimal)
        {
            Caption = 'Invoice Amount';
        }
        field(90; "Invoice Date"; Date)
        {
            Caption = 'Invoice Date';
        }
        field(91; "Recipient County"; Text[30])
        {
            Caption = 'Recipient County';
        }
        field(92; "Recipient Bank County"; Text[30])
        {
            Caption = 'Recipient Bank County';
        }
        field(93; "Sender Bank County"; Text[30])
        {
            Caption = 'Sender Bank County';
        }
        field(100; "Payment Information ID"; Text[50])
        {
            Caption = 'Payment Information ID';
        }
        field(101; "End-to-End ID"; Text[50])
        {
            Caption = 'End-to-End ID';
        }
        field(102; "Message ID"; Text[35])
        {
            Caption = 'Message ID';
        }
        field(103; "SEPA Instruction Priority"; Option)
        {
            Caption = 'SEPA Instruction Priority';
            OptionCaption = 'NORMAL,HIGH';
            OptionMembers = NORMAL,HIGH;
        }
        field(104; "SEPA Instruction Priority Text"; Code[4])
        {
            Caption = 'SEPA Instruction Priority Text';
            Editable = false;
        }
        field(105; "SEPA Payment Method"; Option)
        {
            Caption = 'SEPA Payment Method';
            InitValue = TRF;
            OptionCaption = 'CHK,TRF,TRA';
            OptionMembers = CHK,TRF,TRA;
        }
        field(106; "SEPA Payment Method Text"; Code[3])
        {
            Caption = 'SEPA Payment Method Text';
        }
        field(107; "SEPA Batch Booking"; Boolean)
        {
            Caption = 'SEPA Batch Booking';
        }
        field(108; "SEPA Charge Bearer"; Option)
        {
            Caption = 'SEPA Charge Bearer';
            InitValue = SLEV;
            OptionCaption = 'DEBT,CRED,SHAR,SLEV';
            OptionMembers = DEBT,CRED,SHAR,SLEV;
        }
        field(109; "SEPA Charge Bearer Text"; Code[4])
        {
            Caption = 'SEPA Charge Bearer Text';
        }
        field(120; "SEPA Direct Debit Mandate ID"; Code[35])
        {
            Caption = 'SEPA Direct Debit Mandate ID';
        }
        field(121; "SEPA Direct Debit Seq. Type"; Option)
        {
            Caption = 'SEPA Direct Debit Seq. Type';
            OptionCaption = 'One Off,First,Recurring,Last';
            OptionMembers = "One Off",First,Recurring,Last;
        }
        field(122; "SEPA Direct Debit Seq. Text"; Code[4])
        {
            Caption = 'SEPA Direct Debit Seq. Text';
        }
        field(123; "SEPA DD Mandate Signed Date"; Date)
        {
            Caption = 'SEPA DD Mandate Signed Date';
        }
        field(124; "SEPA Partner Type"; Option)
        {
            Caption = 'SEPA Partner Type';
            OptionCaption = ' ,Company,Person';
            OptionMembers = " ",Company,Person;
        }
        field(125; "SEPA Partner Type Text"; Code[4])
        {
            Caption = 'SEPA Partner Type Text';
        }
        field(130; "Importing Code"; Code[10])
        {
            Caption = 'Importing Code';
        }
        field(131; "Importing Date"; Date)
        {
            Caption = 'Importing Date';
        }
        field(132; "Importing Description"; Text[250])
        {
            Caption = 'Importing Description';
        }
        field(133; "Costs Distribution"; Text[30])
        {
            Caption = 'Costs Distribution';
        }
        field(134; "Message Structure"; Text[30])
        {
            Caption = 'Message Structure';
        }
        field(135; "Own Address Info."; Text[30])
        {
            Caption = 'Own Address Info.';
        }
        field(170; "Creditor No."; Code[35])
        {
            Caption = 'Creditor No.';
        }
        field(171; "Transit No."; Code[35])
        {
            Caption = 'Transit No.';
        }
        field(173; "Applies-to Ext. Doc. No."; Code[35])
        {
            Caption = 'Applies-to Ext. Doc. No.';
        }
        field(200; "Format Command"; Code[4])
        {
            Caption = 'Format Command';
        }
        field(201; "Format Remittance Info Type"; Code[1])
        {
            Caption = 'Format Remittance Info Type';
        }
        field(220; "Format Payment Type"; Code[2])
        {
            Caption = 'Format Payment Type';
        }
        field(221; "Format Expense Code"; Code[1])
        {
            Caption = 'Format Expense Code';
        }
        field(222; "Format Text Code"; Code[3])
        {
            Caption = 'Format Text Code';
        }
        field(283; "Format Form Type"; Code[2])
        {
            Caption = 'Format Form Type';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

