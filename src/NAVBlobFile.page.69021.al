page 69021 "NAV Blob File"
{
    PageType = API;
    Caption = 'apiPageName';
    APIPublisher = 'publisherName';
    APIGroup = 'groupName';
    APIVersion = 'v1.0';
    EntityName = 'entityName';
    EntitySetName = 'entitySetName';
    SourceTable = "NAv Blob File";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Blob_File_Type; rec."Blob File Type")
                {
                    Caption = 'fieldCaption';

                }
            }
        }
    }
    [ServiceEnabled]
    [Scope('Cloud')]
    procedure LoadFile(BlobFileTypeCode: Code[20]; FileName: text[50]; FileContent: Text; ReplaceContent: Boolean)
    begin
        Error('Error, but works');
    end;
}