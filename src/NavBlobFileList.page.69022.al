page 69022 "Nav Blob File List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "NAv Blob File";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Blob File Type"; rec."Blob File Type")
                {
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                }
                field("File Date"; rec."File Date")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ViewFile)
            {
                ApplicationArea = All;
                Image = ViewSourceDocumentLine;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction();
                begin
                    rec.ViewFile();
                end;
            }
            action(TestReadFile)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    rec.OpenFileToRead();
                    while not rec.EOF() do begin
                        if not Confirm(rec.READTEXT(), true) then
                            Error('Fin');
                    end;
                end;
            }
            action(TestWriteFile)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Customer: Record Customer;
                    CustomerList: Page "Customer List";
                begin
                    CustomerList.LookupMode(true);
                    if CustomerList.RunModal() <> Action::LookupOK then
                        exit;
                    CustomerList.SetSelection(Customer);
                    Customer.FindSet();
                    rec.OpenFileToWrite('TEST', 'TestFile.txt');
                    repeat
                        Rec.WRITEXT(Customer.Name);
                    until Customer.next = 0;
                    rec.CloseFile();
                end;
            }

        }
    }
}