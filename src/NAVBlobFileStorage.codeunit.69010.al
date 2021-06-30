codeunit 69010 "NAV Blob File Storage"
{
    trigger OnRun()
    begin

    end;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure LoadFile(fileType: Code[20]; fileName: Text[30]; Content: Text): Text
    var
        NAvBlobFile: Record "NAv Blob File";
    begin
        NAvBlobFile.CreateFile(fileType, fileName, Content);
    end;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure GetFileContent(fileType: Code[20]; fileName: Text[30]): Text
    var
        NAvBlobFile: Record "NAv Blob File";
        FileInstream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
    begin
        NAvBlobFile.Get(fileType, fileName);
        NAvBlobFile.CalcFields(Content);
        NAvBlobFile.Content.CreateInStream(FileInstream);
        exit(Base64Convert.ToBase64(FileInstream));
    end;

}