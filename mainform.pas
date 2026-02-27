unit MainForm;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
    ComCtrls, Grids, SynEdit, FGL, MOS_6502;

type

    { TForm1 }
    TCPUList = specialize TFPGObjectList<CPU_6502B>;

    TForm1 = class(TForm)
        MainMenu1: TMainMenu;
        MenuItem1: TMenuItem;
        MenuItem2: TMenuItem;
        MenuItem3: TMenuItem;
        OpenDialog1: TOpenDialog;
        PageControl1: TPageControl;
        Separator1: TMenuItem;
        procedure FormActivate(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure MenuItem2Click(Sender: TObject);
        procedure AutoSizeCol(Grid: TStringGrid; Column: integer);
    private
        cpus : TCPUList;
    public

    end;

var
    Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.AutoSizeCol(Grid: TStringGrid; Column: integer);
var
  i, W, WMax: integer;
begin
  WMax := 0;
  for i := 0 to (Grid.RowCount - 1) do begin
    W := Grid.Canvas.TextWidth(Grid.Cells[Column, i]);
    if W > WMax then
      WMax := W;
  end;
  Grid.ColWidths[Column] := WMax + 5;
end;


procedure TForm1.MenuItem2Click(Sender: TObject);
VAR StringGrid: TStringGrid;
    Sheet: TTabSheet;
    new_cpu : CPU_6502B;
begin
  if OpenDialog1.Execute then
    begin
      if fileExists(OpenDialog1.Filename) then
        Begin
             //ShowMessage(OpenDialog1.Filename);
            Sheet := PageControl1.AddTabSheet;
            Sheet.Align:=alClient;
            Sheet.Caption:=ExtractFileName( OpenDialog1.filename );
            StringGrid := TStringGrid.Create( Self );
            StringGrid.Parent := Sheet;
            StringGrid.Align := alClient;
            StringGrid.Clear;
            StringGrid.RowCount:=65536; // allow 0 for header
            StringGrid.ColCount:=6;
            new_cpu := CPU_6502B.Create;
            new_cpu.LoadFile( OpenDialog1.filename, StringGrid );
            cpus.add( new_cpu );
            AutoSizeCol(StringGrid, 0);
            AutoSizeCol(StringGrid, 1);
            AutoSizeCol(StringGrid, 2);
            AutoSizeCol(StringGrid, 3);
            AutoSizeCol(StringGrid, 4);
            AutoSizeCol(StringGrid, 5);
        end;
    end
  else
    ShowMessage('No file selected');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cpus := TCPUList.Create;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin

end;

end.

