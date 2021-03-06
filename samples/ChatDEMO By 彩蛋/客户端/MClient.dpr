program MClient;

uses
  Forms,
  frm_Client in 'frm_Client.pas' {frmClient},
  frm_Login in 'frm_Login.pas' {frmLogin},
  ClientIocpOper in 'ClientIocpOper.pas',
  locker in 'locker.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);  // 创建登录窗体
  frmLogin.ShowModal;
  if frmLogin.ModalResult = 1 then  // 登录成功（mrOk = 1 为不引用windows单元使用常数）
  begin
    frmLogin.Free;
    Application.CreateForm(TfrmClient, frmClient);  // 创建客户端窗体
    Application.Run;
  end
  else  // 关闭登录窗体
  begin
    frmLogin.Free;
  end;
end.
