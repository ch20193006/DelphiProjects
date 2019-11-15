unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  form2.Close
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Combobox1.Text:='';
  Edit1.SetFocus;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
label 1;
begin
  if  (Edit1.Text='') or (Edit2.Text='') or (ComboBox1.Text='') then
    begin
      showmessage('Поля "Имя", "Фамилия" и "Пол" должны быть заполненны');
      goto 1;
    end;
  try
  with  Form1.IBQuery1  do
    begin
      SQL.Clear;
      SQL.Add('EXECUTE PROCEDURE EMPL_ADD_DATA(:P1,:P2,:P3,:P4)');
      ParamByName('P1').AsString:=Edit1.Text;
      ParamByName('P2').AsString:=Edit2.Text;
      ParamByName('P3').AsString:=Edit3.Text;
      ParamByName('P4').AsInteger:=Combobox1.ItemIndex;
      ExecSQL;
      Transaction.Commit;
      ShowMessage('Работник успешно добавлен.');
      Form2.Close;
      Form1.BitBtn1.OnClick(Sender);
    end;
   except
    on E:Exception do
      ShowMessage(E.ClassName+' ошибка : '+E.Message);
  end;
1:
end;

end.
