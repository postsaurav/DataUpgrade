table 5450 "Graph Contact"
{
    Caption = 'Graph Contact';
    TableType = MicrosoftGraph;

    fields
    {
        field(1; Id; Text[250])
        {
            Caption = 'Id', Locked = true;
            ExternalName = 'Id';
            ExternalType = 'Edm.String';
        }
        field(2; CreatedDateTime; DateTime)
        {
            Caption = 'CreatedDateTime', Locked = true;
            ExternalName = 'CreatedDateTime';
            ExternalType = 'Edm.DateTimeOffset';
        }
        field(3; LastModifiedDateTime; DateTime)
        {
            Caption = 'LastModifiedDateTime', Locked = true;
            ExternalName = 'LastModifiedDateTime';
            ExternalType = 'Edm.DateTimeOffset';
        }
        field(4; ChangeKey; Text[250])
        {
            Caption = 'ChangeKey', Locked = true;
            ExternalName = '@odata.etag';
            ExternalType = 'Edm.String';
        }
        field(5; Categories; BLOB)
        {
            Caption = 'Categories', Locked = true;
            ExternalName = 'Categories';
            ExternalType = 'Collection(Edm.String)';
            SubType = Json;
        }
        field(6; ParentFolderId; Text[250])
        {
            Caption = 'ParentFolderId', Locked = true;
            ExternalName = 'ParentFolderId';
            ExternalType = 'Edm.String';
        }
        field(7; Birthday; DateTime)
        {
            Caption = 'Birthday', Locked = true;
            ExternalName = 'Birthday';
            ExternalType = 'Edm.DateTimeOffset';
        }
        field(8; FileAs; Text[250])
        {
            Caption = 'FileAs', Locked = true;
            ExternalName = 'FileAs';
            ExternalType = 'Edm.String';
        }
        field(9; DisplayName; Text[250])
        {
            Caption = 'DisplayName', Locked = true;
            ExternalName = 'DisplayName';
            ExternalType = 'Edm.String';
        }
        field(10; GivenName; Text[250])
        {
            Caption = 'GivenName', Locked = true;
            Description = 'GivenName is mandatory. InitValue must be a space (=[ ] in the .txt format)';
            ExternalName = 'GivenName';
            ExternalType = 'Edm.String';
            InitValue = ' ';
        }
        field(11; Initials; Text[250])
        {
            Caption = 'Initials', Locked = true;
            ExternalName = 'Initials';
            ExternalType = 'Edm.String';
        }
        field(12; MiddleName; Text[250])
        {
            Caption = 'MiddleName', Locked = true;
            ExternalName = 'MiddleName';
            ExternalType = 'Edm.String';
        }
        field(13; NickName; Text[250])
        {
            Caption = 'NickName', Locked = true;
            ExternalName = 'NickName';
            ExternalType = 'Edm.String';
        }
        field(14; Surname; Text[250])
        {
            Caption = 'Surname', Locked = true;
            ExternalName = 'Surname';
            ExternalType = 'Edm.String';
        }
        field(15; Title; Text[250])
        {
            Caption = 'Title', Locked = true;
            ExternalName = 'Title';
            ExternalType = 'Edm.String';
        }
        field(16; YomiGivenName; Text[250])
        {
            Caption = 'YomiGivenName', Locked = true;
            ExternalName = 'YomiGivenName';
            ExternalType = 'Edm.String';
        }
        field(17; YomiSurname; Text[250])
        {
            Caption = 'YomiSurname', Locked = true;
            ExternalName = 'YomiSurname';
            ExternalType = 'Edm.String';
        }
        field(18; YomiCompanyName; Text[250])
        {
            Caption = 'YomiCompanyName', Locked = true;
            ExternalName = 'YomiCompanyName';
            ExternalType = 'Edm.String';
        }
        field(19; Generation; Text[250])
        {
            Caption = 'Generation', Locked = true;
            ExternalName = 'Generation';
            ExternalType = 'Edm.String';
        }
        field(20; EmailAddresses; BLOB)
        {
            Caption = 'EmailAddresses', Locked = true;
            ExternalName = 'EmailAddresses';
            ExternalType = 'Collection(Microsoft.OutlookServices.EmailAddress)';
            SubType = Json;
        }
        field(21; Websites; BLOB)
        {
            Caption = 'Websites', Locked = true;
            ExternalName = 'Websites';
            ExternalType = 'Collection(Microsoft.OutlookServices.Website)';
            SubType = Json;
        }
        field(22; ImAddresses; BLOB)
        {
            Caption = 'ImAddresses', Locked = true;
            ExternalName = 'ImAddresses';
            ExternalType = 'Collection(Edm.String)';
            SubType = Json;
        }
        field(23; JobTitle; Text[250])
        {
            Caption = 'JobTitle', Locked = true;
            ExternalName = 'JobTitle';
            ExternalType = 'Edm.String';
        }
        field(24; CompanyName; Text[250])
        {
            Caption = 'CompanyName', Locked = true;
            ExternalName = 'CompanyName';
            ExternalType = 'Edm.String';
        }
        field(25; Department; Text[250])
        {
            Caption = 'Department', Locked = true;
            ExternalName = 'Department';
            ExternalType = 'Edm.String';
        }
        field(26; OfficeLocation; Text[250])
        {
            Caption = 'OfficeLocation', Locked = true;
            ExternalName = 'OfficeLocation';
            ExternalType = 'Edm.String';
        }
        field(27; Profession; Text[250])
        {
            Caption = 'Profession', Locked = true;
            ExternalName = 'Profession';
            ExternalType = 'Edm.String';
        }
        field(28; AssistantName; Text[250])
        {
            Caption = 'AssistantName', Locked = true;
            ExternalName = 'AssistantName';
            ExternalType = 'Edm.String';
        }
        field(29; Manager; Text[250])
        {
            Caption = 'Manager', Locked = true;
            ExternalName = 'Manager';
            ExternalType = 'Edm.String';
        }
        field(30; Phones; BLOB)
        {
            Caption = 'Phones', Locked = true;
            ExternalName = 'Phones';
            ExternalType = 'Collection(Microsoft.OutlookServices.Phone)';
            SubType = Json;
        }
        field(31; PostalAddresses; BLOB)
        {
            Caption = 'PostalAddresses', Locked = true;
            ExternalName = 'PostalAddresses';
            ExternalType = 'Collection(Microsoft.OutlookServices.PhysicalAddress)';
            SubType = Json;
        }
        field(32; SpouseName; Text[250])
        {
            Caption = 'SpouseName', Locked = true;
            ExternalName = 'SpouseName';
            ExternalType = 'Edm.String';
        }
        field(33; PersonalNotes; BLOB)
        {
            Caption = 'PersonalNotes', Locked = true;
            ExternalName = 'PersonalNotes';
            ExternalType = 'Edm.String';
            SubType = Memo;
        }
        field(34; Children; BLOB)
        {
            Caption = 'Children', Locked = true;
            ExternalName = 'Children';
            ExternalType = 'Collection(Edm.String)';
            SubType = Json;
        }
        field(35; WeddingAnniversary; DateTime)
        {
            Caption = 'WeddingAnniversary', Locked = true;
            ExternalName = 'WeddingAnniversary';
            ExternalType = 'Edm.Date';
        }
        field(36; Gender; Text[250])
        {
            Caption = 'Gender', Locked = true;
            ExternalName = 'Gender';
            ExternalType = 'Edm.String';
        }
        field(37; IsFavorite; Boolean)
        {
            Caption = 'IsFavorite', Locked = true;
            ExternalName = 'IsFavorite';
            ExternalType = 'Edm.Boolean';
        }
        field(38; Flag; BLOB)
        {
            Caption = 'Flag', Locked = true;
            ExternalName = 'Flag';
            ExternalType = 'Microsoft.OutlookServices.FollowupFlag';
            SubType = Json;
        }
        field(40; DeltaToken; Text[250])
        {
            Caption = 'DeltaToken', Locked = true;
            ExternalName = 'DeltaToken';
            ExternalType = 'Edm.String';
        }
        field(41; BusinessType; BLOB)
        {
            Caption = 'BusinessType', Locked = true;
            ExternalName = 'String {bdba944b-fc2b-47a1-8ba4-cafc4ae13ea2} Name BusinessType';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
        field(42; IsBank; BLOB)
        {
            Caption = 'IsBank', Locked = true;
            ExternalName = 'Integer {a8ef117a-16d9-4cc6-965a-d2fbe0177e61} Name IsBank';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
        field(43; IsContact; BLOB)
        {
            Caption = 'IsContact', Locked = true;
            ExternalName = 'Integer {f4be2302-782e-483d-8ba4-26fb6535f665} Name IsContact';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
        field(44; IsCustomer; BLOB)
        {
            Caption = 'IsCustomer', Locked = true;
            ExternalName = 'Integer {47ac1412-279b-41cb-891e-58904a94a48b} Name IsCustomer';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
        field(45; IsLead; BLOB)
        {
            Caption = 'IsLead', Locked = true;
            ExternalName = 'Integer {37829b75-e5e4-4582-ae12-36f754e4bd7b} Name IsLead';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
        field(46; IsPartner; BLOB)
        {
            Caption = 'IsPartner', Locked = true;
            ExternalName = 'Integer {65ebabde-6946-455f-b918-a88ee36182a9} Name IsPartner';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
        field(47; IsVendor; BLOB)
        {
            Caption = 'IsVendor', Locked = true;
            ExternalName = 'Integer {ccf57c46-c10e-41bb-b8c5-362b185d2f98} Name IsVendor';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
        field(48; IsNavCreated; BLOB)
        {
            Caption = 'IsNavCreated', Locked = true;
            ExternalName = 'Integer {6023a623-3b6c-492d-9ef5-811850c088ac} Name IsNavCreated';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
        field(49; NavIntegrationId; BLOB)
        {
            Caption = 'NavIntegrationId', Locked = true;
            ExternalName = 'String {d048f561-4dd0-443c-a8d8-f397fb74f1df} Name NavIntegrationId';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
        field(50; XrmId; BLOB)
        {
            Caption = 'XrmId', Locked = true;
            ExternalName = 'CLSID {1a417774-4779-47c1-9851-e42057495fca} Name XrmId';
            ExternalType = 'SingleValueExtendedProperties';
            SubType = Json;
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

