table 9657 "Custom Report Selection"
{
    Caption = 'Custom Report Selection';

    fields
    {
        field(1; "Source Type"; Integer)
        {
            Caption = 'Source Type';
        }
        field(2; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST (18)) Customer."No."
            ELSE
            IF ("Source Type" = CONST (23)) Vendor."No.";
        }
        field(3; Usage; Option)
        {
            Caption = 'Usage';
            OptionCaption = 'S.Quote,S.Order,S.Invoice,S.Cr.Memo,S.Test,P.Quote,P.Order,P.Invoice,P.Cr.Memo,P.Receipt,P.Ret.Shpt.,P.Test,B.Stmt,B.Recon.Test,B.Check,Reminder,Fin.Charge,Rem.Test,F.C.Test,Prod.Order,S.Blanket,P.Blanket,M1,M2,M3,M4,Inv1,Inv2,Inv3,SM.Quote,SM.Order,SM.Invoice,SM.Credit Memo,SM.Contract Quote,SM.Contract,SM.Test,S.Return,P.Return,S.Shipment,S.Ret.Rcpt.,S.Work Order,Invt.Period Test,SM.Shipment,S.Test Prepmt.,P.Test Prepmt.,S.Arch.Quote,S.Arch.Order,P.Arch.Quote,P.Arch.Order,S.Arch.Return,P.Arch.Return,Asm.Order,P.Asm.Order,S.Order Pick Instruction,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,P.V.Remit.,C.Statement,V.Remittance,JQ,S.Invoice Draft,Pro Forma S. Invoice,S.Arch.Blanket,P.Arch.Blanket,Phys.Invt.Order Test,Phys.Invt.Order,P.Phys.Invt.Order,Phys.Invt.Rec.,P.Phys.Invt.Rec.';
            OptionMembers = "S.Quote","S.Order","S.Invoice","S.Cr.Memo","S.Test","P.Quote","P.Order","P.Invoice","P.Cr.Memo","P.Receipt","P.Ret.Shpt.","P.Test","B.Stmt","B.Recon.Test","B.Check",Reminder,"Fin.Charge","Rem.Test","F.C.Test","Prod.Order","S.Blanket","P.Blanket",M1,M2,M3,M4,Inv1,Inv2,Inv3,"SM.Quote","SM.Order","SM.Invoice","SM.Credit Memo","SM.Contract Quote","SM.Contract","SM.Test","S.Return","P.Return","S.Shipment","S.Ret.Rcpt.","S.Work Order","Invt.Period Test","SM.Shipment","S.Test Prepmt.","P.Test Prepmt.","S.Arch.Quote","S.Arch.Order","P.Arch.Quote","P.Arch.Order","S.Arch.Return","P.Arch.Return","Asm.Order","P.Asm.Order","S.Order Pick Instruction",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,"P.V.Remit.","C.Statement","V.Remittance",JQ,"S.Invoice Draft","Pro Forma S. Invoice","S.Arch.Blanket","P.Arch.Blanket","Phys.Invt.Order Test","Phys.Invt.Order","P.Phys.Invt.Order","Phys.Invt.Rec.","P.Phys.Invt.Rec.";
        }
        field(4; Sequence; Integer)
        {
            AutoIncrement = true;
            Caption = 'Sequence';
        }
        field(5; "Report ID"; Integer)
        {
            Caption = 'Report ID';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Report));
        }
        field(6; "Report Caption"; Text[250])
        {
            CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE ("Object Type" = CONST (Report),
                                                                           "Object ID" = FIELD ("Report ID")));
            Caption = 'Report Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Custom Report Layout Code"; Code[20])
        {
            Caption = 'Custom Report Layout Code';
            TableRelation = "Custom Report Layout" WHERE (Code = FIELD ("Custom Report Layout Code"));
        }
        field(8; "Custom Report Description"; Text[250])
        {
            CalcFormula = Lookup ("Custom Report Layout".Description WHERE (Code = FIELD ("Custom Report Layout Code")));
            Caption = 'Custom Report Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Send To Email"; Text[200])
        {
            Caption = 'Send To Email';
        }
        field(19; "Use for Email Attachment"; Boolean)
        {
            Caption = 'Use for Email Attachment';
            InitValue = true;
        }
        field(20; "Use for Email Body"; Boolean)
        {
            Caption = 'Use for Email Body';
        }
        field(21; "Email Body Layout Code"; Code[20])
        {
            Caption = 'Email Body Layout Code';
            TableRelation = "Custom Report Layout" WHERE (Code = FIELD ("Email Body Layout Code"),
                                                          "Report ID" = FIELD ("Report ID"));
        }
        field(22; "Email Body Layout Description"; Text[250])
        {
            CalcFormula = Lookup ("Custom Report Layout".Description WHERE (Code = FIELD ("Email Body Layout Code")));
            Caption = 'Email Body Layout Description';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Source Type", "Source No.", Usage, Sequence)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

