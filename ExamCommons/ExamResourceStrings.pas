unit ExamResourceStrings;

interface

resourcestring

RSFileNotExist       = '文件 %s 不存在！';
RSDirNotExist        = '文件夹 %s 不存在！';
RSDirDeleteError     = '删除文件夹 %s 发生错误！';
RSDirCreateError     = '创建文件夹 %s 发生错误！';


//==============================================================================
// 以下常量用于数据库试题访问中
//==============================================================================
RSTQRecordNotFound         = '试题编号为 %s 的记录未找到！';


//==============================================================================
// 以下常用于操作题评分模块相关函数，
//==============================================================================
RSLoadLibraryError       ='装载模块 %s 时发生错误！';
RSGradeError           = '评分模块 %s 调用时发生错误，可能原因是：'+#13+#10+ '%s ！';


//==============================================================================
// 以下常量用于评分过程中显示信息
//==============================================================================
RSScoring             = '正在对 %s 进行评分，请等待！';



//==============================================================================
// 打开文件对话框文档过滤字符
//==============================================================================
RSWordDocFilter            = 'Word文档|*.doc';
RSExcelDocFilter           = 'Excel文档|*.xls';
RSPptDocFilter             = 'PowerPoint文档|*.ppt';


implementation

end.
