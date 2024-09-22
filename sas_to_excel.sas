***********************************************************************************************;
* 定义逻辑库                                                                                ;
***********************************************************************************************;
libname pad "C:\Users\33301\Downloads\coding\back";

***********************************************************************************************;
* 获取rawdata列表                                                                                 ;
***********************************************************************************************;
proc sql noprint;
  select strip(memname)
    into :data_lst separated by "|"
      from sashelp.vtable
        where libname="PAD";
quit;

%put &data_lst.;

***********************************************************************************************;
* 循环数据集输出excel格式                                                                              ;
***********************************************************************************************;
%macro re_ad;
/*清空临时循环体*/
%local dsnm;
%let dsnm=;

/*循环筛选*/
%do i=1 %to %sysfunc(countw("&data_lst.","|"));
  %let dsnm=%scan(&data_lst.,&i.,|);
	  proc export data= pad.&dsnm.
	    outfile="C:\Users\33301\Downloads\coding\res1\&dsnm.xlsx"
		dbms=excel replace;
	    sheet="&dsnm.";
	    newfile= no;
	  run;

%end;
%mend;
%re_ad;
