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

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}