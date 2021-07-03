page 69021 "NAV Blob Files"
{
    PageType = API;
    Caption = 'NAV Blob Files';
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

                }
                field(Name; rec.Name)
                { }
            }
        }
    }
}