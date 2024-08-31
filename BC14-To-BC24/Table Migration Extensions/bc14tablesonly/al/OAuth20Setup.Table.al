table 1140 "OAuth 2.0 Setup"
{
    Caption = 'OAuth 2.0 Setup';
    ReplicateData = false;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Service URL"; Text[250])
        {
            Caption = 'Service URL';
        }
        field(4; "Redirect URL"; Text[250])
        {
            Caption = 'Redirect URL';
        }
        field(5; "Client ID"; Guid)
        {
            Caption = 'Client ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(6; "Client Secret"; Guid)
        {
            Caption = 'Client Secret';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(7; "Access Token"; Guid)
        {
            Caption = 'Access Token';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(8; "Refresh Token"; Guid)
        {
            Caption = 'Refresh Token';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(9; "Authorization URL Path"; Text[250])
        {
            Caption = 'Authorization URL Path';
        }
        field(10; "Access Token URL Path"; Text[250])
        {
            Caption = 'Access Token URL Path';
        }
        field(11; "Refresh Token URL Path"; Text[250])
        {
            Caption = 'Refresh Token URL Path';
        }
        field(12; Scope; Text[250])
        {
            Caption = 'Scope';
        }
        field(13; "Authorization Response Type"; Text[250])
        {
            Caption = 'Authorization Response Type';
        }
        field(14; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = ' ,Enabled,Disabled,Connected,Error';
            OptionMembers = " ",Enabled,Disabled,Connected,Error;
        }
        field(15; "Token DataScope"; Option)
        {
            Caption = 'Token DataScope';
            OptionCaption = 'Module,User,Company,UserAndCompany';
            OptionMembers = Module,User,Company,UserAndCompany;
        }
        field(16; "Activity Log ID"; Integer)
        {
            Caption = 'Activity Log ID';
        }
        field(17; "Daily Limit"; Integer)
        {
            Caption = 'Daily Limit';
            Editable = false;
        }
        field(18; "Daily Count"; Integer)
        {
            Caption = 'Daily Count';
            Editable = false;
        }
        field(19; "Latest Datetime"; DateTime)
        {
            Caption = 'Latest Datetime';
            Editable = false;
        }
        field(20; "Access Token Due DateTime"; DateTime)
        {
            Caption = 'Access Token Due DateTime';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

