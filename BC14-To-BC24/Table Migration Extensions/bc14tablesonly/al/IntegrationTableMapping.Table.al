table 5335 "Integration Table Mapping"
{
    Caption = 'Integration Table Mapping';

    fields
    {
        field(1; Name; Code[20])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(2; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            TableRelation = "Table Metadata".ID;
        }
        field(3; "Integration Table ID"; Integer)
        {
            Caption = 'Integration Table ID';
            TableRelation = "Table Metadata".ID;
        }
        field(4; "Synch. Codeunit ID"; Integer)
        {
            Caption = 'Synch. Codeunit ID';
            TableRelation = "Table Metadata".ID;
        }
        field(5; "Integration Table UID Fld. No."; Integer)
        {
            Caption = 'Integration Table UID Fld. No.';
            Description = 'Integration Table Unique Identifier Field No.';
        }
        field(6; "Int. Tbl. Modified On Fld. No."; Integer)
        {
            Caption = 'Int. Tbl. Modified On Fld. No.';
            Description = 'Integration Table Modified On Field No.';
        }
        field(7; "Int. Table UID Field Type"; Integer)
        {
            Caption = 'Int. Table UID Field Type';
            Editable = false;
        }
        field(8; "Table Config Template Code"; Code[10])
        {
            Caption = 'Table Config Template Code';
            TableRelation = "Config. Template Header".Code WHERE ("Table ID" = FIELD ("Table ID"));
        }
        field(9; "Int. Tbl. Config Template Code"; Code[10])
        {
            Caption = 'Int. Tbl. Config Template Code';
            TableRelation = "Config. Template Header".Code WHERE ("Table ID" = FIELD ("Integration Table ID"));
        }
        field(10; Direction; Option)
        {
            Caption = 'Direction';
            OptionCaption = 'Bidirectional,ToIntegrationTable,FromIntegrationTable';
            OptionMembers = Bidirectional,ToIntegrationTable,FromIntegrationTable;
        }
        field(11; "Int. Tbl. Caption Prefix"; Text[30])
        {
            Caption = 'Int. Tbl. Caption Prefix';
        }
        field(12; "Synch. Int. Tbl. Mod. On Fltr."; DateTime)
        {
            Caption = 'Synch. Int. Tbl. Mod. On Fltr.';
            Description = 'Scheduled synch. Integration Table Modified On Filter';
        }
        field(13; "Synch. Modified On Filter"; DateTime)
        {
            Caption = 'Synch. Modified On Filter';
            Description = 'Scheduled synch. Modified On Filter';
        }
        field(14; "Table Filter"; BLOB)
        {
            Caption = 'Table Filter';
        }
        field(15; "Integration Table Filter"; BLOB)
        {
            Caption = 'Integration Table Filter';
        }
        field(16; "Synch. Only Coupled Records"; Boolean)
        {
            Caption = 'Synch. Only Coupled Records';
            InitValue = true;
        }
        field(17; "Parent Name"; Code[20])
        {
            Caption = 'Parent Name';
        }
        field(18; "Graph Delta Token"; Text[250])
        {
            Caption = 'Graph Delta Token';
        }
        field(19; "Int. Tbl. Delta Token Fld. No."; Integer)
        {
            Caption = 'Int. Tbl. Delta Token Fld. No.';
        }
        field(20; "Int. Tbl. ChangeKey Fld. No."; Integer)
        {
            Caption = 'Int. Tbl. ChangeKey Fld. No.';
        }
        field(21; "Int. Tbl. State Fld. No."; Integer)
        {
            Caption = 'Int. Tbl. State Fld. No.';
        }
        field(22; "Delete After Synchronization"; Boolean)
        {
            Caption = 'Delete After Synchronization';
        }
        field(30; "Dependency Filter"; Text[250])
        {
            Caption = 'Dependency Filter';
        }
        field(100; "Full Sync is Running"; Boolean)
        {
            Caption = 'Full Sync is Running';
            Description = 'This is set to TRUE when FullSync starts, and to FALSE when FullSync completes.';
        }
        field(101; "Full Sync Session ID"; Integer)
        {
            Caption = 'Full Sync Session ID';
            Description = 'The ID of the session running the FullSync must be 0 if FullSync is not running.';
        }
        field(102; "Last Full Sync Start DateTime"; DateTime)
        {
            Caption = 'Last Full Sync Start DateTime';
            Description = 'The starting date and time of the last time FullSync was run. This is used to re-run in case FullSync failed to reset these fields.';
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

