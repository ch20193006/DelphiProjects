unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, Buttons,
  Menus, ImgList, DB, IBDatabase, IBCustomDataSet, IBTable, IBQuery,
  IBStoredProc;

type
  TForm1 = class(TForm)
    stBar: TStatusBar;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cbFilter: TComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    BitBtn6: TBitBtn;
    SaveDialog1: TSaveDialog;
    IBQuery2: TIBQuery;
    IBStoredProc1: TIBStoredProc;
    GroupBox3: TGroupBox;
    db1: TDBGrid;
    GroupBox4: TGroupBox;
    db2: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure db1CellClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Extract2CSV(ads: TDataset; const fn: String; const Separator: String = ';');
  private
    { Private declarations }
  public
    { Public declarations }
    s:string; // connection string
    is_connected: boolean;  // показатель того, подключились ли мы к БД
    bearer_id:  Integer;  //  ID работника
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}
procedure TForm1.BitBtn1Click(Sender: TObject);

begin
  with  ibDataBase1  do
  begin
    DatabaseName:=  s;
    Connected:= True;
    is_connected:=  True;
  end;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('SELECT * FROM EMPLOYEE');
  IBQuery1.Active:=True;
  with  db1 do
    begin
      db1.Visible:=True;
      columns[0].Title.Caption:='№';
      columns[0].Width:=50;
      columns[0].Visible:=False;
      columns[1].Title.Caption:='Фамилия';
      columns[1].Width:=100;
      columns[2].Title.Caption:='Имя';
      columns[2].Width:=100;
      columns[3].Title.Caption:='Отчество';
      columns[3].Width:=100;
      columns[4].Title.Caption:='Пол';
      columns[4].Width:=50;
    end;
  ibTransaction1.Active:= True;
  stbar.Panels[1].Text:='Подключена, работает';
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
label 1;
begin
  if is_connected = False then
    begin
      showmessage('Нужно сначала подключиться к БД');
      BitBtn1.SetFocus;
      goto 1;
    end;
  cbFilter.Text:='Выберите пол сотрудника';
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('SELECT * FROM EMPLOYEE');
  IBQuery1.Active:=True;
  with  db1 do
    begin
      columns[0].Title.Caption:='№';
      columns[0].Width:=50;
      columns[0].Visible:=False;
      columns[1].Title.Caption:='Фамилия';
      columns[1].Width:=100;
      columns[2].Title.Caption:='Имя';
      columns[2].Width:=100;
      columns[3].Title.Caption:='Отчество';
      columns[3].Width:=100;
      columns[4].Title.Caption:='Пол';
      columns[4].Width:=50;
    end;
1:    
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
label 1;
begin
  if is_connected = False then
    begin
      showmessage('Нужно сначала подключиться к БД');
      BitBtn1.SetFocus;
      goto 1;
    end;
 form2.show;
1:
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
label 1;
begin
  if is_connected = False then
    begin
      showmessage('Нужно сначала подключиться к БД');
      BitBtn1.SetFocus;
      goto 1;
    end;
  form3.label3.Caption:=  ' '+db1.DataSource.DataSet.Fields.Fields[1].Value+
  ' '+db1.DataSource.DataSet.Fields.Fields[2].Value+' '+
  db1.DataSource.DataSet.Fields.Fields[3].Value;
  bearer_id:= db1.DataSource.DataSet.Fields.Fields[0].Value;
  form3.show;
1:
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
label 1;
begin
  SaveDialog1.Filter:='CSV-файлы (*.csv) |*.csv';
  if is_connected = False then
    begin
      showmessage('Нужно сначала подключиться к БД');
      BitBtn1.SetFocus;
      goto 1;
    end;
  SaveDialog1.InitialDir:=  ExtractFilePath(Application.ExeName);
  if SaveDialog1.Execute then
    begin
     with  IBQuery2  do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM EMPLOYEE E LEFT JOIN CONTACTS C ON E.ID=C.BEARER_ID');
          Active:=  True;
        end;
     db2.Visible:=False;
     Extract2CSV(IBQuery2,SaveDialog1.FileName+'.csv',';');
     ShowMessage('База успешно экспортирована');
    end;
