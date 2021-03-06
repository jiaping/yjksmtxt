program prjExamClient;

{$R *.dres}

uses
   {$IFDEF DEBUG}
   FastMM4,
   {$ENDIF }
   Forms, SysUtils, IdException, ExamTCPClient in 'ExamNet\ExamTCPClient.pas', ExamClientGlobal in 'Client\ExamClientGlobal.pas',
   ClientMain in 'Client\ClientMain.PAS' {ClientMainForm} , Select in 'Client\Select.pas' {SelectForm} , KeyType in 'Client\KeyType.pas' {TypeForm} ,
   score in 'Client\score.pas' {ScoreForm} , floatform in 'Client\floatform.pas' {FloatWindow} , NetGlobal {frmExit} , SelectGrade in 'Client\SelectGrade.pas',
   Windows, ufrmInProcess in 'ExamCommons\ufrmInProcess.pas' {frmInProcess} , uDispAnswer in 'ExamCommons\uDispAnswer.pas' {frmDispAnswer} ,
   ufrmLogin in 'Client\ufrmLogin.pas' {FrmLogin} , FrameWorkUtils in 'Client\FrameWorkUtils.pas',
   uFrameSingleSelect in 'Client\uFrameSingleSelect.pas' {FrameSingleSelect: TFrame} ,
   uFrameTQButtons in 'Client\uFrameTQButtons.pas' {FrameTQButtons: TFrame} , uFrameMultiSelect in 'Client\uFrameMultiSelect.pas' {FrameMultiSelect: TFrame} ,
   keyboardType in 'Client\keyboardType.pas' {FrameKeyType: TFrame} , uFrameOperate in 'Client\uFrameOperate.pas' {FrameOperate: TFrame} ,
   uFormOperate in 'Client\uFormOperate.pas' {FormOperate} , ExamTypeFrm in 'Client\ExamTypeFrm.pas' {ExamTypeForm} ,
   uFrameCover in 'Client\uFrameCover.pas' {FrameCover: TFrame};

// FlashPlayerControl in 'FlashPlayerControl\FlashPlayerControl\Delphi2007\FlashPlayerControl.pas';

{$R *.res}

var
   mymutex: THandle;

begin
   {$IFDEF DEBUG}
   ReportMemoryLeaksOnShutdown := True;
   {$ENDIF}
   mymutex := CreateMutex(nil, True, 'JPExamClient Singleton mutex object');
   if GetLastError <> ERROR_ALREADY_EXISTS then
      begin
         Application.Initialize;
         Application.MainFormOnTaskbar := false;
         Application.Title := '一级WINDOWS无纸化考试系统';
         TExamClientGlobal.CreateClassObject();
         // Application.CreateForm(TDmClient, TExamClientGlobal.DmClient);
         // TExamClientGlobal.ExamTCPClient := TExamTCPClient.Create(CONSTSERVERIP,CONSTSERVERPORT);
         TExamClientGlobal.ExamTCPClient := TExamTCPClient.Create();
         try
            if not TExamClientGlobal.GetClientConfig('clientconfig.ini') then
               begin
                  // Application.MessageBox('配置文件ClietnConfig.ini出错！请检查配置','提示');
                  Application.Terminate;
               end;
            { TODO : 连接服务器异常，或IP地址不正确等 }
            TExamClientGlobal.ExamTCPClient.Connect; // GlobalExamTCPClient.Connect;
            TExamClientGlobal.SetBaseConfig();

         except
            on E: Exception do
               begin
                  // Application.MessageBox(pchar(e.Message),'ddd');
                  Application.MessageBox('连接服务器失败！请检查服务器程序是否运行、网络是否正常！', '连接服务器失败', MB_OK + MB_ICONSTOP + MB_TOPMOST);
                  Application.Terminate;
               end;
         end;

         {$IFDEF NOLOGIN  }
         TExamClientGlobal.Examinee.ID := '11111100101';
         TExamClientGlobal.Examinee.Name := '模拟1';
         TExamClientGlobal.Login();
         if TExamClientGlobal.InitExam <> 1 then // <>mrok
            Application.Terminate;
         Application.CreateForm(TClientMainForm, TExamClientGlobal.ClientMainForm);
         {$ELSE}
         with TFrmLogin.Create(Application) do
            try
               ShowWindow(Application.Handle, sw_minimize);
               Shadowed := True;
               if showModal = 1 then
                  begin
                     Application.CreateForm(TClientMainForm, TExamClientGlobal.ClientMainForm);
                     application.OnException:=TExamClientGlobal.OnExceptionProc;
                     //ShowWindow(Application.Handle, sw_max);
                     free;
                  end
               else
                  begin
                     free;
                     Application.Terminate;
                  end;

            except
               free;
               Application.Terminate;
            end;
         {$ENDIF}
         Application.Run;
      end
   else
      Application.MessageBox('您已经运行了考试客户端程序!', '提示', mb_OK);

end.
