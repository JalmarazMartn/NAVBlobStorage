table 69005 "Blob File Type"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
    procedure CreateIfNotExists(FileTypeCode: Code[20])
    begin
        Code := FileTypeCode;
        if not Find() then
            Insert();
    end;
}