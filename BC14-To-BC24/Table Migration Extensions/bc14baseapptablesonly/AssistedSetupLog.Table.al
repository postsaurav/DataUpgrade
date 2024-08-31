table 1807 "Assisted Setup Log"
{
    Caption = 'Assisted Setup Log';
    ReplicateData = false;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No.';
        }
        field(3; "Entery No."; Integer)
        {
            Caption = 'Entery No.';
            TableRelation = "Assisted Setup"."Page ID";
        }
        field(10; "Date Time"; DateTime)
        {
            Caption = 'Date Time';
        }
        field(11; "Invoked Action"; Option)
        {
            Caption = 'Invoked Action';
            OptionCaption = ' ,Video,Help,Tour,Assisted Setup';
            OptionMembers = " ",Video,Help,Tour,"Assisted Setup";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

