unit PptTest;

interface

uses
   Classes, SysUtils,ExamGlobal,uGrade;

   function GetModuleDllName() : string; stdcall;
   function GetModulePrefix() : string; stdcall;
   function GetModuleButtonText(): string; stdcall;
   function GetModuleDocName() : string; stdcall;
   function GetModuleDelimiterChar() : Char; stdcall;
   procedure OpenAction(AHandle:THandle;APath:string;ADocName:TFileName=NULL_STR); stdcall;

const
  DOCNAME = 'powerpointst.pptx';
  CONSTPREFIX ='G';
  CONSTDLLNAME ='Ppt';
  CONSTBUTTONTEXT ='����ʾ�ĸ�';
implementation
uses
   ShellAPI, Windows;

   function GetModuleDllName() : string; stdcall;
   begin
      Result := CONSTDLLNAME;
   end;
   function GetModulePrefix() : string; stdcall;
   begin
      Result := CONSTPREFIX;
   end;
   function GetModuleDocName() : string; stdcall;
   begin
      Result := DOCNAME;
   end;
   function GetModuleButtonText(): string; stdcall;
   begin
      Result := CONSTBUTTONTEXT;
   end;
   function GetModuleDelimiterChar() : Char; stdcall;
   begin
      Result := ',';
   end;
   procedure OpenAction(AHandle:THandle;APath:string;ADocName:TFileName=NULL_STR); stdcall;
   begin
      if ADocName=NULL_STR then  ADocName := DOCNAME;

      ShellExecute(
      Ahandle,	// handle to parent window
      'open',	// pointer to string that specifies operation to perform
      pchar(ADocName),	// pointer to filename or folder name string
      '',	// pointer to string that specifies executable-file parameters
      pchar(APath),	// pointer to string that specifies default directory
      SW_SHOWNORMAL 	// whether file is shown when opened
     );
   end;
end.
