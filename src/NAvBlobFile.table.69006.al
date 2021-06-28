table 69006 "NAv Blob File"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Blob File Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Blob File Type".Code;

        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "File Date"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Content"; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = ,Processed,Downloaded;
        }
    }

    keys
    {
        key(Key1; "Blob File Type", Name)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    procedure CreateFile(fileTypeCode: Code[20]; fileName: Text[30]; FileContent: Text)
    var
        BlobFileType: Record "Blob File Type";
        Base64Convert: Codeunit "Base64 Convert";
        FileOutStream: OutStream;
    begin
        if get(fileTypeCode, fileName) then
            Delete();
        "Blob File Type" := fileTypeCode;
        Name := fileName;
        "File Date" := CreateDateTime(WorkDate(), Time);
        BlobFileType.CreateIfNotExists(fileTypeCode);
        Insert();
        Content.CreateOutStream(FileOutStream);
        Base64Convert.FromBase64(FileContent, FileOutStream);
        Modify();
    end;

    procedure ViewFile()
    var
        FileInstream: InStream;
        FileName: Text;
    begin
        CalcFields(Content);
        Content.CreateInStream(FileInstream);
        FileName := Name;
        DownloadFromStream(FileInstream, '', '', '', FileName);
    end;
}