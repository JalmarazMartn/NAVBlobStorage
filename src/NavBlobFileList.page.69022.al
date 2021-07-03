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
            action(TEMP)
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
        }
    }
}