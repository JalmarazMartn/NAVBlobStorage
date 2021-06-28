codeunit 69010 "NAV Blob File Storage"
{
    trigger OnRun()
    begin

    end;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure LoadFile(fileType: Code[20]; fileName: Text[30]; Content: Text): Text
    begin
        exit(StrSubstNo('FileType is %1, my content %2', fileType, Content));
    end;

}