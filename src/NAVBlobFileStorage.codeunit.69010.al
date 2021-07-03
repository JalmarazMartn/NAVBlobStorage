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

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure GetFileList(fileType: Code[20]) List: text;
    var
        NAvBlobFile: Record "NAv Blob File";
        FileToken: JsonObject;
        FileList: JsonArray;
        i: Integer;
    begin
        NAvBlobFile.SetRange("Blob File Type", fileType);
        NAvBlobFile.FindSet();
        repeat
            Clear(FileToken);
            FileToken.Add('name', NAvBlobFile.Name);
            FileList.Insert(i, FileToken);
            i := i + 1;
        until NAvBlobFile.Next() = 0;
        FileList.WriteTo(List);
    end;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure DeleteFile(fileType: Code[20]; fileName: text[50]) List: text;
    var
        NAvBlobFile: Record "NAv Blob File";
    begin
        NAvBlobFile.Get(fileType, fileName);
        NAvBlobFile.Delete(true);
    end;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure ItemStock(ItemNo: Code[20]; LocationFilter: text[50]): Decimal
    var
        Item: Record Item;
    begin
        Item."No." := ItemNo;
        Item.SetFilter("Location Filter", LocationFilter);
        Item.CalcFields(Inventory);
        exit(item.Inventory);
    end;

}