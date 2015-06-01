unit TestClientCommonsDll;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework,  Forms, SysUtils, ExtCtrls, Windows, StdCtrls,
   ComCtrls, Messages, jpeg, Controls, Classes, Dialogs, db, Buttons, dbtables, Variants, 
   Graphics,  ExamTCPClient,ExamInterface;

type
   // Test methods for class TLoginForm
   FarProcCreateWindowsExamEnvironment = procedure(APath:String; EnvironmentStrings:TStringList); stdcall;
   FarProcCreateExamEnvironment = procedure(APath: string; AEnvironmentStrings: TStrings; AExamTcpClient: IExamTcpClient); stdcall;

   TestClientCommons = class(TTestCase)
   strict private
      FFarProcCreateWindowsExamEnvironment :FarProcCreateWindowsExamEnvironment ;
      FFarProcCreateExamEnvironment :FarProcCreateExamEnvironment;
   public
      FarProc : Pointer;
      procedure SetUp; override;
      procedure TearDown; override;
   published
      procedure TestCreateWindowsExamEnvironment;
      procedure TestCreateExamEnvironment;
   end;


var
   dllInst: THandle;
   examTcpClient :TexamTcpClient;
implementation
    
procedure TestClientCommons.SetUp;
begin
   dllInst := LoadLibrary('ClientCommons.dll');
   examTcpClient := TexamTcpClient.Create('127.0.0.1',3000);
   examTcpClient.Connect;
end;

procedure TestClientCommons.TearDown;
begin
   FreeLibrary(dllInst) ;
   examTcpClient.Free;
end;


procedure TestClientCommons.TestCreateExamEnvironment;
var
   environmentStrings:TStringList;
begin
   environmentStrings:= TStringList.Create;
   try
      environmentStrings.Add('1,Kstm,,,');
      environmentStrings.Add('1,wed,,,');
      environmentStrings.Add('1,wed\TMP,,,');
      environmentStrings.Add('1,Data,,,');
      environmentStrings.Add('2,kstm\ks1.txt,,,');
      environmentStrings.Add('2,kstm\dat.doc,,,');
      environmentStrings.Add('2,wed\main.prg,,,');
      environmentStrings.Add('2,wed\tmp\trand.bak,,,');
      environmentStrings.Add('3,56,ks_direction,wordst.doc,');
      @FFarProcCreateExamEnvironment :=  getprocaddress(dllInst,'CreateExamEnvironment');
      FFarProcCreateExamEnvironment('e:\yjksmtxt\debug\test',environmentStrings,examTcpClient);
   finally
      environmentStrings.Free;
   end;

end;

procedure TestClientCommons.TestCreateWindowsExamEnvironment;
var
   environmentStrings:TStringList;
begin
   environmentStrings:= TStringList.Create;
   try
      environmentStrings.Add('1,Kstm,,');
      environmentStrings.Add('1,wed,,');
      environmentStrings.Add('1,wed\TMP,,');
      environmentStrings.Add('1,Data,,');
      environmentStrings.Add('2,kstm\ks1.txt,,');
      environmentStrings.Add('2,kstm\dat.doc,,');
      environmentStrings.Add('2,wed\main.prg,,');
      environmentStrings.Add('2,wed\tmp\trand.bak,,');
//      @CreateWindowsExamEnvironmentPointer :=  getprocaddress(dllInst,'CreateWindowsExamEnvironment');
//      CreateWindowsExamEnvironmentPointer('e:\yjksmtxt\debug\test',environmentStrings);
   finally
      environmentStrings.Free;
   end;
end;



initialization
  // Register any test cases with the test runner
  RegisterTest(TestClientCommons.Suite);
end.

