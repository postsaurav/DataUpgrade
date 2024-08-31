table 1222 "Data Exch. Def"
{
    Caption = 'Data Exch. Def';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Bank Statement Import,Payment Export,Payroll Import,Generic Import,Positive Pay Export,Generic Export';
            OptionMembers = "Bank Statement Import","Payment Export","Payroll Import","Generic Import","Positive Pay Export","Generic Export";
        }
        field(4; "Reading/Writing XMLport"; Integer)
        {
            Caption = 'Reading/Writing XMLport';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (XMLport));
        }
        field(5; "Header Lines"; Integer)
        {
            Caption = 'Header Lines';
        }
        field(8; "Header Tag"; Text[250])
        {
            Caption = 'Header Tag';
        }
        field(9; "Footer Tag"; Text[250])
        {
            Caption = 'Footer Tag';
        }
        field(10; "Column Separator"; Option)
        {
            Caption = 'Column Separator';
            InitValue = Comma;
            OptionCaption = ',Tab,Semicolon,Comma,Space,Custom';
            OptionMembers = ,Tab,Semicolon,Comma,Space,Custom;
        }
        field(11; "File Encoding"; Option)
        {
            Caption = 'File Encoding';
            InitValue = WINDOWS;
            OptionCaption = 'MS-DOS,UTF-8,UTF-16,WINDOWS';
            OptionMembers = "MS-DOS","UTF-8","UTF-16",WINDOWS;
        }
        field(13; "File Type"; Option)
        {
            Caption = 'File Type';
            OptionCaption = 'Xml,Variable Text,Fixed Text,Json';
            OptionMembers = Xml,"Variable Text","Fixed Text",Json;
        }
        field(14; "Ext. Data Handling Codeunit"; Integer)
        {
            Caption = 'Ext. Data Handling Codeunit';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(15; "Reading/Writing Codeunit"; Integer)
        {
            Caption = 'Reading/Writing Codeunit';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(16; "Validation Codeunit"; Integer)
        {
            Caption = 'Validation Codeunit';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(17; "Data Handling Codeunit"; Integer)
        {
            Caption = 'Data Handling Codeunit';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(18; "User Feedback Codeunit"; Integer)
        {
            Caption = 'User Feedback Codeunit';
            TableRelation = AllObjWithCaption."Object ID" WHERE ("Object Type" = CONST (Codeunit));
        }
        field(19; "Custom Column Separator"; Text[10])
        {
            Caption = 'Custom Column Separator';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Type)
        {
        }
    }

    fieldgroups
    {
    }
}

