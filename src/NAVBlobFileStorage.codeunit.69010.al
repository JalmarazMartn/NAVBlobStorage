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

}