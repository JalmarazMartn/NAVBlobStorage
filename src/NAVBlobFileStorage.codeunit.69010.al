codeunit 69010 "NAV Blob File Storage"
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure LoadFile(BlobFileTypeCode: Code[20]; FileName: text[50]; FileContent: Text; ReplaceContent: Boolean)
    begin
        Error('Error, but works');
    end;

}