1:
end;

procedure TForm1.db1CellClick(Column: TColumn);
begin
  if is_connected = True then
    begin
      with  IBQuery2  do
        begin
          SQL.Clear;
          SQL.Add('SELECT * FROM CONTACTS WHERE BEARER_ID=:P1');
          Params.ParamByName('P1').AsInteger:=db1.DataSource.DataSet.Fields.Fields[0].Value;
          Active:=  True;
        end;
      with  db2 do
        begin
          DataSource.DataSet.Open;
          Visible:= True;
          columns[0].Title.Caption:='№';
          columns[0].Width:=50;
          columns[0].Visible:=False;
          columns[1].Title.Caption:='Тип контакта';
          columns[1].Width:=100;
          columns[2].Title.Caption:='Значение';
          columns[2].Width:=100;
          columns[3].Title.Caption:='ID владельца';
          columns[3].Width:=100;
        end;
      ibTransaction1.Active:= True;
    end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
label 1;

begin
  if is_connected = False then
    begin
      showmessage('Нужно сначала подключиться к БД');
      BitBtn1.SetFocus;
      goto 1;
    end;
  if cbFilter.Text='Выберите пол сотрудника' then
    begin
      showmessage('Надо указать пол сотрудника');
      cbFilter.SetFocus;
      goto 1;
    end;
  db2.Visible:=False;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('SELECT * FROM EMPL_GET_DATA(:P1)');
  IBQuery1.ParamByName('P1').AsInteger:=cbFilter.ItemIndex;
  IBQuery1.Active:=True;
  with  db1 do
    begin
      columns[0].Title.Caption:='№';
      columns[0].Width:=50;
      columns[0].Visible:=False;
      columns[1].Title.Caption:='Фамилия';
      columns[1].Width:=100;
      columns[2].Title.Caption:='Имя';
      columns[2].Width:=100;
      columns[3].Title.Caption:='Отчество';
      columns[3].Width:=100;
      columns[4].Title.Caption:='Пол';
      columns[4].Width:=50;
    end;
  ibTransaction1.Active:= True;
  stbar.Panels[1].Text:='Подключенна, работает';
1:
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  s:= 'localhost:'+ExtractFilePath(Application.ExeName)+'TEST.fdb';
  is_connected:=  False;
  db1.Visible:=False;
  db2.Visible:=False;
end;

procedure TForm1.Extract2CSV(ads: TDataset; const fn: String; const Separator: String = ';');
var
  sl: TStringList;
  s: String;
  i: Integer;
  bm: TBookmark;

  Procedure ClipIt;
  begin
    s := Copy(s, 1, Length(s) - Length(Separator));
    sl.Add(s);
    s := '';
  end;
  Function FixIt(const s: String): String;
  begin
    // maybe changed
    Result := StringReplace(StringReplace(StringReplace(s, Separator, '', [rfReplaceAll]), #13, '', [rfReplaceAll]), #10, '', [rfReplaceAll]);
    // additional changes could be Quoting Strings
  end;

begin
  sl := TStringList.Create;
  try
    s := '';
    For i := 0 to ads.FieldCount - 1 do
    begin
      if ads.Fields[i].Visible then
        s := s + FixIt(ads.Fields[i].DisplayLabel) + Separator;
    end;
    ClipIt;
    bm := ads.GetBookmark;
    ads.DisableControls;
    try
      ads.First;
      while not ads.Eof do
      begin
        For i := 0 to ads.FieldCount - 1 do
        begin
          if ads.Fields[i].Visible then
            s := s + FixIt(ads.Fields[i].DisplayText) + Separator;
        end;
        ClipIt;
        ads.Next;
      end;
      ads.GotoBookmark(bm);
    finally
      ads.EnableControls;
      ads.FreeBookmark(bm);
    end;
    sl.SaveToFile(fn);
  finally
    sl.Free;
  end;
end;


end.
