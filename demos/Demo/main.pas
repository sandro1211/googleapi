unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uGoogleLogin,TypInfo;

type
  TForm11 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EmailEdit: TEdit;
    PassEdit: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    AuthEdit: TEdit;
    ResultEdit: TEdit;
    Button2: TButton;
    GoogleLogin1: TGoogleLogin;
    Edit1: TEdit;
    Label7: TLabel;
    Edit2: TEdit;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure GoogleLogin1Autorization(const LoginResult: TLoginResult;
      Result: TResultRec);
    procedure GoogleLogin1Error(const ErrorStr: string);
    procedure Button2Click(Sender: TObject);
    procedure GoogleLogin1Disconnect(const ResultStr: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}


procedure TForm11.Button1Click(Sender: TObject);
begin
GoogleLogin1.Email:=EmailEdit.Text;
GoogleLogin1.Password:=PassEdit.Text;
GoogleLogin1.Service:=TServices(ComboBox1.ItemIndex);
GoogleLogin1.Login();
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
  GoogleLogin1.Disconnect;
end;

procedure TForm11.GoogleLogin1Autorization(const LoginResult: TLoginResult;Result: TResultRec);
var
  temp:string;
begin
  ResultEdit.Text:=Result.LoginStr;
  AuthEdit.Text:=Result.Auth;
  temp:=GetEnumName(TypeInfo(TLoginResult),Integer(LoginResult));
  Edit1.Text:=temp;
  if LoginResult =lrOk then
    ShowMessage('�� � �����!!!!!!!!!')
  else
    ShowMessage('�� �� � �����!!!!!!!!!');

end;

procedure TForm11.GoogleLogin1Disconnect(const ResultStr: string);
begin
      ShowMessage('Disconnect');
end;

procedure TForm11.GoogleLogin1Error(const ErrorStr: string);
begin
  ShowMessage(ErrorStr);
end;

end.
